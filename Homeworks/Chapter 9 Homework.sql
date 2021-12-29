USE my_guitar_shop;

/*Problem 1*/
SELECT list_price, discount_percent, ROUND(list_price * (discount_percent / 100), 2) AS discount_amount
FROM products;

/*Problem 2*/
SELECT order_date, DATE_FORMAT(order_date, '%Y') AS order_year,
	DATE_FORMAT(order_date, '%b-%d-%Y') AS order_date_formatted, 
    DATE_FORMAT(order_date, '%l:%i %p') AS order_time,
	DATE_FORMAT(order_date, '%m/%d/%y %H:%i') AS order_datetime
FROM orders;

/*Problem 3*/
SELECT card_number, LENGTH(card_number) AS card_number_length, RIGHT(card_number, 4) AS last_four_digists,
	CONCAT('XXXX-XXXX-XXXX-', RIGHT(card_number, 4)) AS formatted_number
FROM orders;

/*Problem 4*/
SELECT order_id, order_date, DATE_ADD(order_date, INTERVAL 2 DAY) AS approx_ship_date, 
	ship_date, DATEDIFF(ship_date, order_date) AS days_to_ship
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 03 AND EXTRACT(YEAR FROM order_date) = 2015;
