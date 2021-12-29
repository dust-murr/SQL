USE ap;


/*Problem 1*/
DROP PROCEDURE IF EXISTS test;

-- Change statement delimiter to double front slash
DELIMITER //

CREATE PROCEDURE test()
BEGIN
  DECLARE count_of_all_rows INT;

  SELECT COUNT(*)
  INTO count_of_all_rows
  FROM invoices 
  WHERE invoice_total - payment_total - credit_total >= 5000;
  
SELECT CONCAT(count_of_all_rows, ' invoices exceed $5,000.')
	AS message;
END//

-- Change statement delimiter to semicolon 
DELIMITER ;

CALL test();


/*Problem 2*/
DROP PROCEDURE IF EXISTS test;

-- Change statement delimiter to double front slash
DELIMITER //

CREATE PROCEDURE test2()
BEGIN
  DECLARE invoice_count INT;
  DECLARE balance_sum DECIMAL(9, 2);

  SELECT COUNT(*), SUM(invoice_total - payment_total - credit_total)
  INTO invoice_count, balance_sum
  FROM invoices
  WHERE (invoice_total - payment_total - credit_total) > 0;
  
  IF balance_sum >= 30000 THEN
    SELECT invoice_count, balance_sum
        AS message;
  ELSE
    SELECT 'Total balance due is less than $30,000' AS message;
  END IF;  
END//

-- Change statement delimiter to semicolon 
DELIMITER ;

CALL test2();


/*Problem 4*/
DROP PROCEDURE IF EXISTS test4;

-- Change statement delimiter to double front slash
DELIMITER //

CREATE PROCEDURE test4()
BEGIN
  DECLARE row_not_found 	TINYINT DEFAULT FALSE;
  DECLARE name 				VARCHAR(50);
  DECLARE number 			VARCHAR(50);
  DECLARE balance 			DECIMAL(9, 2);
  DECLARE output_string 	VARCHAR(1000);
    
  DECLARE vendor_balance CURSOR FOR
	SELECT vendor_name, invoice_number, (invoice_total - payment_total - credit_total) AS balance_due
    FROM vendors NATURAL JOIN invoices
    WHERE (invoice_total - payment_total - credit_total) >= 5000
    ORDER BY 3 DESC;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET row_not_found = TRUE;
	
    OPEN vendor_balance;
    
	SET output_string = "";
    FETCH vendor_balance
        INTO name, number, balance;
    
    WHILE row_not_found = FALSE DO
		FETCH vendor_balance
			INTO name, number, balance;
        
        SET output_string = CONCAT(output_string, balance, '||', number, '||', name, '//');
    END WHILE;
    
    CLOSE vendor_balance;
    
    SELECT output_string AS result;
END//

-- Change statement delimiter to semicolon 
DELIMITER ;

CALL test4();
