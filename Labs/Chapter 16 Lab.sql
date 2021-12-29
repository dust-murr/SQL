SHOW VARIABLES LIKE 'event_scheduler';
SET GLOBAL event_scheduler = ON;
SHOW TRIGGERS;


/*Problem 1 or 16_02*/
USE ap;

DROP TRIGGER IF EXISTS invoices_before_update;

DELIMITER //

CREATE TRIGGER invoices_before_update
  BEFORE UPDATE ON invoices
  FOR EACH ROW
BEGIN
  DECLARE sum_line_item_amount DECIMAL(9,2);
  
  SELECT SUM(line_item_amount) 
  INTO sum_line_item_amount
  FROM invoice_line_items
  WHERE invoice_id = NEW.invoice_id;
  
  IF sum_line_item_amount != NEW.invoice_total THEN
    SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Line item total must match invoice total.';
  ELSEIF NEW.invoice_total < NEW.credit_total + NEW.payment_total THEN
  SIGNAL SQLSTATE 'HY000'
      SET MESSAGE_TEXT = 'Invoice total cannot be less than credit total plus payment total';
  END IF;
END//

DELIMITER ;

SELECT * FROM invoices WHERE invoice_id = 100;
SELECT * FROM invoice_line_items WHERE invoice_id = 100;

UPDATE invoices
SET invoice_total = 600
WHERE invoice_id = 100;

UPDATE invoices
SET payment_total = 100
WHERE invoice_id = 100;

UPDATE invoices
SET payment_total = 20
WHERE invoice_id = 100;

UPDATE invoices
SET credit_total = 55
WHERE invoice_id = 100;

SELECT invoice_id, invoice_total, credit_total, payment_total 
FROM invoices WHERE invoice_id = 100;




/*Problem 2 or 16_03*/
DROP TABLE IF EXISTS invoices_audit;

CREATE TABLE invoices_audit
(
  vendor_id           INT             NOT NULL,
  invoice_number      VARCHAR(50)     NOT NULL,
  invoice_total       DECIMAL(9,2)    NOT NULL,
  action_type         VARCHAR(50)     NOT NULL,
  action_date         DATETIME        NOT NULL
);

DROP TRIGGER IF EXISTS invoices_after_insert;
DROP TRIGGER IF EXISTS invoices_after_delete;
DROP TRIGGER IF EXISTS invoices_after_update;

DELIMITER //

CREATE TRIGGER invoices_after_insert
  AFTER INSERT ON invoices
  FOR EACH ROW
BEGIN
    INSERT INTO invoices_audit VALUES
    (NEW.vendor_id, NEW.invoice_number, NEW.invoice_total, 
    'INSERTED', NOW());
END//

CREATE TRIGGER invoices_after_delete
  AFTER DELETE ON invoices
  FOR EACH ROW
BEGIN
    INSERT INTO invoices_audit VALUES
    (OLD.vendor_id, OLD.invoice_number, OLD.invoice_total, 
    'DELETED', NOW());
END//

CREATE TRIGGER invoices_after_update
  AFTER UPDATE ON invoices
  FOR EACH ROW
BEGIN
    INSERT INTO invoices_audit VALUES
    (OLD.vendor_id, OLD.invoice_number, OLD.invoice_total, 
    'UPDATED', NOW());
END//

DELIMITER ;

-- make sure that there is at least one record to delete
INSERT INTO invoices VALUES 
(115, 34, 'ZXA-080', '2014-08-30', 14092.59, 0, 0, 3, '2014-09-30', NULL);

DELETE FROM invoices WHERE invoice_id = 115;

UPDATE invoices
SET credit_total = 20
WHERE invoice_id = 100;

SELECT * FROM invoices_audit;

-- clean up
 -- DELETE FROM invoices_audit;
 
 
 
 
 /*Problem 3 or 16_05*/
SHOW VARIABLES LIKE 'event_scheduler';

SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS one_time_delete_audit_rows;
DROP EVENT IF EXISTS monthly_delete_audit_rows;

DELIMITER //

CREATE EVENT one_time_delete_audit_rows
ON SCHEDULE AT NOW() + INTERVAL 2 MINUTE
DO BEGIN
  DELETE FROM invoices_audit 
  WHERE action_type = 'INSERTED';
END//

CREATE EVENT monthly_delete_audit_rows
ON SCHEDULE EVERY 2 MINUTE
STARTS '2021-11-29 12:21:00'
DO BEGIN
  DELETE FROM invoices_audit 
  WHERE action_type = 'UPDATED';
END//

DELIMITER ;

SELECT * FROM invoices_audit;
