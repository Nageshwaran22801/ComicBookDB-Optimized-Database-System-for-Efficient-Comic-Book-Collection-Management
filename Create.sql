
CREATE TABLE comics_character_table (
    character_ID INT PRIMARY KEY,
    character_name VARCHAR(255),
    character_info TEXT
);


CREATE TABLE comics_issue_table (
    issue_ID INT PRIMARY KEY,
    current_value FLOAT,
    searched INT,
    variant BOOLEAN,
    issues_total INT,
    issue_date VARCHAR(20),
    title_ID INT REFERENCES comics_series_table(title_ID)
);


CREATE TABLE comics_series_table (
    title_ID INT PRIMARY KEY,
    title VARCHAR(255),
    volume VARCHAR(255),
    preview BOOLEAN,
    cover_date DATE,
    Genre_ID INT REFERENCES genre_table(Genre_ID),
    pub_ID INT REFERENCES publisher_table(pub_id),
    creater_ID INT REFERENCES creators_table(creator_ID),
    character_ID INT REFERENCES comics_character_table(character_ID),
	contributer_ID INT REFERENCES contributor_table(contributer_ID)
);


CREATE TABLE contributor_table (
    contributer_ID INT PRIMARY KEY,
    contributor_name VARCHAR(255),
    number_of_pages_worked INT
);


CREATE TABLE creators_table (
    creator_ID INT PRIMARY KEY,
    Creator_Name VARCHAR(255),
    Gender VARCHAR(10),
    Country VARCHAR(255)
);


CREATE TABLE customers_table (
    customer_ID INT PRIMARY KEY,
    customer_name VARCHAR(255),
    gender VARCHAR(10),
    phone_number BIGINT
);


CREATE TABLE genre_table (
    Genre_ID INT PRIMARY KEY,
    Genre_name VARCHAR(255)
);


CREATE TABLE publisher_table (
    pub_id INT PRIMARY KEY,
    pub_name VARCHAR(255),
    pub_titles_total INT,
    pub_issues_total INT
);


CREATE TABLE rating_table (
    rating_ID INT PRIMARY KEY,
    rating INT,
    customer_ID INT REFERENCES customers_table(customer_ID),
    title_ID INT REFERENCES comics_series_table(title_ID)
);


CREATE TABLE sales_table (
    sales_ID INT PRIMARY KEY,
    Sale_Date VARCHAR(20),
    Price FLOAT,
    customer_ID INT REFERENCES customers_table(customer_ID),
    title_ID INT REFERENCES comics_series_table(title_ID)
);