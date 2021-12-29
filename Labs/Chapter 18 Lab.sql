/*Problem 2*/
CREATE USER ray@localhost IDENTIFIED BY 'temp';


/*Problem 3*/
GRANT INSERT, UPDATE, SELECT
ON ap.vendors
TO ray@localhost;

GRANT INSERT, UPDATE
ON ap.invoice_line_items
TO ray@localhost;


/*Problem 4*/
SHOW GRANTS FOR ray@localhost;

/*DROP USER ray@localhost;*/
