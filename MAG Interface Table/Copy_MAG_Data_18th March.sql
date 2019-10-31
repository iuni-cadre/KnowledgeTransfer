\COPY mag_core.affiliations FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_affiliations.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER; 

\COPY mag_core.authors FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_authors.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.journals FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_journals.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.conference_series FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_conferenceSeries.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.fields_of_study FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_fieldsOfStudy.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.conference_instances FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_conferenceInstances.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.papers FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_papers.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.paper_resources FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_paperResources.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.related_field_of_study FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_relatedFieldOfStudy.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.paper_urls FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_paperURLs.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.paper_abstract_inverted_index FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_paperAbstractInvertedIndex.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.paper_author_affiliations FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_paperAuthorAffiliations.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

/* The paper citation contexts table has a problem with special characters or control characters. You may want to skip this table but you can try and see if it works for you */

\COPY mag_core.paper_citation_contexts FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_paperCitationContexts.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.paper_fields_of_study FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_paperFieldsOfStudy.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.paper_languages FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_paperLanguages.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.paper_recommendations FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_paperRecommendations.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.paper_references FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_paperReferences.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.fields_of_study_children FROM '/home/ubuntu/raw/CleanMAGData/mag_papers_1_fieldsOfStudyChildren.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;





\COPY mag_core.papers FROM '/home/ubuntu/mag_interface_table/mag_papers_1_papers.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;

\COPY mag_core.paper_author_affiliations FROM '/home/ubuntu/mag_interface_table/mag_papers_paperAuthorAffiliations.csv' DELIMITER '~' ENCODING 'UTF-8' CSV HEADER;





