chmod +r /Users/sumapranithakonduru/Downloads/genre_table.csv



COPY comics_character_table (character_ID, character_name, character_info) 
FROM '/Users/sumapranithakonduru/Downloads/comics_character_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');

COPY comics_issue_table (issue_ID, current_value, searched, variant, issues_total, issue_date, title_ID) 
FROM '/Users/sumapranithakonduru/Downloads/comics_issue_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');


COPY comics_series_table (title_ID, title, volume, preview, cover_date, Genre_ID, pub_ID, creater_ID, character_ID, contributer_ID) 
FROM '/Users/sumapranithakonduru/Downloads/comics_series_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');


COPY contributor_table (contributer_ID, contributor_name, number_of_pages_worked) 
FROM '/Users/sumapranithakonduru/Downloads/contributor_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');


COPY creators_table (creator_ID, Creator_Name, Gender, Country) 
FROM '/Users/sumapranithakonduru/Downloads/creators_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');


COPY customers_table (customer_ID, customer_name, gender, phone_number) 
FROM '/Users/sumapranithakonduru/Downloads/customers_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');


COPY genre_table (Genre_ID, Genre_name) 
FROM '/Users/sumapranithakonduru/Downloads/genre_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');


COPY publisher_table (pub_id, pub_name, pub_titles_total, pub_issues_total) 
FROM '/Users/sumapranithakonduru/Downloads/publisher_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');


COPY rating_table (rating_ID, rating, customer_ID, title_ID) 
FROM '/Users/sumapranithakonduru/Downloads/rating_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');


COPY sales_table (sales_ID, Sale_Date, Price, customer_ID, title_ID) 
FROM '/Users/sumapranithakonduru/Downloads/sales_table.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');
