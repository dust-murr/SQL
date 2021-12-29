USE my_guitar_shop;

/*Problem 1*/
SELECT product_code, product_name, list_price, discount_percent
FROM products
ORDER BY list_price DESC;

/*Problem 2*/
SELECT CONCAT(last_name, ', ', first_name) AS full_name
FROM customers
WHERE last_name > 'L'
ORDER BY full_name;

/*Problem 3*/
SELECT product_name, list_price, date_added
FROM products
WHERE list_price BETWEEN 500 AND 2000
ORDER BY date_added DESC;

/*Problem 4*/
SELECT product_name, list_price, discount_percent, ROUND(list_price * discount_percent * .01 , 2) AS discount_amount, 
			ROUND(list_price - (list_price * discount_percent * .01), 2) AS discount_price
FROM products
ORDER BY discount_price DESC
LIMIT 5;

/*Problem 5*/
SELECT item_id, item_price, discount_amount, quantity, item_price * quantity AS price_total,
			discount_amount * quantity AS discount_total, (item_price - discount_amount) * quantity AS item_total
FROM order_items
WHERE (item_price - discount_amount) * quantity > 500
ORDER BY item_total DESC;

/*Problem 6*/
SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date IS NULL;

/*Problem 7*/
SELECT NOW() AS today_unformatted, DATE_FORMAT(NOW(), '%e-%b-%Y') AS today_formatted;

/*Problem 8*/
SELECT 100 AS price, .07 AS tax_rate, 100*.07 AS tax_amount, 100*1.07 AS total;
