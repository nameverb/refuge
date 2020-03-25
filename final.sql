CREATE DATABASE refuge;

USE refuge;

/*******CREATE TABLES*******/

CREATE TABLE referral (
	referral_id INT PRIMARY KEY auto_increment,
    `source` VARCHAR(220) NOT NULL
);

CREATE TABLE housing (
	unit_id INT PRIMARY KEY auto_increment,
    unit_num VARCHAR(10)
);

CREATE TABLE visitor (
	visitor_id INT PRIMARY KEY auto_increment,
    unit_id INT,
    referral_id INT,
    f_name VARCHAR(220) NOT NULL,
    l_name VARCHAR(220),
    street VARCHAR(220),
    city VARCHAR(220),
    state VARCHAR(2),
    zip VARCHAR(5),
    phone VARCHAR(14),
    dob DATE NOT NULL,
    email VARCHAR(220),
    referral_date DATE NOT NULL,
    FOREIGN KEY (unit_id) REFERENCES housing(unit_id)
    ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (referral_id) REFERENCES referral(referral_id)
    ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE meal (
	meal_id INT PRIMARY KEY auto_increment,
    meal_type ENUM('breakfast', 'lunch', 'dinner') NOT NULL,
    restriction ENUM('vegetarian', 'vegan', 'gluten-free')
);

-- associative table for meal and visitor 
CREATE TABLE served (
	meal_id INT,
    visitor_id INT,
    `date` DATETIME NOT NULL,
    PRIMARY KEY (meal_id, visitor_id), 
    FOREIGN KEY (meal_id) REFERENCES meal(meal_id)
    ON UPDATE CASCADE,
	FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id)
    ON UPDATE CASCADE
);

CREATE TABLE counselor (
	counselor_id INT PRIMARY KEY auto_increment,
    counselor_f_name VARCHAR(220) NOT NULL,
	counselor_l_name VARCHAR(220) NOT NULL
);

-- associative table for counselor and visitor 
CREATE TABLE appointment (
	counselor_id INT,
    visitor_id INT,
    `date` DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    PRIMARY KEY (counselor_id, visitor_id), 
    FOREIGN KEY (counselor_id) REFERENCES counselor(counselor_id)
    ON UPDATE CASCADE,
	FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id)
    ON UPDATE CASCADE
);

CREATE TABLE entrance (
	entry_id INT PRIMARY KEY auto_increment,
    location_name ENUM('main entrance', 'back entrance', 'emergency a', 'emergency b') NOT NULL
);

-- associative table between entrance and visitor 
-- trigger will go in time column
CREATE TABLE entry(
	entry_id INT,
    visitor_id INT,
    `time` TIMESTAMP,
    PRIMARY KEY (entry_id, visitor_id), 
    FOREIGN KEY (entry_id) REFERENCES entrance(entry_id)
    ON UPDATE CASCADE,
	FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id)
    ON UPDATE CASCADE
);

CREATE TABLE employee (
	employee_id INT PRIMARY KEY auto_increment,
    title VARCHAR(300) NOT NULL, 
    f_name VARCHAR(220) NOT NULL,
    l_name VARCHAR(220) NOT NULL,
    street VARCHAR(220) NOT NULL,
    city VARCHAR(220) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(5) NOT NULL,
    phone VARCHAR(14) NOT NULL,
    dob DATE NOT NULL,
    ssn VARCHAR(12) NOT NULL,
    email VARCHAR(220) NOT NULL,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

-- associative table between employee and visitor 
CREATE TABLE checkin (
	employee_id INT,
    visitor_id INT,
    checkin_date DATETIME NOT NULL,
    PRIMARY KEY (employee_id, visitor_id), 
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
    ON UPDATE CASCADE,
	FOREIGN KEY (visitor_id) REFERENCES visitor(visitor_id)
    ON UPDATE CASCADE
);

CREATE TABLE expense (
	expense_id INT PRIMARY KEY auto_increment,
    employee_id INT,
    account_name ENUM('travel', 'food', 'admin', 'employee wellness') NOT NULL,
    amount DECIMAL (8, 2),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
    ON UPDATE CASCADE ON DELETE NO ACTION
);

CREATE TABLE fund (
	fund_id INT PRIMARY KEY auto_increment,
    fund_name ENUM('general', 'bill and melinda gates foundation', 'bloomberg foundation', 'clinton foundation') NOT NULL,
    fund_amount DECIMAL (8, 2)
);

-- associative table between fund and expense 
CREATE TABLE `transaction` (
	fund_id INT,
    expense_id INT,
    PRIMARY KEY (fund_id, expense_id),
    transaction_date DATE NOT NULL,
    `description` VARCHAR(300),
    transaction_amount DECIMAL (8, 2),
    FOREIGN KEY (fund_id) REFERENCES fund(fund_id)
    ON UPDATE CASCADE,
	FOREIGN KEY (expense_id) REFERENCES expense(expense_id)
    ON UPDATE CASCADE
);

CREATE TABLE donor (
	donor_id INT PRIMARY KEY auto_increment,
    donor_f_name VARCHAR(250) NOT NULL,
    donor_l_name VARCHAR(250) NOT NULL,
    street VARCHAR(220) NOT NULL,
    city VARCHAR(220) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(5) NOT NULL,
    phone VARCHAR(14) NOT NULL,
    email VARCHAR(220) NOT NULL
);

CREATE TABLE donation (
	donor_id INT, 
    fund_id INT,
    PRIMARY KEY (donor_id, fund_id),
    donation_date DATE NOT NULL,
    donation_amount DECIMAL (8, 2),
    FOREIGN KEY (donor_id) REFERENCES donor(donor_id)
    ON UPDATE CASCADE,
    FOREIGN KEY (fund_id) REFERENCES fund(fund_id)
    ON UPDATE CASCADE
);

/*******INSERT DATA*******/
-- the first five items of each table were inserted here manually, the rest were inserted via CSV using the import wizard

INSERT INTO referral VALUES (
NULL, 'Goodwill Industries'), 
(NULL, 'Metropolitan Transportation Authority'),
(NULL, 'Duane Reade'),
(NULL, 'Starbucks Coffee'),
(NULL, 'Self')
;

INSERT INTO housing VALUES(
NULL, '1A'),
(NULL, '1B'),
(NULL, '1C'),
(NULL, '1D'),
(NULL, '1E')
;

INSERT INTO visitor VALUES (
NULL, 1, 1, 'Sharon', 'Stone', '123 Washington Avenue', 'New York', 'NY', '10001', '(555) 231-4265', '1989-05-01', 'sharon@sharonstone.edu', '2019-11-01'),
(NULL, 2, 3, 'Drew', 'Stanley', '411 14th Street', 'New York', 'NY', '10001', '(512) 621-9072', '1990-01-01', 'dstanley@pratt.edu', '2019-11-02'), 
(NULL, 3, 5, 'Betty', 'White', '1020 Hollywood Square', 'Los Angeles', 'CA', '90210', '(555) 555-5555', '1998-07-04', 'betty@hollywood.com', '2019-11-03'),
(NULL, 4, 5, 'Dax', 'Shepard', '999 Palisade Place', 'San Francisco', 'CA', '96758', '(555) 101-5694', '2001-02-22', 'dax@expert.com', '2019-11-04'),
(NULL, 5, 5, 'Melinda', 'Gates', '234 Lake Washington Avenue', 'Seattle', 'WA', '98334', '(221) 526-9087', '1987-03-09', 'melinda@bmgf.org', '2019-11-05')
;

INSERT INTO meal VALUES(
NULL, 'breakfast', NULL),
(NULL, 'dinner', 'vegetarian'),
(NULL, 'lunch', 'gluten-free'),
(NULL, 'lunch', NULL), 
(NULL, 'breakfast', 'vegan')
;

INSERT INTO served VALUES(
1, 4, '2019-11-04'),
(3, 2, '2019-11-02'),
(4, 3, '2019-11-03')
;

INSERT INTO counselor VALUES(
NULL, 'Enrique', 'Iglesias'),
(NULL, 'Oprah', 'Winfrey'),
(NULL, 'Anthony', 'Cocciolo'),
(NULL, 'Vinette', 'Thomas'),
(NULL, 'Anthony', 'Hopkins')
;

INSERT INTO appointment VALUES(
4, 1, '2019-11-02', '12:00:00', '12:45:00'),
(5, 2, '2019-11-03', '03:00:00', '03:45:00'),
(2, 3, '2019-11-04', '05:00:00', '05:45:00'),
(4, 4, '2019-11-05', '02:00:00', '02:45:00'),
(1, 5, '2019-11-06', '12:00:00', '12:45:00')
;

INSERT INTO entrance VALUES(
NULL, 'main entrance'),
(NULL, 'back entrance'),
(NULL, 'emergency a'),
(NULL, 'emergency b')
;

INSERT INTO entry VALUES(
1, 5, '2019-11-01 01:11:20'),
(2, 3, '2019-11-01 03:03:01'),
(3, 2, '2019-11-03 11:30:30'),
(4, 4, '2019-11-04 10:12:10')
;

INSERT INTO employee VALUES(
NULL, 'Director', 'Paula', 'Nguyen', '3344 Williamsburg Avenue', 'Brooklyn', 'NY', '11889', '(666) 420-8989', '1983-09-30', '777-777-7777', 'pnguyen@refuge.com', NULL),
(NULL, 'Associate', 'Sharon', 'Gladwell', '2803 Durbin Way', 'Brooklyn', 'NY', '11221', '(671) 234-5876', '1989-06-25', '555-555-5555', 'sgladwell@refuge.com', 1),
(NULL, 'Associate', 'Michael', 'Balrag', '666 Big Whoop Street', 'New York', 'NY', '99001', '(623) 123-9087', '1993-09-20', '111-111-1111', 'mbalrag@refuge.com', 1),
(NULL, 'Associate', 'Penelope', 'Cruz', '789 Hollywood Lane', 'Staten Island', 'NY', '12131', '(768) 224-5567', '1990-02-10', '222-222-2222', 'pcruz@refuge.com', 1),
(NULL, 'Database Manager', 'Drew', 'Stanley', '716 Knickerbocker Avenue', 'Brooklyn', 'NY', '11221', '(512) 621-9072', '1989-06-25', '444-444-4444', 'dstanley@refuge.com', 1)
;

INSERT INTO checkin VALUES (
1, 1, '2019-11-02'),
(2, 2, '2019-11-03'),
(3, 3, '2019-11-04'),
(1, 4, '2019-11-05'),
(3, 5, '2019-11-06' 
);

INSERT INTO expense VALUES (
NULL, 1, 'travel', 300.00),
(NULL, 1, 'employee wellness', 50.00),
(NULL, 1, 'food', 30.28),
(NULL, 1, 'food', 15.10),
(NULL, 1, 'food', 15.50),
(NULL, 1, 'food', 8.95
);

INSERT INTO fund VALUES (
NULL, 'bloomberg foundation', 30000.00),
(NULL, 'clinton foundation', 25000.00),
(NULL, 'general', 100000.00),
(NULL, 'bill and melinda gates foundation', 50000.00
);

INSERT INTO `transaction` VALUES (
1, 1, '2019-10-29', 'Car rental for conference in Philadelphia', 300.00),
(2, 2, '2019-10-30', 'Yoga retreat for staff', 50.00),
(3, 3, '2019-11-01', 'Staff lunch', 30.28),
(3, 4, '2019-11-01', 'La Croix for staff kitchen', 15.10),
(3, 5, '2019-11-03', 'Coffee for staff kitchen', 15.50),
(3, 6, '2019-11-03', 'Candy for staff kitchen', 8.95
);

INSERT INTO donor VALUES (
NULL, 'Michael', 'Bloomberg', '100 Avenue of the Americas', 'New York', 'NY', '10001', '(678) 231-4576', 'bigbossboy@bloomberg.com'),
(NULL, 'Hillary', 'Clinton', '1600 Pennsylvania Ave', 'I Wish', 'DC', '98101', '(657) 124-9857', 'hclinton@cf.com'),
(NULL, 'John', 'Smith', '988 Regular Person Lane', 'Lewistown', 'MT', '59441', '(406) 366-0177', 'jsmith@hotmail.com'),
(NULL, 'Patty', 'Smith', '400 Kitchen Avenue', 'Red Hill', 'MI', '78654', '(647) 231-7689', 'pattylovescats@yahoo.com'), 
(NULL, 'La', 'Croix', '600 Macbook Lane', 'Thomspon', 'MA', '87491', '(786) 214-9087', 'la@croix.com'),
(NULL, 'Bill', 'Gates', '788 Lake Washington', 'Seattle', 'WA', '97686', '(967) 465-9087', 'bgates@bmgf.com'
);

INSERT INTO donation VALUES (
1, 1, '2019-10-15', 30000.00),
(2, 2, '2019-09-01', 25000.00),
(3, 3, '2019-09-20', 33333.33),
(4, 3, '2019-09-19', 33333.33),
(5, 3, '2019-10-10', 33333.34),
(6, 4, '2019-06-06', 50000.00
);

/*******SUPPORTED TASKS*******/

-- track general usage of the shelter over the past year
CREATE VIEW `usage`
AS 
SELECT CONCAT(f_name, ' ', l_name) AS "Visitor", checkin_date AS "Checkin Date", CONCAT(counselor_f_name, ' ', counselor_l_name) AS "Assigned Counselor",
 COUNT(meal_id) AS "Meals Eaten", unit_num AS "Unit #" FROM visitor
JOIN checkin USING (visitor_id)
JOIN appointment USING (visitor_id)
JOIN counselor USING (counselor_id)
JOIN served USING (visitor_id)
JOIN meal USING (meal_id)
JOIN housing USING (unit_id)
WHERE checkin_date >= DATE_SUB(NOW(),INTERVAL 1 YEAR)
GROUP BY `Visitor`, `Checkin Date`, `Assigned Counselor`, `Unit #`;

-- test to make sure this view's WHERE filter works (it does!) by updating one of the records to be older than a year
UPDATE checkin
SET checkin_date = '2018-06-06'
WHERE visitor_id = 2;

-- view to see entrances into the building over the past day
CREATE VIEW `daily entrances`
AS
SELECT CONCAT(f_name, ' ', l_name) AS "Visitor", `time` AS "Time of Entry", location_name AS "Entrance Location" FROM visitor
JOIN entry USING (visitor_id)
JOIN entrance USING (entry_id)
WHERE `time` >= NOW() - INTERVAL 1 DAY;

-- query with a subquery to see which visitors have been referred by Duane Reade
SELECT * FROM visitor
WHERE referral_id IN
(SELECT referral_id FROM referral WHERE `source` = 'Duane Reade');

-- track donations over the past year and to which fund
CREATE VIEW `annual donations`
AS 
SELECT donation_date AS 'Donation date', CONCAT(donor_f_name, ' ', donor_l_name) AS 'Donor name', 
CONCAT('$', ' ', donation_amount) AS 'Donation amount', fund_name AS 'Allocated to'  FROM donor
JOIN donation USING (donor_id)
JOIN fund USING (fund_id)
WHERE DATE_SUB(CURDATE(),INTERVAL 1 YEAR) <= donation_date;

-- test view to make sure the annual donations view works (it does!) to make one donation older than a year
UPDATE donation set donation_date = '2018-10-15' WHERE donor_id = 1;

-- create view for employee expenses over the past year
CREATE VIEW `expenses`
AS 
SELECT transaction_date AS 'Transaction Date', CONCAT(f_name, ' ', l_name) AS 'Employee Name', CONCAT('$', transaction_amount) AS 'Amount', 
`description` AS 'Expense Description', fund_name AS 'Fund', fund_amount - `Amount` AS 'Remaining Fund Balance' FROM `transaction`
NATURAL JOIN expense
NATURAL JOIN employee
NATURAL JOIN fund
WHERE DATE_SUB(CURDATE(),INTERVAL 1 YEAR) <= transaction_date;

-- transaction to insert a new expense into the transaction table and then associate it with a transaction in the transaction table 
SET autocommit=0;
START TRANSACTION;
INSERT INTO expense VALUES (20, 1, 'admin', 35.00);
INSERT INTO `transaction` VALUES (3,20, curdate(), 'Cat food for shelter cat', 35.00);
COMMIT;

-- delete an entry from the served table 
DELETE FROM served
WHERE visitor_id = 4 AND `date` = '2019-11-03';

-- insert a timestamp in the entry table whenever someone enters an entrance
CREATE TRIGGER entrance_timestamp
BEFORE INSERT ON entry
FOR EACH ROW SET NEW.time = current_timestamp();

-- test to see if this trigger works (it does!)
INSERT INTO entry VALUES(
2, 2, NULL
); 





