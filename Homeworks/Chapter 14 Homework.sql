USE my_guitar_shop;


/*Problem 1*/
DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
  DECLARE sql_error TINYINT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;
  
  DELETE FROM addresses
  WHERE customer_id = 8;
  
  DELETE FROM customers
  WHERE customer_id = 8;
  
  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

DELIMITER ;

CALL test();

SELECT * FROM customers ORDER BY customer_id DESC;
SELECT * FROM addresses ORDER BY customer_id DESC;
