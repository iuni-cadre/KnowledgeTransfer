ALTER TABLE mag_core.interface_table ADD PRIMARY KEY (id); 

ALTER TABLE mag_core.mag_interface_table ADD COLUMN paper_title_tsv tsvector;
ALTER TABLE mag_core.mag_interface_table ADD COLUMN journal_display_name_tsv tsvector;
ALTER TABLE mag_core.mag_interface_table ADD COLUMN conference_display_name_tsv tsvector;
ALTER TABLE mag_core.mag_interface_table ADD COLUMN paper_abstract_tsv tsvector;


UPDATE mag_core.mag_interface_table SET paper_title_tsv = to_tsvector(mag_interface_table.paper_title);
UPDATE mag_core.mag_interface_table SET journal_display_name_tsv = to_tsvector(journal_display_name);
UPDATE mag_core.mag_interface_table SET paper_abstract_tsv = to_tsvector(paper_abstract);
UPDATE mag_core.mag_interface_table SET conference_display_name_tsv = to_tsvector(conference_display_name);


CREATE INDEX paper_title_tsv_idx ON mag_core.mag_interface_table USING GIN(paper_title_tsv); 
CREATE INDEX journal_display_name_idx ON mag_core.mag_interface_table USING GIN(journal_display_name gin_trgm_ops); 
CREATE INDEX paper_abstract_tsv_idx ON mag_core.mag_interface_table USING GIN(paper_abstract_tsv); 
CREATE INDEX conference_display_name_tsv_idx ON mag_core.mag_interface_table USING GIN(conference_display_name_tsv); 

--Trigram indexes: https://scoutapp.com/blog/how-to-make-text-searches-in-postgresql-faster-with-trigram-similarity

CREATE EXTENSION pg_trgm;

CREATE INDEX journal_display_name_idx ON mag_core.mag_interface_table USING GIN(journal_display_name gin_trgm_ops); 

CREATE INDEX authors_display_name_idx ON mag_core.mag_interface_table USING GIN (authors_display_name gin_trgm_ops);

CREATE INDEX conference_display_name_idx ON mag_core.mag_interface_table USING GIN (conference_display_name gin_trgm_ops);

CREATE INDEX year_idx ON mag_core.mag_interface_table USING btree (year);

CREATE INDEX mag_doi_idx ON mag_core.mag_interface_table USING btree (doi);










