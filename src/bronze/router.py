"""
router.py
=========
Decides which Bronze table(s) each part of a payload belongs to.

A single NatGasHub payload routinely fans out into several Bronze tables. A firm
transportation posting, for example, contains a list of contracts, and each
contract carries nested location and rate arrays:

    feedType = "gTRAN_FIRM"
        contracts[]              -> bronze.gtran_firm        (one row per contract)
            contract.locations[] -> bronze.gtran_loc         (one row per location)
            contract.rates[]     -> bronze.gtran_rates       (one row per rate)

The interruptible feed ("gTRAN_IT") is structurally identical and targets the
*_it tables. The Index-of-Customers feed ("gINDEX") is flat (one table).

Header propagation
------------------
TSP-level fields (TspName, TspDuns, ...) declared once at the payload header are
merged into every contract; contract-level linkage fields (FirmId/InterruptibleId,
TspDuns, TspName, PostedDateTime) are merged down into child location/rate rows
when absent, so the Bronze rows remain self-describing for Silver to join.

Adding a new feed = adding one entry to FEED_REGISTRY. No new code paths.
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Any, Dict, Iterator, List, Optional

from . import validators


@dataclass
class ChildSpec:
    array_key: str          # key on the parent record holding the child list
    table: str              # target Bronze table
    id_field: str           # source key used as raw_record_id
    required: List[str]     # required fields for validation
    inherit: List[str]      # parent keys merged into each child if missing


@dataclass
class FeedSpec:
    feed_type: str
    records_key: str        # payload key holding the top-level record list
    parent_table: str       # target Bronze table for each top-level record
    parent_id_field: str
    parent_required: List[str]
    header_keys: List[str]  # payload-level keys merged into each record
    children: List[ChildSpec]


# --- shared linkage fields propagated from a firm/IT contract to its children
_FIRM_INHERIT = ["FirmId", "TspDuns", "TspName", "PostedDateTime", "Cycle"]
_IT_INHERIT = ["InterruptibleId", "TspDuns", "TspName", "PostedDateTime", "Cycle"]


FEED_REGISTRY: Dict[str, FeedSpec] = {
    "gTRAN_FIRM": FeedSpec(
        feed_type="gTRAN_FIRM",
        records_key="contracts",
        parent_table="gtran_firm",
        parent_id_field="Id",
        parent_required=["Id", "FirmId"],
        header_keys=["TspName", "TspDuns", "TspProp"],
        children=[
            ChildSpec("locations", "gtran_loc", "UniqueId",
                      required=["Loc", "UniqueId"], inherit=_FIRM_INHERIT),
            ChildSpec("rates", "gtran_rates", "UniqueId",
                      required=["UniqueId"], inherit=_FIRM_INHERIT),
        ],
    ),
    "gTRAN_IT": FeedSpec(
        feed_type="gTRAN_IT",
        records_key="contracts",
        parent_table="gtran_it",
        parent_id_field="Id",
        parent_required=["Id", "InterruptibleId"],
        header_keys=["TspName", "TspDuns", "TspProp"],
        children=[
            ChildSpec("locations", "gtran_it_loc", "UniqueId",
                      required=["Loc", "UniqueId"], inherit=_IT_INHERIT),
            ChildSpec("rates", "gtran_it_rates", "UniqueId",
                      required=["UniqueId"], inherit=_IT_INHERIT),
        ],
    ),
    "gINDEX": FeedSpec(
        feed_type="gINDEX",
        records_key="records",
        parent_table="gindex",
        parent_id_field="ID",
        parent_required=["ID", "Pipe"],
        header_keys=[],
        children=[],
    ),
}


@dataclass
class RoutedRecord:
    table: str
    record: Dict[str, Any]
    raw_record_id: str
    missing_fields: List[str]


def known_feeds() -> List[str]:
    return list(FEED_REGISTRY.keys())


def _merge_missing(base: Dict[str, Any], extra: Dict[str, Any], keys: List[str]) -> None:
    """Fill `base[k]` from `extra[k]` for each k in keys when base lacks it."""
    lower = {k.lower(): k for k in base}
    for key in keys:
        if key.lower() not in lower and key in extra:
            base[key] = extra[key]


def _get_id(record: Dict[str, Any], field: str) -> str:
    lower = {k.lower(): v for k, v in record.items()}
    val = lower.get(field.lower())
    return "" if val is None else str(val)


def route(payload: Dict[str, Any], feed_type: str) -> Iterator[RoutedRecord]:
    """Yield a RoutedRecord for every Bronze row implied by the payload."""
    spec = FEED_REGISTRY[feed_type]

    header = {k: payload[k] for k in spec.header_keys if k in payload}
    records = payload.get(spec.records_key) or []
    if not isinstance(records, list):
        records = [records]

    for raw in records:
        record = dict(raw)
        _merge_missing(record, header, spec.header_keys)

        parent_id = _get_id(record, spec.parent_id_field)
        # The parent's typed columns ignore the nested child arrays automatically
        # (they aren't business columns), but we keep them on the record so the
        # parent's raw_payload preserves the FULL original contract.
        yield RoutedRecord(
            table=spec.parent_table,
            record=record,
            raw_record_id=parent_id,
            missing_fields=validators.validate_record(record, spec.parent_required),
        )

        for child in spec.children:
            for child_raw in (record.get(child.array_key) or []):
                child_record = dict(child_raw)
                _merge_missing(child_record, record, child.inherit)
                yield RoutedRecord(
                    table=child.table,
                    record=child_record,
                    raw_record_id=_get_id(child_record, child.id_field),
                    missing_fields=validators.validate_record(
                        child_record, child.required
                    ),
                )
