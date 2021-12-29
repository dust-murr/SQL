SHOW VARIABLES LIKE 'event_scheduler';
SET GLOBAL event_scheduler = ON;
SHOW TRIGGERS;


/*Problem 1*/
USE my_guitar_shop;


DROP TRIGGER IF EXISTS products_before_insert;

DELIMITER //

CREATE TRIGGER products_before_insert
  BEFORE INSERT ON products
  FOR EACH ROW
BEGIN
	IF NEW.date_added IS NULL THEN
    SET NEW.date_added = NOW();
    END IF;
END//

DELIMITER ;

SELECT * FROM products;

INSERT INTO products VALUES 
(11, 4, 'ross', 'Geller Keyboard 3000', 'Ross Geller owned this Keyboard from Friends', 499.99, 15.00, NULL);

DELETE FROM products WHERE product_id = 11;



/*Problem 2*/
DROP TABLE IF EXISTS products_audit;

CREATE TABLE products_audit
(
  audit_id			INT				NOT NULL	PRIMARY KEY		AUTO_INCREMENT,
  product_id        INT     		NOT NULL,
  category_id		INT     		NOT NULL,
  product_code      VARCHAR(10) 	NOT NULL,
  product_name      VARCHAR(255)	NOT NULL,
  list_price        DECIMAL(10,2)   NOT NULL,
  discount_percent  DECIMAL(10,2)   NOT NULL,
  date_updated		DATETIME
);

DROP TRIGGER IF EXISTS products_after_update;

DELIMITER //

CREATE TRIGGER products_after_update
  AFTER UPDATE ON products
  FOR EACH ROW
BEGIN
    INSERT INTO products_audit (audit_id, product_id, category_id, product_code, product_name, 
		list_price, discount_percent, date_updated)
    VALUES (DEFAULT, OLD.product_id, OLD.category_id, OLD.product_code, OLD.product_name, 
				OLD.list_price, OLD.discount_percent, NOW());
END//

DELIMITER ;

UPDATE products
SET list_price = 456.78
WHERE product_id = 1;

SELECT * FROM products_audit;

UPDATE products
SET list_price = 699.00
WHERE product_id = 1;
