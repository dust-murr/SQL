USE my_guitar_shop;

/*Problem 1*/
SELECT category_name, product_name, list_price
FROM categories c INNER JOIN products p
	ON c.category_id = p.category_id
ORDER BY 1, 2;

/*Problem 2*/
SELECT first_name, last_name, line1, city, state, zip_code 
FROM customers c INNER JOIN addresses a
	ON c.customer_id = a.customer_id
WHERE email_address = "allan.sherwood@yahoo.com";

/*Problem 3*/
SELECT first_name, last_name, line1, city, state, zip_code 
FROM customers c INNER JOIN addresses a
	ON c.customer_id = a.customer_id
    AND c.shipping_address_id = a.address_id;
    
/*Problem 4*/
SELECT c.last_name, c.first_name, o.order_date, p.product_name, item_price, discount_amount, quantity 
FROM customers c INNER JOIN orders o
	ON c.customer_id = o.customer_id
INNER JOIN order_items oi
	ON o.order_id = oi.order_id
INNER JOIN products p
	ON oi.product_id = p.product_id
ORDER BY 1, 3, 4;

/*Problem 5*/
SELECT p1.product_name, p1.list_price 
FROM products p1 INNER JOIN products p2
	ON p1.product_id <> p2.product_id
	AND p1.list_price = p2.list_price
ORDER BY 1;

/*Problem 6*/
SELECT category_name, product_id
FROM categories c LEFT JOIN products p
	ON c.category_id = p.category_id
WHERE product_id IS NULL;

/*Problem 7*/
SELECT "SHIPPED" AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NOT NULL
UNION
SELECT "NOT SHIPPED" AS ship_status, order_id, order_date
FROM orders
WHERE ship_date IS NULL
ORDER BY 3;
