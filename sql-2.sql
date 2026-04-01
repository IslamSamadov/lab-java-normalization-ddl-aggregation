CREATE DATABASE blogdb;
USE blogdb;
-- first task
CREATE TABLE authors (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE articles (
	id 	INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    author_id INT NOT NULL,
    FOREIGN KEY(author_id) REFERENCES authors(id)
);

INSERT INTO authors (name) VALUES 
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

INSERT INTO articles (title,word_count,views,author_id) VALUES 
('Best Paint Colors', 814, 14, 1),
('Small Space Decorating Tips', 1146, 221, 2),
('Hot Accessories', 986, 105, 1),
('Mixing Textures', 765, 22, 1),
('Kitchen Refresh', 1242, 307, 2),
('Homemade Art Hacks', 1002, 193, 1),
('Refinishing Wood Floors', 1571, 7542, 3);

SELECT a.name AS author,
	   ar.title,
       ar.word_count,
       ar.views
FROM authors a
	JOIN articles ar ON a.id = ar.author_id;
    
    
-- second task    
CREATE TABLE customers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status VARCHAR(10) NOT NULL,
    total_milage INT NOT NULL
);

CREATE TABLE aircrafts (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    total_seats INT NOT NULL
);

CREATE TABLE flights (
	number VARCHAR(100) PRIMARY KEY,
    mileage INT NOT NULL,
    aircraft_id INT NOT NULL,
    FOREIGN KEY(aircraft_id) REFERENCES aircrafts(id)
);

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    flight_number VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (flight_number) REFERENCES flights(number)
);

INSERT INTO aircrafts (name,total_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO flights(number, mileage, aircraft_id) VALUES 
('DL143', 135, 1),
('DL122', 4270, 2),
('DL53', 2078, 3),
('DL222', 1765, 3),
('DL37', 531, 1);

INSERT INTO customers (name, status, total_milage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO bookings (customer_id, flight_number) VALUES
(1, 'DL143'),
(1, 'DL122'),
(2, 'DL122'),
(3, 'DL122'),
(3, 'DL53'),
(3, 'DL222'),
(4, 'DL143'),
(4, 'DL37'),
(5, 'DL143'),
(5, 'DL122'),
(6, 'DL222'),
(7, 'DL222'),
(8, 'DL222');


SELECT 
	c.name AS 'Customer Name',
    c.status AS 'Customer Status',
    f.number AS 'Flight Number',
    a.name AS 'Aircraft',
    a.total_seats AS 'Total Aircraft Seats',
    f.mileage AS 'Flight Mileage',
    c.total_milage AS 'Total Customer Mileage'
FROM bookings b 
JOIN customers c ON b.customer_id = c.id
JOIN flights f ON b.flight_number = f.number
JOIN aircrafts a ON f.aircraft_id = a.id;