INSERT INTO comics_character_table (character_ID, character_name, character_info)
VALUES (1, 'Spider-Byte', 'A tech-savvy superhero.'),
       (2, 'Captain Chronicle', 'A hero who manipulates time.');

INSERT INTO genre_table (Genre_ID, Genre_name)
VALUES (1, 'Superhero'), (2, 'Science Fiction');

DELETE FROM comics_issue_table WHERE current_value < 5.0;

DELETE FROM publisher_table
WHERE pub_id NOT IN (SELECT pub_ID FROM comics_series_table);

UPDATE creators_table SET Creator_Name = 'John Doe' WHERE Creator_Name = 'Jhon Doe';

UPDATE comics_issue_table SET current_value = current_value * 1.10 WHERE variant = TRUE;

SELECT p.pub_name, AVG(i.current_value) AS average_value, COUNT(distinct c.character_ID) AS number_of_characters
FROM publisher_table p
JOIN comics_series_table s ON p.pub_id = s.pub_ID
JOIN comics_issue_table i ON s.title_ID = i.title_ID
JOIN comics_character_table c ON s.character_ID = c.character_ID
GROUP BY p.pub_name
HAVING AVG(i.current_value) > 20.0;

SELECT p.pub_name, COUNT(c.title_ID) AS num_titles
FROM publisher_table p
JOIN comics_series_table c ON p.pub_id = c.pub_ID
GROUP BY p.pub_name;


SELECT cs.title, cs.volume, p.pub_name, AVG(r.rating) AS avg_rating
FROM comics_series_table cs
JOIN publisher_table p ON cs.pub_ID = p.pub_id
JOIN rating_table r ON cs.title_ID = r.title_ID
WHERE cs.volume IN (SELECT volume FROM comics_series_table WHERE preview = TRUE AND cover_date > '2020-01-01')
GROUP BY cs.title, cs.volume, p.pub_name
HAVING AVG(r.rating) > 3.5
ORDER BY avg_rating DESC;

SELECT cr.Creator_Name, COUNT(distinct s.title_ID) AS titles_count, SUM(i.current_value) AS total_value
FROM creators_table cr
JOIN comics_series_table s ON cr.creator_ID = s.creater_ID
JOIN comics_issue_table i ON s.title_ID = i.title_ID
WHERE cr.Country = 'USA'
GROUP BY cr.Creator_Name
HAVING COUNT(distinct s.title_ID) > 5 AND SUM(i.current_value) > 1000;

SELECT c.title, AVG(r.rating) AS average_rating
FROM comics_series_table c
JOIN rating_table r ON c.title_ID = r.title_ID
WHERE c.title = 'Spider-Byte'
GROUP BY c.title;

SELECT cs.title, cs.volume, p.pub_name, AVG(r.rating) as avg_rating
FROM comics_series_table cs
JOIN publisher_table p ON cs.pub_ID = p.pub_id
JOIN rating_table r ON cs.title_ID = r.title_ID
WHERE cs.title_ID IN (SELECT title_ID FROM sales_table WHERE Sale_Date >= '2023-01-01')
GROUP BY cs.title, cs.volume, p.pub_name
ORDER BY avg_rating DESC;