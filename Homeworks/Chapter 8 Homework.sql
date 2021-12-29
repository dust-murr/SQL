USE my_guitar_shop;

/*Problem 1*/
SELECT list_price, FORMAT(list_price, 1) AS price_format, CONVERT(list_price, SIGNED) AS price_convert, 
	CAST(list_price AS SIGNED) AS price_cast
FROM products;

/*Problem 2*/
SELECT date_added, CAST(date_added AS DATE) AS added_date, CAST(date_added AS TIME) AS added_time,
	CAST(date_added AS CHAR(7)) AS added_char7
FROM products;
