USE ap;





/*Problem 14.2*/
DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
  DECLARE sql_error TINYINT DEFAULT FALSE;
  
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sql_error = TRUE;

  START TRANSACTION;
  
  DELETE FROM invoice_line_items
  WHERE invoice_id = 114;
  
  DELETE FROM invoices
  WHERE invoice_id = 114;
  
  IF sql_error = FALSE THEN
    COMMIT;
  ELSE
    ROLLBACK;
  END IF;
END//

DELIMITER ;

CALL test();

SELECT * FROM invoices ORDER BY invoice_id DESC;
SELECT * FROM invoice_line_items ORDER BY invoice_id DESC;





/*Problem 15.1*/
DROP PROCEDURE IF EXISTS insert_glaccount;

DELIMITER //

CREATE PROCEDURE insert_glaccount
(
	account_number_param 		INT,
    account_description_param	VARCHAR(50)
)
BEGIN

  INSERT INTO general_ledger_accounts 
	(account_number, account_description)
  VALUES(account_number_param, account_description_param);
  
END//
  
DELIMITER ;
  
CALL insert_glaccount(123456, "This is Dustin's Account");
  
SELECT * FROM general_ledger_accounts;





/*Problem 15.2*/
DROP FUNCTION IF EXISTS gtest_glaccounts_description;

DELIMITER //

CREATE FUNCTION gtest_glaccounts_description

(
    account_description_param	VARCHAR(50)
)
RETURNS TINYINT
BEGIN
	DECLARE return_value TINYINT;	/*Return variable*/
    DECLARE description VARCHAR(50);
    DECLARE not_found TINYINT DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET not_found = TRUE;
	
    SELECT account_description INTO description
    FROM general_ledger_accounts
    WHERE account_description = account_description_param;
    
	IF not_found = TRUE THEN
		RETURN 0;
	ELSE
		RETURN 1;
	END IF;
  
END//
  
DELIMITER ;

SELECT gtest_glaccounts_description("This is Dustin's Account") AS first_test, 
	gtest_glaccounts_description("Dustin_account") AS second_test;
