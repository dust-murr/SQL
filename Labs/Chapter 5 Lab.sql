USE ap;

/*Problem 1*/
SELECT * FROM terms;

INSERT INTO terms
VALUES(6, 'Net due 120 days', 120);

/*Problem 2*/
SELECT * FROM terms;

UPDATE terms
SET terms_description = 'Net due 125 days',
	terms_due_days = 125
WHERE terms_id = 6;

/*Problem 3*/
SELECT * FROM terms;

DELETE FROM terms
WHERE terms_id = 6;

/*Problem 4*/
SELECT * FROM invoices ORDER BY invoice_ID DESC;

INSERT INTO invoices
VALUES(DEFAULT, 32, 'AX-014-027', '2014-08-01', 434.58, 0.00, 0.00, 2, '2014-08-31', NULL);

/*Problem 5*/
INSERT INTO invoice_line_items
VALUES
	(115, 1, 160, 180.23, 'Hard Drive'),
    (115, 2, 527, 254.35, 'Exchange Server update');
    
SELECT * FROM invoice_line_items ORDER BY invoice_id DESC;

/*Problem 6*/
SELECT * FROM invoices ORDER BY invoice_ID DESC;

UPDATE invoices
SET credit_total = .1 * invoice_total,
	payment_total = invoice_total - credit_total
WHERE invoice_id = 115;

/*Problem 7*/
SELECT * FROM vendors;

UPDATE vendors
SET default_account_number = 403
WHERE vendor_id = 44;

/*Problem 8*/
SELECT * FROM invoices WHERE vendor_id IN (SELECT vendor_id FROM vendors WHERE default_terms_id = 2);

UPDATE invoices
SET terms_id = 2
WHERE vendor_id IN
	(SELECT vendor_id
	FROM vendors
	WHERE default_terms_id = 2);
    
/*Problem 9*/
SELECT * FROM invoices ORDER BY invoice_ID DESC;

DELETE FROM invoice_line_items
WHERE invoice_id = 115;

DELETE FROM invoices
WHERE invoice_id = 115;
