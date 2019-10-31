/* This is the intermediate table that will extract values from the paper table */

CREATE TABLE IF NOT EXISTS mag_core.interface_1 AS
SELECT paper_id as paper_id, 
doi as doi, 
doc_type as doc_type,
journal_id as journal_id, 
conference_series_id as conference_series_id,
conference_instance_id as conference_instance_id,
paper_title as paper_title,
original_title as original_title,
book_title as book_title,
year as year,
date as date,
publisher as paper_publisher,
issue as issue,
first_page as paper_first_page,        
last_page as paper_last_page,     
reference_count as paper_reference_count, 
citation_count as paper_citation_count, 
estimated_citation as paper_estimated_citation
FROM 
	mag_core.papers
;

/* This is the intermediate table that will extract values from the journals table 
This will generate journal_id, display_name, issn and journals.publisher for all the rows in the papers table.
*/

CREATE TABLE mag_core.interface_2 AS
SELECT interface_1.paper_id as paper_id,
       interface_1.journal_id as journal_id,
       interface_1.conference_series_id as conference_series_id,
       interface_1.conference_instance_id as conference_instance_id,
       interface_1.doi as doi,
       interface_1.doc_type as doc_type,
       interface_1.paper_title as paper_title,
       interface_1.original_title as original_title,
       interface_1.book_title as book_title,
       interface_1.year as year,
       interface_1.date as date,
       interface_1.paper_publisher as paper_publisher,
       interface_1.issue as issue,
       interface_1.paper_first_page as paper_first_page,
       interface_1.paper_last_page as paper_last_page,
       interface_1.paper_reference_count as paper_reference_count,
       interface_1.paper_citation_count as paper_citation_count,
       interface_1.paper_estimated_citation as paper_estimated_citation,
       display_name as journal_display_name,
       issn as journal_issn,
       journals.publisher as journal_publisher
FROM
mag_core.journals
RIGHT JOIN mag_core.interface_1
 ON(interface_1.journal_id = journals.journal_id)
;

/* This is the intermediate table that will extract values from the paper author affiliations table 
This will generate author_id and author_sequence_number for all the rows in the papers table.
*/

CREATE TABLE mag_core.interface_3 AS
SELECT interface_2.paper_id as paper_id,
	string_agg(DISTINCT author_id, '|') as author_id,
	string_agg(DISTINCT cast(author_sequence_number as varchar), '|') as author_sequence_number,
	max(interface_2.journal_id) as journal_id,
	max(interface_2.conference_series_id) as conference_series_id,
	max(interface_2.conference_instance_id) as conference_instance_id,
	max(interface_2.doi) as doi, 
	max(interface_2.doc_type) as doc_type,
    max(interface_2.paper_title) as paper_title,
	max(interface_2.original_title) as original_title,
	max(interface_2.book_title) as book_title,
	max(interface_2.year) as year,
	max(interface_2.date) as date,
	max(interface_2.paper_publisher) as paper_publisher,
	max(interface_2.issue) as issue,
	max(interface_2.paper_first_page) as paper_first_page,        
	max(interface_2.paper_last_page) as paper_last_page,     
    max(interface_2.paper_reference_count) as paper_reference_count, 
    max(interface_2.paper_citation_count) as paper_citation_count, 
	max(interface_2.paper_estimated_citation) as paper_estimated_citation,
    max(interface_2.journal_display_name) as journal_display_name, 
	max(interface_2.journal_issn) as journal_issn, 
	max(interface_2.journal_publisher) as journal_publisher   
FROM 
    mag_core.paper_author_affiliations
RIGHT JOIN mag_core.interface_2
	ON(interface_2.paper_id = paper_author_affiliations.paper_id)
GROUP BY interface_2.paper_id
ORDER BY author_sequence_number ASC
;

/* This is the intermediate table that will extract values from the authors table 
This will generate authors_display_name and authors_last_known_affiliation_id for all the rows in the papers table.*/

CREATE TABLE mag_core.interface_4 AS
SELECT interface_3.paper_id as paper_id,
       string_agg(DISTINCT interface_3.author_id, '|') as author_id,
       string_agg(DISTINCT cast(interface_3.author_sequence_number as varchar), '|') as author_sequence_number,
       max(interface_3.journal_id) as journal_id,
       max(interface_3.conference_series_id) as conference_series_id,
       max(interface_3.conference_instance_id) as conference_instance_id,
       string_agg(DISTINCT display_name, '|') as authors_display_name,
       string_agg(DISTINCT last_known_affiliation_id, '|') as authors_last_known_affiliation_id, 
       max(interface_3.doi) as doi, 
       max(interface_3.doc_type) as doc_type,
       max(interface_3.paper_title) as paper_title,
       max(interface_3.original_title) as original_title,
       max(interface_3.book_title) as book_title,
       max(interface_3.year) as year,
       max(interface_3.date) as date,
       max(interface_3.paper_publisher) as paper_publisher,
       max(interface_3.issue) as issue,
       max(interface_3.paper_first_page) as paper_first_page,        
       max(interface_3.paper_last_page) as paper_last_page,     
       max(interface_3.paper_reference_count) as paper_reference_count, 
       max(interface_3.paper_citation_count) as paper_citation_count, 
       max(interface_3.paper_estimated_citation) as paper_estimated_citation,
       max(interface_3.journal_display_name) as journal_display_name, 
       max(interface_3.journal_issn) as journal_issn, 
       max(interface_3.journal_publisher) as journal_publisher
FROM 
	mag_core.authors
RIGHT JOIN mag_core.interface_3
	ON(interface_3.author_id = authors.author_id)
GROUP BY interface_3.paper_id
ORDER BY author_sequence_number ASC
;

/* This is the intermediate table that will extract values from the paper_references table 
This will generate paper_reference_id for all the rows in the papers table.*/

CREATE TABLE mag_core.interface_5 AS
SELECT interface_4.paper_id as paper_id,
       string_agg(DISTINCT interface_4.author_id, '|') as author_id,
       string_agg(DISTINCT cast(interface_4.author_sequence_number as varchar), '|') as author_sequence_number,
       max(interface_4.journal_id) as journal_id,
       max(interface_4.conference_series_id) as conference_series_id,
       max(interface_4.conference_instance_id) as conference_instance_id,
       string_agg(DISTINCT paper_reference_id, '|') as paper_reference_id,
       string_agg(DISTINCT interface_4.authors_display_name, '|') as authors_display_name,
       string_agg(DISTINCT interface_4.authors_last_known_affiliation_id, '|') as authors_last_known_affiliation_id, 
       max(interface_4.doi) as doi, 
       max(interface_4.doc_type) as doc_type,
       max(interface_4.paper_title) as paper_title,
       max(interface_4.original_title) as original_title,
       max(interface_4.book_title) as book_title,
       max(interface_4.year) as year,
       max(interface_4.date) as date,
       max(interface_4.paper_publisher) as paper_publisher,
       max(interface_4.issue) as issue,
       max(interface_4.paper_first_page) as paper_first_page,        
       max(interface_4.paper_last_page) as paper_last_page,     
       max(interface_4.paper_reference_count) as paper_reference_count, 
       max(interface_4.paper_citation_count) as paper_citation_count, 
       max(interface_4.paper_estimated_citation) as paper_estimated_citation,
       max(interface_4.journal_display_name) as journal_display_name, 
       max(interface_4.journal_issn) as journal_issn, 
       max(interface_4.journal_publisher) as journal_publisher
FROM 
	mag_core.paper_references 
RIGHT JOIN mag_core.interface_4
	ON(paper_references.paper_id = interface_4.paper_id)
GROUP BY interface_4.paper_id
ORDER BY author_sequence_number ASC
;	

/* This is the intermediate table that will extract values from the paper_recommendations table 
This will generate recommended_paper_id for all the rows in the papers table.*/

CREATE TABLE mag_core.interface_6 AS
SELECT interface_5.paper_id as paper_id,
       max(interface_5.author_id) as author_id,
       max(interface_5.author_sequence_number) as author_sequence_number,
       max(interface_5.journal_id) as journal_id,
       max(interface_5.conference_series_id) as conference_series_id,
       max(interface_5.conference_instance_id) as conference_instance_id,
       max(interface_5.paper_reference_id) as paper_reference_id,
       string_agg(DISTINCT recommended_paper_id, '|') as recommended_paper_id,
       string_agg(interface_5.authors_display_name::varchar, '|' ORDER BY author_sequence_number::bigint) as authors_display_name,
       string_agg(interface_5.authors_last_known_affiliation_id::varchar, '|' ORDER BY author_sequence_number::bigint) as authors_last_known_affiliation_id,
       max(interface_5.doi) as doi, 
       max(interface_5.doc_type) as doc_type,
       max(interface_5.paper_title) as paper_title,
       max(interface_5.original_title) as original_title,
       max(interface_5.book_title) as book_title,
       max(interface_5.year) as year,
       max(interface_5.date) as date, 
       max(interface_5.paper_publisher) as paper_publisher,
       max(interface_5.issue) as issue,
       max(interface_5.paper_first_page) as paper_first_page,        
       max(interface_5.paper_last_page) as paper_last_page,     
       max(interface_5.paper_reference_count) as paper_reference_count, 
       max(interface_5.paper_citation_count) as paper_citation_count, 
       max(interface_5.paper_estimated_citation) as paper_estimated_citation,
       max(interface_5.journal_display_name) as journal_display_name, 
       max(interface_5.journal_issn) as journal_issn, 
       max(interface_5.journal_publisher) as journal_publisher                      
FROM 
	mag_core.paper_recommendations
RIGHT JOIN mag_core.interface_5
	ON(paper_recommendations.paper_id = interface_5.paper_id)
GROUP BY interface_5.paper_id
;	

      
/* This is the intermediate table that will extract values from the paper_fields_of_study table 
This will generate field_of_study_id for all the rows in the papers table.*/

CREATE TABLE mag_core.interface_7 AS
SELECT interface_6.paper_id as paper_id,
       max(interface_6.author_id) as author_id,
       max(interface_6.author_sequence_number) as author_sequence_number,
       string_agg(DISTINCT interface_6.authors_display_name, '|') as authors_display_name,
       string_agg(DISTINCT interface_6.authors_last_known_affiliation_id, '|') as authors_last_known_affiliation_id,
       max(interface_6.journal_id) as journal_id,
       max(interface_6.conference_series_id) as conference_series_id,
       max(interface_6.conference_instance_id) as conference_instance_id,
       max(interface_6.paper_reference_id) as paper_reference_id,
       max(interface_6.recommended_paper_id) as recommended_paper_id,
       string_agg(DISTINCT field_of_study_id, '|') as field_of_study_id,
       max(interface_6.doi) as doi,
       max(interface_6.doc_type) as doc_type,
       max(interface_6.paper_title) as paper_title,
       max(interface_6.original_title) as original_title,
       max(interface_6.book_title) as book_title,
       max(interface_6.year) as year,
       max(interface_6.date) as date,
       max(interface_6.paper_publisher) as paper_publisher,
       max(interface_6.issue) as issue,
       max(interface_6.paper_first_page) as paper_first_page,
       max(interface_6.paper_last_page) as paper_last_page,
       max(interface_6.paper_reference_count) as paper_reference_count,
       max(interface_6.paper_citation_count) as paper_citation_count,
       max(interface_6.paper_estimated_citation) as paper_estimated_citation,
       max(interface_6.journal_display_name) as journal_display_name,
       max(interface_6.journal_issn) as journal_issn,
       max(interface_6.journal_publisher) as journal_publisher
FROM
mag_core.paper_fields_of_study
RIGHT JOIN mag_core.interface_6
 ON(paper_fields_of_study.paper_id = interface_6.paper_id)
GROUP BY interface_6.paper_id
;


/* This is the intermediate table that will extract values from the conference instances table 
This will generate conference display name for all the rows in the papers table.*/

CREATE TABLE mag_core.interface_8 AS
SELECT interface_7.paper_id as paper_id,
       max(interface_7.author_id) as author_id,
       max(interface_7.author_sequence_number) as author_sequence_number,
       max(interface_7.authors_display_name) as authors_display_name,
       max(interface_7.authors_last_known_affiliation_id) as authors_last_known_affiliation_id,
       max(interface_7.journal_id) as journal_id,
       max(interface_7.conference_series_id) as conference_series_id,
       max(interface_7.conference_instance_id) as conference_instance_id,
       max(interface_7.paper_reference_id) as paper_reference_id,
       max(interface_7.recommended_paper_id) as recommended_paper_id,
       max(interface_7.field_of_study_id) as field_of_study_id,
       max(interface_7.doi) as doi,
       max(interface_7.doc_type) as doc_type,
       max(interface_7.paper_title) as paper_title,
       max(interface_7.original_title) as original_title,
       max(interface_7.book_title) as book_title,
       max(interface_7.year) as year,
       max(interface_7.date) as date,
       max(interface_7.paper_publisher) as paper_publisher,
       max(interface_7.issue) as issue,
       max(interface_7.paper_first_page) as paper_first_page,
       max(interface_7.paper_last_page) as paper_last_page,
       max(interface_7.paper_reference_count) as paper_reference_count,
       max(interface_7.paper_citation_count) as paper_citation_count,
       max(interface_7.paper_estimated_citation) as paper_estimated_citation,
       max(conference_instances.display_name) as conference_display_name,
       max(interface_7.journal_display_name) as journal_display_name,
       max(interface_7.journal_issn) as journal_issn,
       max(interface_7.journal_publisher) as journal_publisher
FROM 
	mag_core.conference_instances
RIGHT JOIN mag_core.interface_7
	ON(conference_instances.conference_instance_id = interface_7.conference_instance_id)
GROUP BY interface_7.paper_id
;

/* This is the intermediate table that will extract values from the paper abstract table
This will generate the abstract for all the rows in the papers table.*/

CREATE TABLE mag_core.interface_9 AS
SELECT interface_8.paper_id as paper_id,
       max(interface_8.author_id) as author_id,
       max(interface_8.author_sequence_number) as author_sequence_number,
       max(interface_8.authors_display_name) as authors_display_name,
       max(interface_8.authors_last_known_affiliation_id) as authors_last_known_affiliation_id,
       max(interface_8.journal_id) as journal_id,
       max(interface_8.conference_series_id) as conference_series_id,
       max(interface_8.conference_instance_id) as conference_instance_id,
       max(interface_8.paper_reference_id) as paper_reference_id,
       max(interface_8.recommended_paper_id) as recommended_paper_id,
       max(interface_8.field_of_study_id) as field_of_study_id,
       max(interface_8.doi) as doi,
       max(interface_8.doc_type) as doc_type,
       max(interface_8.paper_title) as paper_title,
       max(interface_8.original_title) as original_title,
       max(interface_8.book_title) as book_title,
       max(interface_8.year) as year,
       max(interface_8.date) as date,
       max(interface_8.paper_publisher) as paper_publisher,
       max(interface_8.issue) as issue,
       max(paper_abstract.abstract) as paper_abstract,
       max(interface_8.paper_first_page) as paper_first_page,
       max(interface_8.paper_last_page) as paper_last_page,
       max(interface_8.paper_reference_count) as paper_reference_count,
       max(interface_8.paper_citation_count) as paper_citation_count,
       max(interface_8.paper_estimated_citation) as paper_estimated_citation,
       max(interface_8.conference_display_name) as conference_display_name,
       max(interface_8.journal_display_name) as journal_display_name,
       max(interface_8.journal_issn) as journal_issn,
       max(interface_8.journal_publisher) as journal_publisher
FROM 
	mag_core.paper_abstract
RIGHT JOIN mag_core.interface_8
	ON(paper_abstract.paper_id = interface_8.paper_id)
GROUP BY interface_8.paper_id
;



CREATE TABLE mag_core.mag_interface_table AS
SELECT interface_9.paper_id as paper_id,
       max(interface_9.author_id) as author_id,
       max(interface_9.author_sequence_number) as author_sequence_number,
       max(interface_8.authors_display_name) as authors_display_name,
       max(interface_8.authors_last_known_affiliation_id) as authors_last_known_affiliation_id,
       max(interface_9.journal_id) as journal_id,
       max(interface_9.conference_series_id) as conference_series_id,
       max(interface_9.conference_instance_id) as conference_instance_id,
       max(interface_9.paper_reference_id) as paper_reference_id,
       max(interface_9.recommended_paper_id) as recommended_paper_id,
       max(interface_9.field_of_study_id) as field_of_study_id,
       max(interface_9.doi) as doi,
       max(interface_9.doc_type) as doc_type,
       max(interface_9.paper_title) as paper_title,
       max(interface_9.original_title) as original_title,
       max(interface_9.book_title) as book_title,
       max(interface_9.year) as year,
       max(interface_9.date) as date,
       max(interface_9.paper_publisher) as paper_publisher,
       max(interface_9.issue) as issue,
       max(interface_9.paper_abstract) as paper_abstract,
       max(interface_9.paper_first_page) as paper_first_page,
       max(interface_9.paper_last_page) as paper_last_page,
       max(interface_9.paper_reference_count) as paper_reference_count,
       max(interface_9.paper_citation_count) as paper_citation_count,
       max(interface_9.paper_estimated_citation) as paper_estimated_citation,
       max(interface_9.conference_display_name) as conference_display_name,
       max(interface_9.journal_display_name) as journal_display_name,
       max(interface_9.journal_issn) as journal_issn,
       max(interface_9.journal_publisher) as journal_publisher
FROM 
	mag_core.interface_9
RIGHT JOIN mag_core.interface_8
	ON(interface_8.paper_id = interface_9.paper_id)
GROUP BY interface_9.paper_id
;