USE ap;

/*Problem 1*/
SELECT DISTINCT vendor_name
FROM vendors JOIN invoices
	ON vendors.vendor_id = invoices.vendor_id
ORDER BY vendor_name;

SELECT vendor_name
FROM vendors
WHERE vendor_id IN
	(SELECT DISTINCT vendor_id
    FROM invoices)
ORDER BY vendor_name;

/*Problem 2*/
SELECT invoice_number, invoice_total
FROM invoices
WHERE payment_total >
	(SELECT AVG(payment_total)
	FROM invoices
	WHERE payment_total > 0)
ORDER BY invoice_total;

/*Problem 3*/
SELECT account_number, account_description
FROM general_ledger_accounts GL
WHERE NOT EXISTS
	(SELECT *
    FROM invoice_line_items
    WHERE account_number = GL.account_number)
ORDER BY account_number;

/*Problem 4*/
SELECT vendor_name, I.invoice_id, invoice_sequence, line_item_amount
FROM vendors V INNER JOIN invoices I
	ON V.vendor_id = I.vendor_id
	INNER JOIN invoice_line_items LI
		ON I.invoice_id = LI.invoice_id
WHERE I.invoice_id IN
	(SELECT DISTINCT invoice_id
    FROM invoice_line_items
    WHERE invoice_sequence > 1)
ORDER BY 1, 2, 3;

/*Problem 5*/
SELECT SUM(invoice_max) AS sum_of_maximums
FROM (
		SELECT vendor_id, MAX(invoice_total) AS invoice_max
		FROM invoices
		WHERE invoice_total - credit_total - payment_total > 0
		GROUP BY vendor_id
    ) our_view;

/*Problem 6*/
SELECT vendor_name, vendor_city, vendor_state
FROM vendors
WHERE CONCAT(vendor_city, vendor_state) NOT IN
	(SELECT CONCAT(vendor_city, vendor_state) AS vendor_city_state
    FROM vendors
    GROUP BY vendor_city_state
    HAVING COUNT(*) > 1)
ORDER BY 3, 2;

/*Problem 7*/
SELECT vendor_name, invoice_number, invoice_date, invoice_total 
FROM invoices I INNER JOIN vendors V
	ON I.vendor_id = V.vendor_id
WHERE invoice_date = 
	(SELECT MIN(invoice_date)
    FROM invoices
    WHERE vendor_id = I.vendor_id)
ORDER BY vendor_name;

/*Problem 8*/
SELECT vendor_name, invoice_number, invoice_date, invoice_total
FROM invoices I 
	INNER JOIN (
				SELECT DISTINCT vendor_id, MIN(invoice_date) AS oldest_invoice_date
				FROM invoices
				GROUP BY vendor_id
				) OI
				ON I.vendor_id = OI.vendor_id 
                AND I.invoice_date = OI.oldest_invoice_date
	INNER JOIN vendors V
		ON I.vendor_id = V.vendor_id
ORDER BY vendor_name;
