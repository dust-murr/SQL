USE my_guitar_shop;

/*Problem 1*/
SELECT COUNT(order_id) AS order_count, SUM(tax_amount) AS tax_total
FROM orders;

/*Problem 2*/
SELECT category_name, COUNT(P.category_id) AS product_count, 
MAX(list_price) AS most_expensive_product
FROM categories C INNER JOIN products P
	ON C.category_id = P.category_id
GROUP BY category_name
ORDER BY COUNT(P.category_id) DESC;

/*Problem 3*/
SELECT email_address, SUM(item_price * quantity) AS item_price_total, 
SUM(discount_amount * quantity) AS discount_amount_total
FROM customers C INNER JOIN orders O
	ON C.customer_id = O.customer_id
INNER JOIN order_items OI
	ON O.order_id = OI.order_id
GROUP BY email_address
ORDER BY SUM(item_price * quantity) DESC;

/*Problem 4*/
SELECT email_address, COUNT(O.order_id) AS order_count, 
SUM((item_price - discount_amount) * quantity) AS order_total
FROM customers C INNER JOIN orders O
	ON C.customer_id = O.customer_id
INNER JOIN order_items OI
	ON O.order_id = OI.order_id
GROUP BY email_address
HAVING COUNT(O.order_id) > 1
ORDER BY SUM((item_price - discount_amount) * quantity) DESC;

/*Problem 5*/
SELECT email_address, COUNT(O.order_id) AS order_count, 
SUM((item_price - discount_amount) * quantity) AS order_total
FROM customers C INNER JOIN orders O
	ON C.customer_id = O.customer_id
INNER JOIN order_items OI
	ON O.order_id = OI.order_id
WHERE item_price > 400
GROUP BY email_address
HAVING COUNT(O.order_id) > 1
ORDER BY SUM((item_price - discount_amount) * quantity) DESC;

/*Problem 6*/
SELECT product_name, SUM((item_price - discount_amount) * quantity) AS product_total
FROM products P INNER JOIN order_items OI
	ON P.product_id = OI.product_id
GROUP BY product_name WITH ROLLUP;

/*Problem 7*/
SELECT email_address, COUNT(DISTINCT OI.product_id) AS number_of_products
FROM customers C INNER JOIN orders O
	ON C.customer_id = O.customer_id
INNER JOIN order_items OI
	ON O.order_id = OI.order_id
GROUP BY email_address
HAVING COUNT(DISTINCT OI.product_id) > 1;
