USE ap;

/*Problem 1*/
SELECT *
FROM vendors JOIN invoices
	ON vendors.vendor_id = invoices.vendor_id;
    
/*Problem 2*/
SELECT vendor_name, invoice_number, invoice_date, invoice_total - (payment_total + credit_total) AS balance_due
FROM vendors v INNER JOIN invoices i
	ON v.vendor_id = i.vendor_id
WHERE invoice_total - (payment_total + credit_total) > 0
ORDER BY 1;

/*Problem 3*/
SELECT vendor_name, default_account_number AS default_account, account_description AS description
FROM vendors INNER JOIN general_ledger_accounts
	ON default_account_number = account_number
ORDER BY 3, 1;

/*Problem 4*/
SELECT vendor_name, invoice_date, invoice_number, invoice_sequence AS li_sequence, line_item_amount AS li_amount
FROM vendors V INNER JOIN invoices I
	ON V.vendor_id = I.vendor_id
INNER JOIN invoice_line_items L
	ON I.invoice_id = L.invoice_id
ORDER BY 1, 2, 3, 4;

/*Problem 5*/
SELECT V1.vendor_id, V1.vendor_name, concat(V1.vendor_contact_first_name, " ", V1.vendor_contact_last_name) AS contact_name
FROM vendors V1 INNER JOIN vendors V2
	ON V1.vendor_contact_last_name = V2.vendor_contact_last_name
    AND V1.vendor_id <> V2.vendor_id
ORDER BY V1.vendor_contact_last_name;

/*Problem 6*/
SELECT GL.account_number, account_description
FROM general_ledger_accounts GL LEFT JOIN invoice_line_items LI
    ON GL.account_number = LI.account_number
WHERE invoice_id IS NULL
ORDER BY 1;

/*Problem 7*/
SELECT vendor_name, vendor_state
FROM vendors
WHERE vendor_state = "CA"
UNION
SELECT vendor_name, 'Outside CA'
FROM vendors
WHERE vendor_state <> "CA"
ORDER BY vendor_name;
