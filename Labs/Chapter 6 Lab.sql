USE ap;

/*Problem 1*/
SELECT vendor_id, SUM(invoice_total) AS Total
FROM invoices
GROUP BY vendor_id;

/*Problem 2*/
SELECT vendor_name, SUM(payment_total)
FROM invoices JOIN vendors
	ON invoices.vendor_id = vendors.vendor_id
GROUP BY vendor_name
ORDER BY SUM(payment_total) DESC;

/*Problem 3*/
SELECT vendor_name, COUNT(invoice_id), SUM(invoice_total)
FROM invoices JOIN vendors
	ON invoices.vendor_id = vendors.vendor_id
GROUP BY vendor_name
ORDER BY COUNT(invoice_id) DESC;

/*Problem 4*/
SELECT account_description, COUNT(LI.account_number) AS line_item_count, 
SUM(line_item_amount) AS line_item_amount_sum
FROM general_ledger_accounts GL INNER JOIN invoice_line_items LI
	ON GL.account_number = LI.account_number
GROUP BY account_description
HAVING COUNT(LI.account_number) > 1
ORDER BY SUM(line_item_amount) DESC;

/*Problem 5*/
SELECT account_description, COUNT(LI.account_number) AS line_item_count, 
SUM(line_item_amount) AS line_item_amount_sum
FROM general_ledger_accounts GL INNER JOIN invoice_line_items LI
	ON GL.account_number = LI.account_number
INNER JOIN invoices I
	ON LI.invoice_id = I.invoice_id
WHERE invoice_date BETWEEN '2014-04-01' AND '2014-06-30'
GROUP BY account_description
HAVING COUNT(LI.account_number) > 1
ORDER BY SUM(line_item_amount) DESC;

/*Problem 6*/
SELECT account_number, SUM(line_item_amount) AS line_item_amount_sum
FROM invoice_line_items
GROUP BY account_number WITH ROLLUP;

/*Problem 7*/
SELECT vendor_name, COUNT(DISTINCT GL.account_number) AS number_of_gl_accounts
FROM general_ledger_accounts GL INNER JOIN invoice_line_items IL
	ON GL.account_number = IL.account_number
INNER JOIN invoices I
	ON IL.invoice_id = I.invoice_id
INNER JOIN vendors V
	ON I.vendor_id = V.vendor_id
GROUP BY vendor_name
HAVING COUNT(DISTINCT GL.account_number) > 1;
