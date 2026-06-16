-- Auto-generated from src/bronze/schemas.py — do not hand-edit.
-- Regenerate with:  python -m src.bronze.schemas

CREATE SCHEMA IF NOT EXISTS bronze;

CREATE TABLE IF NOT EXISTS bronze."gtran_firm" (
    id BIGSERIAL PRIMARY KEY,
    "id"                         TEXT,            -- source type: varchar
    "tspname"                    TEXT,            -- source type: varchar
    "tspduns"                    TEXT,            -- source type: int
    "tspprop"                    TEXT,            -- source type: varchar
    "posteddatetime"             TEXT,            -- source type: datetime
    "firmid"                     TEXT,            -- source type: varchar
    "cycle"                      TEXT,            -- source type: varchar
    "amendrptg"                  TEXT,            -- source type: varchar
    "amendrptgdesc"              TEXT,            -- source type: varchar
    "kholdername"                TEXT,            -- source type: varchar
    "kholder"                    TEXT,            -- source type: int
    "kholderprop"                TEXT,            -- source type: varchar
    "svcreqk"                    TEXT,            -- source type: varchar
    "ratesch"                    TEXT,            -- source type: varchar
    "kqtyk"                      TEXT,            -- source type: int
    "kstat"                      TEXT,            -- source type: varchar
    "kstatdesc"                  TEXT,            -- source type: varchar
    "kbegdatetime"               TEXT,            -- source type: datetime
    "kenddatetime"               TEXT,            -- source type: datetime
    "kendind"                    TEXT,            -- source type: varchar
    "ngtdrateind"                TEXT,            -- source type: varchar
    "ngtdrateinddesc"            TEXT,            -- source type: varchar
    "pkgid"                      TEXT,            -- source type: varchar
    "kroll"                      TEXT,            -- source type: varchar
    "krolldesc"                  TEXT,            -- source type: varchar
    "affil"                      TEXT,            -- source type: varchar
    "affildesc"                  TEXT,            -- source type: varchar
    "captype"                    TEXT,            -- source type: varchar
    "captypename"                TEXT,            -- source type: varchar
    "captypeloc"                 TEXT,            -- source type: varchar
    "captypelocdesc"             TEXT,            -- source type: varchar
    "osid"                       TEXT,            -- source type: varchar
    "rte"                        TEXT,            -- source type: varchar
    "termsnotes"                 TEXT,            -- source type: varchar
    "createddatetime"            TEXT,            -- source type: datetime
    "reclocs"                    TEXT,            -- source type: varchar
    "dellocs"                    TEXT,            -- source type: varchar
    "maxratechgd"                TEXT,            -- source type: varchar
    "maxtrfrate"                 TEXT,            -- source type: varchar
    "otherrates"                 TEXT,            -- source type: varchar
    "otherratesdescription"      TEXT,            -- source type: varchar
    "otherratesbasis"            TEXT,            -- source type: varchar
    -- ---- pipeline metadata ----
    "raw_record_id"              VARCHAR(256),
    "hash_key"                   VARCHAR(64),
    "pipeline_run_id"            VARCHAR(64),
    "source_system"              VARCHAR(128),
    "source_api"                 VARCHAR(256),
    "source_file_name"           VARCHAR(512),
    "ingestion_timestamp"        TIMESTAMPTZ,
    "updated_ts"                 TIMESTAMPTZ,
    "ingestion_status"           VARCHAR(32),
    "raw_payload"                JSONB,
    CONSTRAINT "uq_gtran_firm_hash" UNIQUE (hash_key)
);
CREATE INDEX IF NOT EXISTS "ix_gtran_firm_run" ON bronze."gtran_firm" (pipeline_run_id);
CREATE INDEX IF NOT EXISTS "ix_gtran_firm_recid" ON bronze."gtran_firm" (raw_record_id);

CREATE TABLE IF NOT EXISTS bronze."gtran_it" (
    id BIGSERIAL PRIMARY KEY,
    "id"                         TEXT,            -- source type: varchar
    "tspname"                    TEXT,            -- source type: varchar
    "tspduns"                    TEXT,            -- source type: int
    "tspprop"                    TEXT,            -- source type: varchar
    "posteddatetime"             TEXT,            -- source type: datetime
    "interruptibleid"            TEXT,            -- source type: varchar
    "cycle"                      TEXT,            -- source type: varchar
    "amendrptg"                  TEXT,            -- source type: varchar
    "amendrptgdesc"              TEXT,            -- source type: varchar
    "kholdername"                TEXT,            -- source type: varchar
    "kholder"                    TEXT,            -- source type: int
    "kholderprop"                TEXT,            -- source type: varchar
    "svcreqk"                    TEXT,            -- source type: varchar
    "ratesch"                    TEXT,            -- source type: varchar
    "itqtyk"                     TEXT,            -- source type: int
    "kstat"                      TEXT,            -- source type: varchar
    "kstatdesc"                  TEXT,            -- source type: varchar
    "kbegdatetime"               TEXT,            -- source type: datetime
    "kenddatetime"               TEXT,            -- source type: datetime
    "ngtdrateind"                TEXT,            -- source type: varchar
    "ngtdrateinddesc"            TEXT,            -- source type: varchar
    "pkgid"                      TEXT,            -- source type: varchar
    "kroll"                      TEXT,            -- source type: varchar
    "krolldesc"                  TEXT,            -- source type: varchar
    "affil"                      TEXT,            -- source type: varchar
    "affildesc"                  TEXT,            -- source type: varchar
    "termsnotes"                 TEXT,            -- source type: varchar
    "createddatetime"            TEXT,            -- source type: datetime
    "reclocs"                    TEXT,            -- source type: varchar
    "dellocs"                    TEXT,            -- source type: varchar
    "maxratechgd"                TEXT,            -- source type: varchar
    "maxtrfrate"                 TEXT,            -- source type: varchar
    "otherrates"                 TEXT,            -- source type: varchar
    "otherratesdescription"      TEXT,            -- source type: varchar
    "otherratesbasis"            TEXT,            -- source type: varchar
    "dealtype"                   TEXT,            -- source type: varchar
    -- ---- pipeline metadata ----
    "raw_record_id"              VARCHAR(256),
    "hash_key"                   VARCHAR(64),
    "pipeline_run_id"            VARCHAR(64),
    "source_system"              VARCHAR(128),
    "source_api"                 VARCHAR(256),
    "source_file_name"           VARCHAR(512),
    "ingestion_timestamp"        TIMESTAMPTZ,
    "updated_ts"                 TIMESTAMPTZ,
    "ingestion_status"           VARCHAR(32),
    "raw_payload"                JSONB,
    CONSTRAINT "uq_gtran_it_hash" UNIQUE (hash_key)
);
CREATE INDEX IF NOT EXISTS "ix_gtran_it_run" ON bronze."gtran_it" (pipeline_run_id);
CREATE INDEX IF NOT EXISTS "ix_gtran_it_recid" ON bronze."gtran_it" (raw_record_id);

CREATE TABLE IF NOT EXISTS bronze."gindex" (
    id BIGSERIAL PRIMARY KEY,
    "id"                         TEXT,            -- source type: int
    "fercid"                     TEXT,            -- source type: varchar
    "pipe"                       TEXT,            -- source type: varchar
    "reportdate"                 TEXT,            -- source type: datetime
    "origrevised"                TEXT,            -- source type: int
    "tporuom"                    TEXT,            -- source type: varchar
    "storuom"                    TEXT,            -- source type: varchar
    "contact"                    TEXT,            -- source type: varchar
    "contactnumber"              TEXT,            -- source type: varchar
    "shipper"                    TEXT,            -- source type: varchar
    "shipperduns"                TEXT,            -- source type: int
    "ratesched"                  TEXT,            -- source type: varchar
    "k"                          TEXT,            -- source type: varchar
    "kstart"                     TEXT,            -- source type: date
    "kexp"                       TEXT,            -- source type: date
    "negrate"                    TEXT,            -- source type: varchar
    "tportmdq"                   TEXT,            -- source type: int
    "stormsq"                    TEXT,            -- source type: int
    "agentama"                   TEXT,            -- source type: varchar
    "agentamaaffiliation"        TEXT,            -- source type: varchar
    "ptidcode"                   TEXT,            -- source type: varchar
    "ptname"                     TEXT,            -- source type: varchar
    "ptidcodequal"               TEXT,            -- source type: varchar
    "ptidencode"                 TEXT,            -- source type: int
    "zone"                       TEXT,            -- source type: varchar
    "loctportmdq"                TEXT,            -- source type: int
    "locstormsq"                 TEXT,            -- source type: int
    "createddate"                TEXT,            -- source type: datetime
    "rateschedid"                TEXT,            -- source type: int
    "state"                      TEXT,            -- source type: varchar
    "county"                     TEXT,            -- source type: varchar
    "dunpce"                     TEXT,            -- source type: int
    -- ---- pipeline metadata ----
    "raw_record_id"              VARCHAR(256),
    "hash_key"                   VARCHAR(64),
    "pipeline_run_id"            VARCHAR(64),
    "source_system"              VARCHAR(128),
    "source_api"                 VARCHAR(256),
    "source_file_name"           VARCHAR(512),
    "ingestion_timestamp"        TIMESTAMPTZ,
    "updated_ts"                 TIMESTAMPTZ,
    "ingestion_status"           VARCHAR(32),
    "raw_payload"                JSONB,
    CONSTRAINT "uq_gindex_hash" UNIQUE (hash_key)
);
CREATE INDEX IF NOT EXISTS "ix_gindex_run" ON bronze."gindex" (pipeline_run_id);
CREATE INDEX IF NOT EXISTS "ix_gindex_recid" ON bronze."gindex" (raw_record_id);

CREATE TABLE IF NOT EXISTS bronze."gtran_loc" (
    id BIGSERIAL PRIMARY KEY,
    "index"                      TEXT,            -- source type: varchar
    "segment"                    TEXT,            -- source type: varchar
    "firmid"                     TEXT,            -- source type: varchar
    "uniqueid"                   TEXT,            -- source type: varchar
    "pk"                         TEXT,            -- source type: varchar
    "kqtyloc"                    TEXT,            -- source type: varchar
    "seasnlst"                   TEXT,            -- source type: varchar
    "seasnlend"                  TEXT,            -- source type: varchar
    "uniquekey"                  TEXT,            -- source type: varchar
    "id"                         TEXT,            -- source type: varchar
    "posteddatetime"             TEXT,            -- source type: datetime
    "kentbegdatetime"            TEXT,            -- source type: datetime
    "kentenddatetime"            TEXT,            -- source type: datetime
    "loc"                        TEXT,            -- source type: varchar
    "locname"                    TEXT,            -- source type: varchar
    "locpurp"                    TEXT,            -- source type: varchar
    "locpurpdesc"                TEXT,            -- source type: varchar
    "loczn"                      TEXT,            -- source type: varchar
    "locqti"                     TEXT,            -- source type: varchar
    "locqtidesc"                 TEXT,            -- source type: varchar
    "tspduns"                    TEXT,            -- source type: int
    "tspname"                    TEXT,            -- source type: varchar
    "createddatetime"            TEXT,            -- source type: datetime
    -- ---- pipeline metadata ----
    "raw_record_id"              VARCHAR(256),
    "hash_key"                   VARCHAR(64),
    "pipeline_run_id"            VARCHAR(64),
    "source_system"              VARCHAR(128),
    "source_api"                 VARCHAR(256),
    "source_file_name"           VARCHAR(512),
    "ingestion_timestamp"        TIMESTAMPTZ,
    "updated_ts"                 TIMESTAMPTZ,
    "ingestion_status"           VARCHAR(32),
    "raw_payload"                JSONB,
    CONSTRAINT "uq_gtran_loc_hash" UNIQUE (hash_key)
);
CREATE INDEX IF NOT EXISTS "ix_gtran_loc_run" ON bronze."gtran_loc" (pipeline_run_id);
CREATE INDEX IF NOT EXISTS "ix_gtran_loc_recid" ON bronze."gtran_loc" (raw_record_id);

CREATE TABLE IF NOT EXISTS bronze."gtran_it_loc" (
    id BIGSERIAL PRIMARY KEY,
    "index"                      TEXT,            -- source type: varchar
    "segment"                    TEXT,            -- source type: varchar
    "interruptibleid"            TEXT,            -- source type: varchar
    "uniqueid"                   TEXT,            -- source type: varchar
    "pk"                         TEXT,            -- source type: varchar
    "itqtyloc"                   TEXT,            -- source type: varchar
    "seasnlst"                   TEXT,            -- source type: varchar
    "seasnlend"                  TEXT,            -- source type: varchar
    "uniquekey"                  TEXT,            -- source type: varchar
    "id"                         TEXT,            -- source type: varchar
    "posteddatetime"             TEXT,            -- source type: datetime
    "kentbegdatetime"            TEXT,            -- source type: datetime
    "kentenddatetime"            TEXT,            -- source type: datetime
    "loc"                        TEXT,            -- source type: varchar
    "locname"                    TEXT,            -- source type: varchar
    "locpurp"                    TEXT,            -- source type: varchar
    "locpurpdesc"                TEXT,            -- source type: varchar
    "loczn"                      TEXT,            -- source type: varchar
    "locqti"                     TEXT,            -- source type: varchar
    "locqtidesc"                 TEXT,            -- source type: varchar
    "tspduns"                    TEXT,            -- source type: int
    "tspname"                    TEXT,            -- source type: varchar
    "createddatetime"            TEXT,            -- source type: datetime
    -- ---- pipeline metadata ----
    "raw_record_id"              VARCHAR(256),
    "hash_key"                   VARCHAR(64),
    "pipeline_run_id"            VARCHAR(64),
    "source_system"              VARCHAR(128),
    "source_api"                 VARCHAR(256),
    "source_file_name"           VARCHAR(512),
    "ingestion_timestamp"        TIMESTAMPTZ,
    "updated_ts"                 TIMESTAMPTZ,
    "ingestion_status"           VARCHAR(32),
    "raw_payload"                JSONB,
    CONSTRAINT "uq_gtran_it_loc_hash" UNIQUE (hash_key)
);
CREATE INDEX IF NOT EXISTS "ix_gtran_it_loc_run" ON bronze."gtran_it_loc" (pipeline_run_id);
CREATE INDEX IF NOT EXISTS "ix_gtran_it_loc_recid" ON bronze."gtran_it_loc" (raw_record_id);

CREATE TABLE IF NOT EXISTS bronze."gtran_rates" (
    id BIGSERIAL PRIMARY KEY,
    "seasnlst"                   TEXT,            -- source type: varchar
    "seasnlend"                  TEXT,            -- source type: varchar
    "firmid"                     TEXT,            -- source type: varchar
    "uniqueid"                   TEXT,            -- source type: varchar
    "pk"                         TEXT,            -- source type: varchar
    "rateformtype"               TEXT,            -- source type: varchar
    "rateformtypedesc"           TEXT,            -- source type: varchar
    "resratebasis"               TEXT,            -- source type: varchar
    "resratebasisdesc"           TEXT,            -- source type: varchar
    "lockmaxpress"               TEXT,            -- source type: varchar
    "lockminpress"               TEXT,            -- source type: varchar
    "minvolpctnoncaprel"         TEXT,            -- source type: varchar
    "minvolqtynoncaprel"         TEXT,            -- source type: varchar
    "captype"                    TEXT,            -- source type: varchar
    "captypename"                TEXT,            -- source type: varchar
    "captypeloc"                 TEXT,            -- source type: varchar
    "captypelocdesc"             TEXT,            -- source type: varchar
    "kqtyloc"                    TEXT,            -- source type: varchar
    "uniquekey"                  TEXT,            -- source type: varchar
    "id"                         TEXT,            -- source type: varchar
    "createddatetime"            TEXT,            -- source type: datetime
    "posteddatetime"             TEXT,            -- source type: datetime
    "kentbegdatetime"            TEXT,            -- source type: datetime
    "kentenddatetime"            TEXT,            -- source type: datetime
    "recloc"                     TEXT,            -- source type: varchar
    "reclocname"                 TEXT,            -- source type: varchar
    "reclocpurp"                 TEXT,            -- source type: varchar
    "reclocpurpdesc"             TEXT,            -- source type: varchar
    "recloczn"                   TEXT,            -- source type: varchar
    "delloc"                     TEXT,            -- source type: varchar
    "dellocname"                 TEXT,            -- source type: varchar
    "dellocpurp"                 TEXT,            -- source type: varchar
    "dellocpurpdesc"             TEXT,            -- source type: varchar
    "delloczn"                   TEXT,            -- source type: varchar
    "locqti"                     TEXT,            -- source type: varchar
    "locqtidesc"                 TEXT,            -- source type: varchar
    "rateid"                     TEXT,            -- source type: varchar
    "rateiddesc"                 TEXT,            -- source type: varchar
    "ratechgd"                   TEXT,            -- source type: varchar
    "ratechgdref"                TEXT,            -- source type: varchar
    "ratechgdrefdesc"            TEXT,            -- source type: varchar
    "maxtrfrate"                 TEXT,            -- source type: varchar
    "maxtrfrateref"              TEXT,            -- source type: varchar
    "maxtrfraterefdesc"          TEXT,            -- source type: varchar
    "mktbasedrateind"            TEXT,            -- source type: varchar
    "surchgid"                   TEXT,            -- source type: varchar
    "surchgiddesc"               TEXT,            -- source type: varchar
    "surchgind"                  TEXT,            -- source type: varchar
    "surchginddesc"              TEXT,            -- source type: varchar
    "totsurchg"                  TEXT,            -- source type: varchar
    "discbegdatetime"            TEXT,            -- source type: datetime
    "discenddatetime"            TEXT,            -- source type: datetime
    "rptlvl"                     TEXT,            -- source type: varchar
    "rptlvldesc"                 TEXT,            -- source type: varchar
    "tspduns"                    TEXT,            -- source type: int
    "tspname"                    TEXT,            -- source type: varchar
    "ngtdrateindrates"           TEXT,            -- source type: varchar
    -- ---- pipeline metadata ----
    "raw_record_id"              VARCHAR(256),
    "hash_key"                   VARCHAR(64),
    "pipeline_run_id"            VARCHAR(64),
    "source_system"              VARCHAR(128),
    "source_api"                 VARCHAR(256),
    "source_file_name"           VARCHAR(512),
    "ingestion_timestamp"        TIMESTAMPTZ,
    "updated_ts"                 TIMESTAMPTZ,
    "ingestion_status"           VARCHAR(32),
    "raw_payload"                JSONB,
    CONSTRAINT "uq_gtran_rates_hash" UNIQUE (hash_key)
);
CREATE INDEX IF NOT EXISTS "ix_gtran_rates_run" ON bronze."gtran_rates" (pipeline_run_id);
CREATE INDEX IF NOT EXISTS "ix_gtran_rates_recid" ON bronze."gtran_rates" (raw_record_id);

CREATE TABLE IF NOT EXISTS bronze."gtran_it_rates" (
    id BIGSERIAL PRIMARY KEY,
    "maxdq"                      TEXT,            -- source type: varchar
    "mindq"                      TEXT,            -- source type: varchar
    "seasnlst"                   TEXT,            -- source type: varchar
    "seasnlend"                  TEXT,            -- source type: varchar
    "interruptibleid"            TEXT,            -- source type: varchar
    "uniqueid"                   TEXT,            -- source type: varchar
    "pk"                         TEXT,            -- source type: varchar
    "rateformtype"               TEXT,            -- source type: varchar
    "rateformtypedesc"           TEXT,            -- source type: varchar
    "resratebasis"               TEXT,            -- source type: varchar
    "resratebasisdesc"           TEXT,            -- source type: varchar
    "lockmaxpress"               TEXT,            -- source type: varchar
    "lockminpress"               TEXT,            -- source type: varchar
    "minvolpctnoncaprel"         TEXT,            -- source type: varchar
    "minvolqtynoncaprel"         TEXT,            -- source type: varchar
    "captype"                    TEXT,            -- source type: varchar
    "captypename"                TEXT,            -- source type: varchar
    "captypeloc"                 TEXT,            -- source type: varchar
    "captypelocdesc"             TEXT,            -- source type: varchar
    "itqtyloc"                   TEXT,            -- source type: varchar
    "uniquekey"                  TEXT,            -- source type: varchar
    "id"                         TEXT,            -- source type: varchar
    "createddatetime"            TEXT,            -- source type: datetime
    "posteddatetime"             TEXT,            -- source type: datetime
    "kentbegdatetime"            TEXT,            -- source type: datetime
    "kentenddatetime"            TEXT,            -- source type: datetime
    "recloc"                     TEXT,            -- source type: varchar
    "reclocname"                 TEXT,            -- source type: varchar
    "reclocpurp"                 TEXT,            -- source type: varchar
    "reclocpurpdesc"             TEXT,            -- source type: varchar
    "recloczn"                   TEXT,            -- source type: varchar
    "delloc"                     TEXT,            -- source type: varchar
    "dellocname"                 TEXT,            -- source type: varchar
    "dellocpurp"                 TEXT,            -- source type: varchar
    "dellocpurpdesc"             TEXT,            -- source type: varchar
    "delloczn"                   TEXT,            -- source type: varchar
    "locqti"                     TEXT,            -- source type: varchar
    "locqtidesc"                 TEXT,            -- source type: varchar
    "rateid"                     TEXT,            -- source type: varchar
    "rateiddesc"                 TEXT,            -- source type: varchar
    "ratechgd"                   TEXT,            -- source type: varchar
    "ratechgdref"                TEXT,            -- source type: varchar
    "ratechgdrefdesc"            TEXT,            -- source type: varchar
    "maxtrfrate"                 TEXT,            -- source type: varchar
    "maxtrfrateref"              TEXT,            -- source type: varchar
    "maxtrfraterefdesc"          TEXT,            -- source type: varchar
    "mktbasedrateind"            TEXT,            -- source type: varchar
    "surchgid"                   TEXT,            -- source type: varchar
    "surchgiddesc"               TEXT,            -- source type: varchar
    "surchgind"                  TEXT,            -- source type: varchar
    "surchginddesc"              TEXT,            -- source type: varchar
    "totsurchg"                  TEXT,            -- source type: varchar
    "discbegdatetime"            TEXT,            -- source type: datetime
    "discenddatetime"            TEXT,            -- source type: datetime
    "rptlvl"                     TEXT,            -- source type: varchar
    "rptlvldesc"                 TEXT,            -- source type: varchar
    "tspduns"                    TEXT,            -- source type: int
    "tspname"                    TEXT,            -- source type: varchar
    "ngtdrateindrates"           TEXT,            -- source type: varchar
    -- ---- pipeline metadata ----
    "raw_record_id"              VARCHAR(256),
    "hash_key"                   VARCHAR(64),
    "pipeline_run_id"            VARCHAR(64),
    "source_system"              VARCHAR(128),
    "source_api"                 VARCHAR(256),
    "source_file_name"           VARCHAR(512),
    "ingestion_timestamp"        TIMESTAMPTZ,
    "updated_ts"                 TIMESTAMPTZ,
    "ingestion_status"           VARCHAR(32),
    "raw_payload"                JSONB,
    CONSTRAINT "uq_gtran_it_rates_hash" UNIQUE (hash_key)
);
CREATE INDEX IF NOT EXISTS "ix_gtran_it_rates_run" ON bronze."gtran_it_rates" (pipeline_run_id);
CREATE INDEX IF NOT EXISTS "ix_gtran_it_rates_recid" ON bronze."gtran_it_rates" (raw_record_id);

CREATE TABLE IF NOT EXISTS bronze."ingestion_log" (
    log_id BIGSERIAL PRIMARY KEY,
    pipeline_name           VARCHAR(128),
    pipeline_layer          VARCHAR(32),
    pipeline_run_id         VARCHAR(64),
    activity_name           VARCHAR(128),
    activity_run_id         VARCHAR(64),
    source_system           VARCHAR(128),
    source_api              VARCHAR(256),
    source_file_name        VARCHAR(512),
    triggered_by            VARCHAR(256),
    pipeline_start_ts       TIMESTAMPTZ,
    pipeline_end_ts         TIMESTAMPTZ,
    activity_duration_secs  NUMERIC,
    objects_read            INTEGER,
    rows_written            INTEGER,
    rows_rejected           INTEGER,
    pipeline_status         VARCHAR(32),
    data_validation_status  VARCHAR(32),
    error_details           TEXT,
    logged_at_ts            TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX IF NOT EXISTS "ix_ingestion_log_run"
    ON bronze."ingestion_log" (pipeline_run_id);

