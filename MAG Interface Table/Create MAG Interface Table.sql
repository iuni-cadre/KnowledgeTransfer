CREATE TABLE IF NOT EXISTS mag_core.interface_table (
paper_id varchar PRIMARY KEY,          
authors_id varchar[],
authors_sequence_number bigint, // This column will not be there in the final table
authors_display_name varchar[],  
authors_last_known_affiliation_id varchar[],    
journal_id varchar,
conference_series_id varchar,  
conference_instance_id varchar, 
paper_reference_id varchar[],
recommended_paper_id varchar[],
fields_of_study_id varchar[],
doi varchar,
doc_type varchar, 
paper_title varchar,
original_title varchar,
book_title varchar,
year varchar,
date timestamp,
paper_publisher varchar,  
issue varchar,    
paper_first_page varchar,        
paper_last_page varchar,       
paper_reference_count bigint, 
paper_citation_count bigint, 
paper_estimated_citation bigint,     
journal_display_name varchar, 
journal_issn varchar, 
journal_publisher varchar   
);

                