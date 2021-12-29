USE my_guitar_shop;


/*Problem 1*/
DROP PROCEDURE IF EXISTS insert_category;

DELIMITER //

CREATE PROCEDURE insert_category
(
    category_name_param	VARCHAR(50)
)
BEGIN

  INSERT INTO categories 
	(category_id, category_name)
  VALUES(DEFAULT, category_name_param);
  
END//
  
DELIMITER ;
  
CALL insert_category('Guitars');

CALL insert_category('New Category');

DELETE FROM categories WHERE category_id = LAST_INSERT_ID();
  
SELECT * FROM categories;


/*Problem 2*/
DROP FUNCTION IF EXISTS discount_price;

DELIMITER //

CREATE FUNCTION discount_price

(
    item_id_param	INT
)
RETURNS DECIMAL(9,2)
BEGIN
	DECLARE discount_price_var DECIMAL(9,2);	/*Return variable*/
	
    SELECT (item_price - discount_amount) INTO discount_price_var
    FROM order_items
    WHERE item_id = item_id_param;
    RETURN discount_price_var;
  
END//
  
DELIMITER ;

SELECT item_id, item_price, discount_amount, discount_price(item_id) 
FROM order_items; 
