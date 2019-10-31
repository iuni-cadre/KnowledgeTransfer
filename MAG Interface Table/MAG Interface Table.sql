MAG Interface Table

        Column                              Type                                            
----------------------                ----------------------
 paper_id                                   varchar           
 authors_id			            varchar ARRAY/ varchar[] or text (pipe delimited)
 journal_id                                 varchar
 affiliation_id                             varchar ARRAY/ varchar[ARRAY/ varchar[]] or text (doubely pipe delimited)
 conference_series_id                       varchar  
 conference_instance_id                     varchar  
 fields_of_study_id                         varchar
 paper_reference_id                         varchar ARRAY/ varchar[] or text (pipe delimited)
 recommended_paper_id                       varchar ARRAY/ varchar[] or text (pipe delimited)
 affiliation_display_name                   varchar ARRAY/ varchar[ARRAY/ varchar[]] or text (doubely pipe delimited)
 authors_display_name                       varchar ARRAY/ varchar[] or text (pipe delimited)  
 authors_sequence_number                    bigint 
 authors_last_known_affiliation_id          varchar ARRAY/ varchar[] or text (pipe delimited)    
 doi                                        varchar
 doc_type                                   varchar 
 paper_title                                varchar
 original_title                             varchar
 book_title                                 varchar
 year                                       varchar 
 date                                       timestamp
 paper_publisher                            varchar  
 issue                                      varchar    
 paper_first_page                           varchar        
 paper_last_page                            varchar       
 paper_reference_count                      bigint 
 paper_citation_count                       bigint 
 paper_estimated_citation                   bigint     
 journal_display_name                       varchar 
 journal_issn                               varchar 
 journal_publisher                          varchar                   
  
Author's Names and Author's Id will be ordered according to the authors_sequence_number. Author's sequence number will not feature in the final table,

Affiliations have to correctly nested for each author.