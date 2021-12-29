-- *************************************************************
-- This script only creates the EX (Examples) database
-- for Murach's MySQL by Joel Murach 
-- *************************************************************

-- create the database
DROP DATABASE IF EXISTS ex;
CREATE DATABASE ex;

-- select the database
USE ex;

-- example tables for chapter 3
CREATE TABLE null_sample
(
  invoice_id      INT               NOT NULL,
  invoice_total   DECIMAL(9,2),
  CONSTRAINT invoice_id_uq 
    UNIQUE (invoice_id)
);

INSERT INTO null_sample VALUES 
(1,125),
(2,0),
(3,null),
(4,2199.99),
(5,0);

-- example tables for chapter 4
CREATE TABLE departments
(
  department_number   INT           NOT NULL,
  department_name     VARCHAR(50)   NOT NULL,
  CONSTRAINT department_number_unq  
    UNIQUE (department_number)
);

INSERT INTO departments VALUES 
(1,'Accounting'),
(2,'Payroll'),
(3,'Operations'),
(4,'Personnel'),
(5,'Maintenance');

CREATE TABLE employees
(
  employee_id         INT               NOT NULL,
  last_name           VARCHAR(35)       NOT NULL,
  first_name          VARCHAR(35)       NOT NULL,
  department_number   INT               NOT NULL,
  manager_id          INT
);

INSERT INTO employees VALUES 
(1,'Smith','Cindy',2,null),
(2,'Jones','Elmer',4,1),
(3,'Simonian','Ralph',2,2),
(4,'Hernandez','Olivia',1,9),
(5,'Aaronsen','Robert',2,4),
(6,'Watson','Denise',6,8),
(7,'Hardy','Thomas',5,2),
(8,'O''Leary','Rhea',4,9),
(9,'Locario','Paulo',6,1);

CREATE TABLE projects
(
  project_number    VARCHAR(5)    NOT NULL,
  employee_id       INT           NOT NULL
);

INSERT INTO projects VALUES 
('P1011',8),
('P1011',4),
('P1012',3),
('P1012',1),
('P1012',5),
('P1013',6),
('P1013',9),
('P1014',10);

CREATE TABLE customers
(
  customer_id          INT               NOT NULL,
  customer_last_name   VARCHAR(30),
  customer_first_name  VARCHAR(30),
  customer_address     VARCHAR(60),
  customer_city        VARCHAR(15),
  customer_state       VARCHAR(15),
  customer_zip         VARCHAR(10),
  customer_phone       VARCHAR(24)
);

INSERT INTO customers VALUES 
(1, 'Anders', 'Maria', '345 Winchell Pl', 'Anderson', 'IN', '46014', '(765) 555-7878'),
(2, 'Trujillo', 'Ana', '1298 E Smathers St', 'Benton', 'AR', '72018', '(501) 555-7733'),
(3, 'Moreno', 'Antonio', '6925 N Parkland Ave', 'Puyallup', 'WA', '98373', '(253) 555-8332'),
(4, 'Hardy', 'Thomas', '83 d''Urberville Ln', 'Casterbridge', 'GA', '31209', '(478) 555-1139'),
(5, 'Berglund', 'Christina', '22717 E 73rd Ave', 'Dubuque', 'IA', '52004', '(319) 555-1139'),
(6, 'Moos', 'Hanna', '1778 N Bovine Ave', 'Peoria', 'IL', '61638', '(309) 555-8755'),
(7, 'Citeaux', 'Fred', '1234 Main St', 'Normal', 'IL', '61761', '(309) 555-1914'),
(8, 'Summer', 'Martin', '1877 Ete Ct', 'Frogtown', 'LA', '70563', '(337) 555-9441'),
(9, 'Lebihan', 'Laurence', '717 E Michigan Ave', 'Chicago', 'IL', '60611', '(312) 555-9441'),
(10, 'Lincoln', 'Elizabeth', '4562 Rt 78 E', 'Vancouver', 'WA', '98684', '(360) 555-2680'),
(11, 'Snyder', 'Howard', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', '(503) 555-7555'),
(12, 'Latimer', 'Yoshi', 'City Center Plaza 516 Main St.', 'Elgin', 'OR', '97827', '(503) 555-6874'),
(13, 'Steel', 'John', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', '(509) 555-7969'),
(14, 'Yorres', 'Jaime', '87 Polk St. Suite 5', 'San Francisco', 'CA', '94117', '(415) 555-5938'),
(15, 'Wilson', 'Fran', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', '(503) 555-9573'),
(16, 'Phillips', 'Rene', '2743 Bering St.', 'Anchorage', 'AK', '99508', '(907) 555-7584'),
(17, 'Wilson', 'Paula', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', '(505) 555-5939'),
(18, 'Pavarotti', 'Jose', '187 Suffolk Ln.', 'Boise', 'ID', '83720', '(208) 555-8097'),
(19, 'Braunschweiger', 'Art', 'P.O. Box 555', 'Lander', 'WY', '82520', '(307) 555-4680'),
(20, 'Nixon', 'Liz', '89 Jefferson Way Suite 2', 'Providence', 'RI', '02909', '(401) 555-3612'),
(21, 'Wong', 'Liu', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', '(406) 555-5834'),
(22, 'Nagy', 'Helvetius', '722 DaVinci Blvd.', 'Concord', 'MA', '01742', '(351) 555-1219'),
(23, 'Jablonski', 'Karl', '305 - 14th Ave. S. Suite 3B', 'Seattle', 'WA', '98128', '(206) 555-4112'),
(24, 'Chelan', 'Donna', '2299 E Baylor Dr', 'Dallas', 'TX', '75224', '(469) 555-8828');

-- example tables for chapter 7

CREATE TABLE color_sample
(
  color_id         INT           NOT NULL     AUTO_INCREMENT,
  color_number     INT           NOT NULL     DEFAULT 0,
  color_name       VARCHAR(50),
  CONSTRAINT color_sample_pk
    PRIMARY KEY (color_id)
);


INSERT INTO color_sample (color_number)
VALUES (606);

INSERT INTO color_sample (color_name)
VALUES ('Yellow');

INSERT INTO color_sample
VALUES (3, DEFAULT, 'Orange');

INSERT INTO color_sample
VALUES (4, 808, NULL);

INSERT INTO color_sample
VALUES (5, DEFAULT, NULL);



-- example tables for chapter 8
CREATE TABLE string_sample
(
  emp_id        VARCHAR(3),
  emp_name      VARCHAR(25)
);

INSERT INTO string_sample VALUES 
('1', 'Lizbeth Darien'),
('2', 'Darnell O''Sullivan'),
('17', 'Lance Pinos-Potter'),
('20', 'Jean Paul Renard'),
('3', 'Alisha von Strump');

CREATE TABLE float_sample
(
  float_id       INT,
  float_value    DOUBLE
);

INSERT INTO float_sample VALUES 
(1, 0.999999999999999),
(2, 1),
(3, 1.000000000000001),
(4, 1234.56789012345),
(5, 999.04440209348),
(6, 24.04849);

CREATE TABLE date_sample
(
  date_id       INT       NOT NULL,
  start_date    DATETIME
);

INSERT INTO date_sample VALUES 
(1, '1982-03-01 00:00:00'),
(2, '2002-02-28 00:00:00'),
(3, '2006-10-31 00:00:00'),
(4, '2014-02-28 10:00:00'),
(5, '2015-02-28 13:58:32'),
(6, '2015-03-01 09:02:25');

CREATE TABLE active_invoices
(
  invoice_id        INT           NOT NULL,
  vendor_id         INT           NOT NULL,
  invoice_number    VARCHAR(50)   NOT NULL,
  invoice_date      DATE          NOT NULL,
  invoice_total     DECIMAL(9,2)  NOT NULL,
  payment_total     DECIMAL(9,2)  NOT NULL,
  credit_total      DECIMAL(9,2)  NOT NULL,
  terms_id          INT           NOT NULL,
  invoice_due_date  DATE          NOT NULL,
  payment_date      DATE
);

INSERT INTO active_invoices VALUES 
(3, 110, 'P-0608', '2014-04-11', '20551.18', '0.00', '1200.00', 5, '2014-06-30', NULL),
(6, 122, '989319-497', '2014-04-17', '2312.20', '0.00', '0.00', 4, '2014-06-26', NULL),
(8, 122, '989319-487', '2014-04-18', '1927.54', '0.00', '0.00', 4, '2014-06-19', NULL),
(15, 121, '97/553B', '2014-04-26', '313.55', '0.00', '0.00', 4, '2014-07-09', NULL),
(18, 121, '97/553', '2014-04-27', '904.14', '0.00', '0.00', 4, '2014-07-09', NULL),
(19, 121, '97/522', '2014-04-30', '1962.13', '0.00', '200.00', 4, '2014-07-10', NULL),
(30, 94, '203339-13', '2014-05-02', '17.50', '0.00', '0.00', 3, '2014-06-13', NULL),
(34, 110, '0-2436', '2014-05-07', '10976.06', '0.00', '0.00', 4, '2014-07-17', NULL),
(38, 123, '963253272', '2014-05-09', '61.50', '0.00', '0.00', 4, '2014-06-29', NULL),
(39, 123, '963253271', '2014-05-09', '158.00', '0.00', '0.00', 4, '2014-06-28', NULL),
(40, 123, '963253269', '2014-05-09', '26.75', '0.00', '0.00', 4, '2014-06-25', NULL),
(41, 123, '963253267', '2014-05-09', '23.50', '0.00', '0.00', 4, '2014-06-24', NULL),
(42, 97, '21-4748363', '2014-05-09', '9.95', '0.00', '0.00', 4, '2014-06-25', NULL),
(44, 123, '963253264', '2014-05-10', '52.25', '0.00', '0.00', 4, '2014-06-23', NULL),
(45, 123, '963253263', '2014-05-10', '109.50', '0.00', '0.00', 4, '2014-06-22', NULL),
(67, 123, '43966316', '2014-05-17', '10.00', '0.00', '0.00', 3, '2014-06-19', NULL),
(68, 123, '263253273', '2014-05-17', '30.75', '0.00', '0.00', 4, '2014-06-29', NULL),
(69, 37, '547479217', '2014-05-17', '116.00', '0.00', '0.00', 3, '2014-06-22', NULL),
(70, 123, '263253270', '2014-05-18', '67.92', '0.00', '0.00', 3, '2014-06-25', NULL),
(71, 123, '263253268', '2014-05-18', '59.97', '0.00', '0.00', 3, '2014-06-24', NULL),
(72, 123, '263253265', '2014-05-18', '26.25', '0.00', '0.00', 3, '2014-06-23', NULL),
(79, 123, '963253262', '2014-05-22', '42.50', '0.00', '0.00', 3, '2014-06-21', NULL),
(81, 83, '31359783', '2014-05-23', '1575.00', '0.00', '0.00', 2, '2014-06-09', NULL),
(82, 115, '25022117', '2014-05-24', '6.00', '0.00', '0.00', 3, '2014-06-21', NULL),
(88, 86, '367447', '2014-05-31', '2433.00', '0.00', '0.00', 3, '2014-06-30', NULL),
(91, 80, '134116', '2014-06-01', '90.36', '0.00', '0.00', 3, '2014-07-02', NULL),
(94, 106, '9982771', '2014-06-03', '503.20', '0.00', '0.00', 2, '2014-06-18', NULL),
(98, 95, '111-92R-10092', '2014-06-04', '46.21', '0.00', '0.00', 1, '2014-06-29', NULL),
(99, 95, '111-92R-10093', '2014-06-05', '39.77', '0.00', '0.00', 2, '2014-06-28', NULL),
(100, 96, 'I77271-O01', '2014-06-05', '662.00', '0.00', '0.00', 2, '2014-06-24', NULL),
(103, 95, '111-92R-10094', '2014-06-06', '19.67', '0.00', '0.00', 1, '2014-06-27', NULL),
(105, 95, '111-92R-10095', '2014-06-07', '32.70', '0.00', '0.00', 3, '2014-06-26', NULL),
(106, 95, '111-92R-10096', '2014-06-08', '16.33', '0.00', '0.00', 2, '2014-06-25', NULL),
(107, 95, '111-92R-10097', '2014-06-08', '16.33', '0.00', '0.00', 1, '2014-06-24', NULL),
(109, 102, '109596', '2014-06-14', '41.80', '0.00', '0.00', 3, '2014-07-11', NULL),
(110, 72, '39104', '2014-06-20', '85.31', '0.00', '0.00', 3, '2014-07-20', NULL),
(111, 37, '547480102', '2014-05-19', '224.00', '0.00', '0.00', 3, '2014-06-24', NULL),
(112, 37, '547481328', '2014-05-20', '224.00', '0.00', '0.00', 3, '2014-06-25', NULL),
(113, 72, '40318', '2014-07-18', '21842.00', '0.00', '0.00', 3, '2014-07-20', NULL),
(114, 83, '31361833', '2014-05-23', '579.42', '0.00', '0.00', 2, '2014-06-09', NULL);

CREATE TABLE paid_invoices
(
  invoice_id        INT           NOT NULL,
  vendor_id         INT           NOT NULL,
  invoice_number    VARCHAR(50)   NOT NULL,
  invoice_date      DATE          NOT NULL,
  invoice_total     DECIMAL(9,2)  NOT NULL,
  payment_total     DECIMAL(9,2)  NOT NULL,
  credit_total      DECIMAL(9,2)  NOT NULL,
  terms_id          INT           NOT NULL,
  invoice_due_date  DATE          NOT NULL,
  payment_date      DATE
);

INSERT INTO paid_invoices VALUES
(2, 34, 'Q545443', '2014-03-14', '1083.58', '1083.58', '0.00', 4, '2014-05-23', '2014-05-14'),
(4, 110, 'P-0259', '2014-04-16', '26881.40', '26881.40', '0.00', 3, '2014-05-16', '2014-05-12'),
(5, 81, 'MABO1489', '2014-04-16', '936.93', '936.93', '0.00', 3, '2014-05-16', '2014-05-13'),
(7, 82, 'C73-24', '2014-04-17', '600.00', '600.00', '0.00', 2, '2014-05-10', '2014-05-05'),
(9, 122, '989319-477', '2014-04-19', '2184.11', '2184.11', '0.00', 4, '2014-06-12', '2014-06-07'),
(10, 122, '989319-467', '2014-04-24', '2318.03', '2318.03', '0.00', 4, '2014-06-05', '2014-05-29'),
(11, 122, '989319-457', '2014-04-24', '3813.33', '3813.33', '0.00', 3, '2014-05-29', '2014-05-20'),
(12, 122, '989319-447', '2014-04-24', '3689.99', '3689.99', '0.00', 3, '2014-05-22', '2014-05-12'),
(13, 122, '989319-437', '2014-04-24', '2765.36', '2765.36', '0.00', 2, '2014-05-15', '2014-05-03'),
(14, 122, '989319-427', '2014-04-25', '2115.81', '2115.81', '0.00', 1, '2014-05-08', '2014-05-01'),
(16, 122, '989319-417', '2014-04-26', '2051.59', '2051.59', '0.00', 1, '2014-05-01', '2014-04-28'),
(17, 90, '97-1024A', '2014-04-26', '356.48', '356.48', '0.00', 3, '2014-06-09', '2014-06-09'),
(20, 121, '97/503', '2014-04-30', '639.77', '639.77', '0.00', 4, '2014-06-11', '2014-06-05'),
(21, 121, '97/488', '2014-04-30', '601.95', '601.95', '0.00', 3, '2014-06-03', '2014-05-27'),
(22, 121, '97/486', '2014-04-30', '953.10', '953.10', '0.00', 2, '2014-05-21', '2014-05-13'),
(23, 121, '97/465', '2014-05-01', '565.15', '565.15', '0.00', 1, '2014-05-14', '2014-05-05'),
(24, 121, '97/222', '2014-05-01', '1000.46', '1000.46', '0.00', 3, '2014-06-03', '2014-05-25'),
(25, 123, '4-342-8069', '2014-05-01', '10.00', '10.00', '0.00', 4, '2014-06-10', '2014-05-27'),
(26, 123, '4-327-7357', '2014-05-01', '162.75', '162.75', '0.00', 3, '2014-05-27', '2014-05-21'),
(27, 123, '4-321-2596', '2014-05-01', '10.00', '10.00', '0.00', 2, '2014-05-20', '2014-05-11'),
(28, 123, '7548906-20', '2014-05-01', '27.00', '27.00', '0.00', 3, '2014-06-06', '2014-05-26'),
(29, 123, '4-314-3057', '2014-05-02', '13.75', '13.75', '0.00', 1, '2014-05-13', '2014-05-07'),
(31, 123, '2-000-2993', '2014-05-03', '144.70', '144.70', '0.00', 1, '2014-05-06', '2014-05-04'),
(32, 89, '125520-1', '2014-05-05', '95.00', '95.00', '0.00', 3, '2014-06-08', '2014-05-22'),
(33, 123, '1-202-2978', '2014-05-06', '33.00', '33.00', '0.00', 1, '2014-05-20', '2014-05-13'),
(35, 123, '1-200-5164', '2014-05-07', '63.40', '63.40', '0.00', 1, '2014-05-13', '2014-05-10'),
(36, 110, '0-2060', '2014-05-08', '23517.58', '21221.63', '2295.95', 3, '2014-06-09', '2014-06-10'),
(37, 110, '0-2058', '2014-05-08', '37966.19', '37966.19', '0.00', 3, '2014-06-09', '2014-05-31'),
(43, 97, '21-4923721', '2014-05-09', '9.95', '9.95', '0.00', 1, '2014-05-21', '2014-05-13'),
(46, 123, '963253261', '2014-05-10', '42.75', '42.75', '0.00', 3, '2014-06-16', '2014-06-10'),
(47, 123, '963253260', '2014-05-10', '36.00', '36.00', '0.00', 3, '2014-06-15', '2014-06-06'),
(48, 123, '963253258', '2014-05-10', '111.00', '111.00', '0.00', 3, '2014-06-11', '2014-05-31'),
(49, 123, '963253256', '2014-05-10', '53.25', '53.25', '0.00', 3, '2014-06-10', '2014-05-27'),
(50, 123, '963253255', '2014-05-11', '53.75', '53.75', '0.00', 3, '2014-06-09', '2014-06-03'),
(51, 123, '963253254', '2014-05-11', '108.50', '108.50', '0.00', 3, '2014-06-08', '2014-05-30'),
(52, 123, '963253252', '2014-05-11', '38.75', '38.75', '0.00', 3, '2014-06-07', '2014-05-27'),
(53, 123, '963253251', '2014-05-11', '15.50', '15.50', '0.00', 3, '2014-06-04', '2014-05-21'),
(54, 123, '963253249', '2014-05-12', '127.75', '127.75', '0.00', 2, '2014-06-03', '2014-05-28'),
(55, 123, '963253248', '2014-05-13', '241.00', '241.00', '0.00', 2, '2014-06-02', '2014-05-24'),
(56, 123, '963253246', '2014-05-13', '129.00', '129.00', '0.00', 2, '2014-05-31', '2014-05-20'),
(57, 123, '963253245', '2014-05-13', '40.75', '40.75', '0.00', 2, '2014-05-28', '2014-05-14'),
(58, 123, '963253244', '2014-05-13', '60.00', '60.00', '0.00', 2, '2014-05-27', '2014-05-21'),
(59, 123, '963253242', '2014-05-13', '104.00', '104.00', '0.00', 2, '2014-05-26', '2014-05-17'),
(60, 123, '963253240', '2014-05-23', '67.00', '67.00', '0.00', 1, '2014-06-03', '2014-05-28'),
(61, 123, '963253239', '2014-05-23', '147.25', '147.25', '0.00', 1, '2014-06-02', '2014-05-28'),
(62, 123, '963253237', '2014-05-23', '172.50', '172.50', '0.00', 1, '2014-05-30', '2014-05-24'),
(63, 123, '963253235', '2014-05-14', '108.25', '108.25', '0.00', 1, '2014-05-20', '2014-05-17'),
(64, 123, '963253234', '2014-05-14', '138.75', '138.75', '0.00', 1, '2014-05-19', '2014-05-16'),
(65, 123, '963253232', '2014-05-14', '127.75', '127.75', '0.00', 1, '2014-05-18', '2014-05-16'),
(66, 123, '963253230', '2014-05-15', '739.20', '739.20', '0.00', 1, '2014-05-17', '2014-05-16'),
(73, 123, '263253257', '2014-05-18', '22.57', '22.57', '0.00', 2, '2014-06-10', '2014-05-27'),
(74, 123, '263253253', '2014-05-18', '31.95', '31.95', '0.00', 2, '2014-06-07', '2014-06-01'),
(75, 123, '263253250', '2014-05-19', '42.67', '42.67', '0.00', 2, '2014-06-03', '2014-05-25'),
(76, 123, '263253243', '2014-05-20', '44.44', '44.44', '0.00', 1, '2014-05-26', '2014-05-23'),
(77, 123, '263253241', '2014-05-20', '40.20', '40.20', '0.00', 1, '2014-05-25', '2014-05-22'),
(78, 123, '94007069', '2014-05-22', '400.00', '400.00', '0.00', 3, '2014-07-01', '2014-06-25'),
(80, 105, '94007005', '2014-05-23', '220.00', '220.00', '0.00', 1, '2014-05-30', '2014-05-26'),
(83, 115, '24946731', '2014-05-25', '25.67', '25.67', '0.00', 2, '2014-06-14', '2014-05-28'),
(84, 115, '24863706', '2014-05-27', '6.00', '6.00', '0.00', 1, '2014-06-07', '2014-06-01'),
(85, 115, '24780512', '2014-05-29', '6.00', '6.00', '0.00', 1, '2014-05-31', '2014-05-30'),
(86, 88, '972110', '2014-05-30', '207.78', '207.78', '0.00', 1, '2014-06-06', '2014-06-02'),
(87, 100, '587056', '2014-05-31', '2184.50', '2184.50', '0.00', 3, '2014-06-28', '2014-06-22'),
(89, 99, '509786', '2014-05-31', '6940.25', '6940.25', '0.00', 2, '2014-06-16', '2014-06-08'),
(90, 108, '121897', '2014-06-01', '450.00', '450.00', '0.00', 2, '2014-06-19', '2014-06-14'),
(92, 80, '133560', '2014-06-01', '175.00', '175.00', '0.00', 2, '2014-06-20', '2014-06-03'),
(93, 104, 'P02-3772', '2014-06-03', '7125.34', '7125.34', '0.00', 2, '2014-06-18', '2014-06-08'),
(95, 107, 'RTR-72-3662-X', '2014-06-04', '1600.00', '1600.00', '0.00', 2, '2014-06-18', '2014-06-11'),
(96, 113, '77290', '2014-06-04', '1750.00', '1750.00', '0.00', 2, '2014-06-18', '2014-06-08'),
(97, 119, '10843', '2014-06-04', '4901.26', '4901.26', '0.00', 2, '2014-06-18', '2014-06-11'),
(101, 103, '75C-90227', '2014-06-06', '1367.50', '1367.50', '0.00', 1, '2014-06-13', '2014-06-09'),
(102, 48, 'P02-88D77S7', '2014-06-06', '856.92', '856.92', '0.00', 1, '2014-06-13', '2014-06-09'),
(104, 114, 'CBM9920-M-T77109', '2014-06-07', '290.00', '290.00', '0.00', 1, '2014-06-12', '2014-06-09'),
(108, 117, '111897', '2014-06-11', '16.62', '16.62', '0.00', 1, '2014-06-14', '2014-06-12');