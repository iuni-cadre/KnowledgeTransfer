CREATE TABLE IF NOT EXISTS mag_core.affiliations (
affiliation_id varchar PRIMARY KEY,
rank bigint CHECK (rank > 0),
normalized_name varchar,
display_name varchar,
grid_id varchar,
official_page varchar,
wiki_page varchar,
paper_count bigint DEFAULT 0,
citation_count bigint DEFAULT 0,
created_date varchar NOT NULL
);


CREATE TABLE IF NOT EXISTS mag_core.authors (
author_id varchar PRIMARY KEY,
rank bigint CHECK (rank > 0),
normalized_name varchar,
display_name varchar,
last_known_affiliation_id varchar,
paper_count bigint,
citation_count bigint,
created_date varchar NOT NULL
);


CREATE TABLE IF NOT EXISTS mag_core.journals (
journal_id varchar PRIMARY KEY,
rank bigint CHECK (rank > 0),
normalized_name varchar,
display_name varchar,
issn varchar,
publisher varchar,
web_page varchar,
paper_count bigint,
citation_count bigint,
created_date varchar NOT NULL
);


CREATE TABLE IF NOT EXISTS mag_core.conference_series (
conference_series_id varchar PRIMARY KEY,
rank bigint CHECK (rank > 0),
normalized_name varchar,
display_name varchar,
paper_count bigint,
citation_count bigint,
created_date varchar NOT NULL
);


CREATE TABLE IF NOT EXISTS mag_core.fields_of_study (
field_of_study_id varchar PRIMARY KEY,
rank bigint CHECK (rank > 0),
normalized_name varchar,
display_name varchar,
main_type varchar,
level integer CHECK (level < 6),
CHECK (level > -1),
paper_count bigint,
citation_count bigint,
created_date varchar NOT NULL
);


CREATE TABLE IF NOT EXISTS mag_core.conference_instances (
conference_instance_id varchar PRIMARY KEY,
normalized_name varchar,
display_name varchar,
conference_series_id varchar REFERENCES mag_core.conference_series(conference_series_id),
location varchar,
official_url varchar,
start_date varchar,
end_date varchar,
abstract_registration_date varchar,
submission_deadline_date varchar,
notification_due_date varchar,
final_version_due_date varchar,
paper_count bigint,
citation_count bigint,
created_date varchar NOT NULL
);



CREATE TABLE IF NOT EXISTS mag_core.papers (
paper_id varchar PRIMARY KEY,
rank bigint CHECK (rank > 0),
doi varchar,
doc_type varchar,
paper_title varchar,
original_title varchar,
book_title varchar,
year varchar,
date timestamp,
publisher varchar,
journal_id varchar,
conference_series_id varchar,
conference_instance_id varchar,
volume varchar,
issue varchar,
first_page varchar,
last_page varchar,
reference_count bigint,
citation_count bigint,
estimated_citation bigint,
original_venue varchar,
created_date varchar NOT NULL
);



CREATE TABLE IF NOT EXISTS mag_core.paper_resources (
paper_id varchar,
resource_type integer,
resource_url varchar,
source_url varchar,
relationship_type integer
);



CREATE TABLE IF NOT EXISTS mag_core.related_field_of_study (
field_of_study_id1 varchar REFERENCES mag_core.fields_of_study(field_of_study_id),
type1 varchar,
field_of_study_id2 varchar REFERENCES mag_core.fields_of_study(field_of_study_id),
type2 varchar,
rank numeric
);



CREATE TABLE IF NOT EXISTS mag_core.paper_urls (
paper_id varchar,
source_type varchar,
source_url varchar
);



CREATE TABLE IF NOT EXISTS mag_core.paper_abstract_inverted_index (
paper_id varchar,
indexed_abstract varchar
);


CREATE TABLE IF NOT EXISTS mag_core.paper_author_affiliations (
paper_id varchar,
author_id varchar,
affiliation_id varchar,
author_sequence_number bigint CHECK (author_sequence_number > 0),
original_affiliation varchar
);



CREATE TABLE IF NOT EXISTS mag_core.paper_citation_contexts (
paper_id varchar,
paper_reference_id varchar,
citation_context varchar
);


CREATE TABLE IF NOT EXISTS mag_core.paper_fields_of_study (
paper_id varchar,
field_of_study_id varchar,
score numeric
);


CREATE TABLE IF NOT EXISTS mag_core.paper_languages (
paper_id varchar,
language_code varchar
);


CREATE TABLE IF NOT EXISTS mag_core.paper_recommendations (
paper_id varchar,
recommended_paper_id varchar,
score numeric
);


CREATE TABLE IF NOT EXISTS mag_core.paper_references (
paper_id varchar,
paper_reference_id varchar
);



CREATE TABLE IF NOT EXISTS mag_core.fields_of_study_children (
field_of_study_id varchar REFERENCES mag_core.fields_of_study(field_of_study_id),
child_field_of_study_id varchar REFERENCES mag_core.fields_of_study(field_of_study_id)
);





              Column               |       Type        | Collation | Nullable | Default
-----------------------------------+-------------------+-----------+----------+---------
 paper_id                          | character varying |           |          |
 author_id                         | text              |           |          |
 author_sequence_number            | bigint[]          |           |          |
 authors_display_name              | text              |           |          |
 authors_last_known_affiliation_id | text              |           |          |
 paper_title                       | text              |           |          |
 year                              | text              |           |          |



CREATE TABLE IF NOT EXISTS mag_core.interface_4 (
paper_id varchar,
author_id text,
author_sequence_number bigint[],
authors_display_name text,
authors_last_known_affiliation_id text,
paper_title text,
year text
);