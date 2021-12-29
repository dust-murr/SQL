/*Problem 1*/
USE my_guitar_shop;

CREATE INDEX addresses_zip_code_ix
	ON addresses(zip_code);
    

/*Problem 2*/
DROP DATABASE IF EXISTS my_web_db;

CREATE DATABASE my_web_db;

USE my_web_db;

DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
	user_id			INT				PRIMARY KEY		AUTO_INCREMENT,
    email_address	VARCHAR(100)	NOT NULL,
    first_name 		VARCHAR(45)		NOT NULL,
    last_name 		VARCHAR(45)		NOT NULL
) 
ENGINE = InnoDB;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
	product_id 		INT				PRIMARY KEY		AUTO_INCREMENT,
    product_name	VARCHAR(45)		NOT NULL
) 
ENGINE = InnoDB;

DROP TABLE IF EXISTS downloads;

CREATE TABLE downloads (
	download_id 	INT				PRIMARY KEY		AUTO_INCREMENT,
	user_id			INT				REFERENCES users(user_id),
    download_date	DATETIME		NOT NULL,
    filename		VARCHAR(50)		NOT NULL,
    product_id		INT				REFERENCES products(product_id)
) 
ENGINE = InnoDB;

ALTER DATABASE my_web_db CHARSET utf8;


/*Problem 3*/
INSERT INTO users VALUES(DEFAULT, 'dustinmurry@gmail.com', 'Dustin', 'Murry');
INSERT INTO users VALUES(DEFAULT, 'homersimpson@aol.com', 'Homer', 'Simpson');

INSERT INTO products VALUES(DEFAULT, 'Local Music Vol 1');
INSERT INTO products VALUES(DEFAULT, 'Local Music Vol 2');

INSERT INTO downloads
VALUES 	(DEFAULT, 1, NOW(), 'pedals_are_falling.mp3', 2), 
		(DEFAULT, 2, NOW(), 'turn_signal.mp3', 1), 
        (DEFAULT, 2, NOW(), 'one_horse_town.mp3', 2);

SELECT email_address, first_name, last_name, download_date, filename, product_name
FROM users NATURAL JOIN downloads NATURAL JOIN products
ORDER BY 1 DESC, 6 ASC;


/*Problem 4*/
ALTER TABLE products
	ADD product_price		DECIMAL(5,2)	DEFAULT 9.99,
    ADD product_date_time	DATETIME;
    
SELECT product_name, product_price, product_date_time
FROM products NATURAL JOIN downloads NATURAL JOIN users
ORDER BY 1, 2, 3;


/*Problem 5*/
ALTER TABLE users
	MODIFY first_name	VARCHAR(20)		NOT NULL;

UPDATE users
SET first_name = NULL
WHERE user_id = 1;

UPDATE users
SET first_name = 'Alexander the Great!!!!!'
WHERE user_id = 1;
