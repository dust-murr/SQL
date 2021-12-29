use ap;

/*Problem 6*/
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
/*ORDER BY vendor_contact_last_name, vendor_contact_first_name;*/
ORDER BY 2, 3;

/*Problem 7*/
SELECT CONCAT(vendor_contact_last_name, ', ', vendor_contact_first_name) AS full_name
FROM vendors
/*WHERE LEFT(full_name, 1) IN ('A', 'B', 'C', 'E')*/
/*WHERE vendor_contact_last_name < 'D' OR vendor_contact_last_name = 'E'*/
WHERE vendor_contact_last_name REGEXP '^[ABCE]'
ORDER BY full_name;

/*Problem 8*/
SELECT invoice_due_date AS 'Due Date', invoice_total AS 'Invoice Total', 
			invoice_total * .1 AS '10%', (invoice_total + invoice_total * .1) AS 'Plus 10%'
FROM invoices
WHERE invoice_total BETWEEN 500 AND 1000
ORDER BY invoice_due_date DESC;

/*Problem 9*/
SELECT invoice_number, invoice_total, payment_total + credit_total AS payment_credit_total, invoice_total - (payment_total + credit_total) AS balance_due
FROM invoices
WHERE invoice_total - (payment_total + credit_total) > 50
ORDER BY balance_due DESC
LIMIT 5;