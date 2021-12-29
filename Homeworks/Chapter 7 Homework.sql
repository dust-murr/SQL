USE my_guitar_shop;

/*Problem 1*/
SELECT category_name
FROM categories
WHERE category_id IN
	(SELECT DISTINCT category_id
    FROM products)
ORDER BY category_name;

/*Problem 2*/
SELECT product_name, list_price
FROM products
WHERE list_price >
	(SELECT AVG(list_price)
	FROM products
	WHERE list_price > 0)
ORDER BY list_price DESC;

/*Problem 3*/
SELECT category_name
FROM categories C
WHERE NOT EXISTS
	(SELECT *
    FROM products P
    WHERE P.category_id = C.category_id);
    
/*Problem 4*/
SELECT email_address, MO.order_id, MAX(order_total) AS max_order_total
FROM 
	(
	SELECT email_address, OI.order_id, SUM((item_price - discount_amount) * quantity) AS order_total
	FROM order_items OI INNER JOIN orders O
		ON OI.order_id = O.order_id
        INNER JOIN customers C
			ON O.customer_id = C.customer_id
	GROUP BY email_address, OI.order_id
	) MO
GROUP BY email_address;

/*Problem 5*/
SELECT P1.product_name, P1.discount_percent
FROM products P1
WHERE NOT EXISTS
	(SELECT *
    FROM products P2
    WHERE P2.discount_percent = P1.discount_percent AND P2.product_name <> P1.product_name)
ORDER BY P1.product_name;

/*Problem 6*/
SELECT email_address, O2.order_id, order_date
FROM customers C
	INNER JOIN (
				SELECT O1.customer_id, MIN(order_date) AS oldest_order_date
				FROM orders O1
				GROUP BY O1.customer_id
				) OOD
                ON C.customer_id = OOD.customer_id 
	INNER JOIN orders O2
		ON OOD.oldest_order_date = O2.order_date;
