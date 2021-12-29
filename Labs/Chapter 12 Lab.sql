USE ap;


/*Problem 1*/
CREATE OR REPLACE VIEW open_items AS
	SELECT vendor_name, invoice_number, invoice_total, 
    (invoice_total-payment_total-credit_total) AS balance_due
	FROM vendors V NATURAL JOIN invoices I
	WHERE invoice_total - payment_total - credit_total > 0
    ORDER BY 1;
    
SELECT * FROM open_items;


/*Problem 2*/
SELECT * 
FROM open_items
WHERE balance_due >= 1000;


/*Problem 3*/
CREATE OR REPLACE VIEW open_items_summary AS
	SELECT vendor_name, COUNT(*) AS open_item_count, 
		SUM(invoice_total - payment_total - credit_total) AS open_items_total
	FROM vendors NATURAL JOIN invoices
    WHERE invoice_total - payment_total - credit_total > 0
    GROUP BY vendor_name
    ORDER BY 3 DESC;
    

/*Problem 4*/
SELECT *
FROM open_items_summary
LIMIT 0, 5;


/*Problem 5*/
CREATE VIEW vendor_address AS
	SELECT vendor_id, vendor_address1, vendor_address2,
		vendor_city, vendor_state, vendor_zip_code
	FROM vendors;

    
SELECT * FROM vendor_address;

/*Problem 6*/
UPDATE vendor_address
SET vendor_address2 = 'Ste 260',
	vendor_address1 = '1990 Westwood Blvd'
WHERE vendor_id = 4;

SELECT * FROM vendors WHERE vendor_id = 4;
