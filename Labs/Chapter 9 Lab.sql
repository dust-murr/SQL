USE ap;

/*Problem 1*/
SELECT invoice_total, ROUND(invoice_total, 1) AS one_digit, 
	ROUND(invoice_total, 0) AS zero_digits, ROUND(invoice_total, -2) AS nearest_hundred
FROM invoices;

/*Problem 2*/
Use ex;

SELECT start_date, DATE_FORMAT(start_date, '%b/%d/%y') AS format1,
	DATE_FORMAT(start_date, '%c/%e/%y') AS format2, DATE_FORMAT(start_date, '%h:%i %p') AS twelve_hour,
	DATE_FORMAT(start_date, '%c/%e/%y %h:%i %p') AS format3
FROM date_sample;

/*Problem 3*/
Use ap;

SELECT vendor_name, UPPER(vendor_name) AS vendor_name_upper, vendor_phone, 
	SUBSTRING(vendor_phone, LENGTH(vendor_phone) - 3) AS last_digits1, RIGHT(vendor_phone, 4) AS last_digits2,	
	REPLACE(REPLACE(REPLACE(vendor_phone, '(', ''), ') ', '.'), '-', '.') AS phone_with_dots, 
    IF(
		LOCATE(' ', vendor_name) > 0, 
			SUBSTRING(vendor_name, LOCATE(' ', vendor_name) + 1, 
				IF(LOCATE(' ', vendor_name, LOCATE(' ', vendor_name) + 1) > 0,
					LOCATE(' ', vendor_name, LOCATE(' ', vendor_name) + 1) - LOCATE(' ', vendor_name),
					LENGTH(vendor_name) - LOCATE(' ', vendor_name))
		)
	   ,' ') AS second_word
FROM vendors;

/*Problem 4*/
SELECT invoice_number, invoice_date, DATE_ADD(invoice_date, INTERVAL 30 DAY) AS invoice_date_plus30, payment_date, 
	DATEDIFF(payment_date, invoice_date) AS days_to_pay, MONTH(invoice_date) AS invoice_date_month,
    YEAR(invoice_date) AS invoice_date_year
FROM invoices
WHERE MONTHNAME(invoice_date) = 'May';
