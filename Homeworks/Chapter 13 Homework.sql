USE my_guitar_shop;


/*Problem 1*/
DROP PROCEDURE IF EXISTS test;

-- Change statement delimiter to double front slash
DELIMITER //

CREATE PROCEDURE test()
BEGIN
  DECLARE count_of_all_products INT;

  SELECT COUNT(*)
  INTO count_of_all_products
  FROM products;

IF count_of_all_products >= 7 THEN
    SELECT 'The number of products is greater than or equal to 7'
        AS message;
  ELSE
    SELECT 'The number of products is less than 7' AS message;
  END IF;  
END//

-- Change statement delimiter to semicolon 
DELIMITER ;

CALL test();


/*Problem 2*/
DROP PROCEDURE IF EXISTS test2;

-- Change statement delimiter to double front slash
DELIMITER //

CREATE PROCEDURE test2()
BEGIN
  DECLARE count_of_all_products  INT;
  DECLARE average_list_price	 DECIMAL(9, 2);

  SELECT COUNT(*), AVG(list_price)
  INTO count_of_all_products, average_list_price
  FROM products;

IF count_of_all_products >= 7 THEN
    SELECT count_of_all_products, average_list_price;
  ELSE
    SELECT 'The number of products is less than 7' AS message;
  END IF;  
END//

-- Change statement delimiter to semicolon 
DELIMITER ;

CALL test2();


/*Problem 3*/
DROP PROCEDURE IF EXISTS test3;

-- Change statement delimiter to double front slash
DELIMITER //

CREATE PROCEDURE test3()
BEGIN
  DECLARE row_not_found 	TINYINT DEFAULT FALSE;
  DECLARE name 				VARCHAR(50);
  DECLARE price 			DECIMAL(9, 2);
  DECLARE output_string 	VARCHAR(1000);
    
  DECLARE product_price CURSOR FOR
	SELECT product_name, list_price
    FROM products
    WHERE list_price > 700
    ORDER BY 2 DESC;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET row_not_found = TRUE;
	
    OPEN product_price;
    
	SET output_string = "";
    FETCH product_price
        INTO name, price;
    
    WHILE row_not_found = FALSE DO
        SET output_string = CONCAT(output_string, '"', name, '"', ' , ', '"', price, '"', ' | ');
        FETCH product_price
			INTO name, price;
    END WHILE;
    
    CLOSE product_price;
    
    SELECT output_string AS result;
END//

-- Change statement delimiter to semicolon 
DELIMITER ;

CALL test3();
