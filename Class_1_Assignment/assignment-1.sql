create database assignment1;

use assignment1;

create table if not exists cities(
    ID INT,
    NAME VARCHAR(17),
    COUNTRYCODE VARCHAR(10),
    DISTRICT VARCHAR(50),
    POPULATION INT
);
rename table cities to city;

# Q-1
SELECT * from city where COUNTRYCODE = "USA" and  POPULATION > 100000;

# Q-2
SELECT NAME from city where COUNTRYCODE = "USA" and  POPULATION > 120000;

# Q-3
show columns from city;

# Q-4
SELECT * from city where ID = 1661;

# Q-5
SELECT * from city where COUNTRYCODE = "JPN";

# Q-6
SELECT NAME from city where COUNTRYCODE = "JPN";

# Q-7
CREATE TABLE IF NOT EXISTS STATION (
    ID INT,
    CITY VARCHAR(21),
    STATE VARCHAR(21),
    LAT_N FLOAT,
    LONG_W FLOAT
);

SELECT CITY, STATE from STATION;

# Q-8
SELECT DISTINCT CITY from STATION where ID % 2 = 0;

SELECT DISTINCT CITY from STATION where MOD(ID,2) = 0;

# Q-9
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) AS Difference from STATION;

# Q-10
(SELECT CITY, LENGTH(CITY) AS NameLength
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC
LIMIT 1)

UNION

(SELECT CITY, LENGTH(CITY) AS NameLength
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY DESC
LIMIT 1);

# Q-11
SELECT DISTINCT CITY from STATION where LEFT(CITY, 1) in ('a','e','i','o','u');

# Q-12
SELECT DISTINCT CITY from STATION where RIGHT(CITY, 1) in ('a','e','i','o','u');

# Q-13
SELECT DISTINCT CITY from STATION where LEFT(CITY, 1) not in ('a','e','i','o','u');

# Q-14
SELECT DISTINCT CITY from STATION where RIGHT(CITY, 1) not in ('a','e','i','o','u');

# Q-15
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
  OR RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');


# Q-16
SELECT DISTINCT CITY
FROM STATION
WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
  AND RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');

# Q-17
create table Product(
    product_id INT PRIMARY KEY,
    product_name varchar(50),
    unit_price int
);

create table Sales(
    seller_id int,
    product_id int,
    buyer_id int,
    sale_date date,
    quantity int,
    price int,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

insert into Product values (1, "S8", 1000),
                           (2, "G4" , 800),
                           (3, "iPhone", 1400);

INSERT INTO sales  VALUES
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 2, 3, '2019-06-02', 1, 800),
(3, 3, 4, '2019-05-13', 2, 2800);

SELECT DISTINCT p.product_id, p.product_name
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
  AND s.product_id NOT IN (
      SELECT product_id
      FROM Sales
      WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31'
  );

# Q-18
CREATE TABLE Views (
    author_id INT,
    viewer_id INT,
    article_id INT,
    view_date DATE
);

INSERT INTO Views (article_id, author_id, viewer_id, view_date)
VALUES
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'),
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'),
(3, 4, 4, '2019-07-21');

SELECT DISTINCT Views.author_id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;

# Q-19
CREATE TABLE Delivery (
    delivery_id INT,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 5, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-11'),
(4, 3, '2019-08-24', '2019-08-26'),
(5, 4, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13');

SELECT
    ROUND(
        (SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS immediate_order_percentage
FROM Delivery;

# Q-20


# Q-




