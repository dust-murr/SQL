USE my_guitar_shop;


/*Problem 1*/
CREATE OR REPLACE VIEW customer_addresses AS
	SELECT C.customer_id, email_address, last_name, first_name, A1.line1 AS bill_line1, A1.line2 AS bill_line2, 
		A1.city AS bill_city, A1.state AS bill_state, A1.zip_code AS bill_zip, A2.line1 AS ship_line1, A2.line2 AS ship_line2, 
		A2.city AS ship_city, A2.state AS ship_state, A2.zip_code AS ship_zip
	FROM customers C INNER JOIN addresses A1
		ON C.billing_address_id = A1.address_id
        INNER JOIN addresses A2
			ON C.shipping_address_id = A2.address_id
    ORDER BY 3, 4;
    
SELECT * FROM customer_addresses;


/*Problem 2*/
SELECT customer_id, last_name, first_name, bill_line1
FROM customer_addresses
ORDER BY 2;


/*Problem 3*/
UPDATE customer_addresses
SET ship_line1 = '1990 Westwood Blvd'
WHERE customer_id = 8;

SELECT * FROM customer_addresses WHERE customer_id = 8;


/*Problem 4*/
CREATE OR REPLACE VIEW order_item_products AS
	SELECT O.order_id, O.order_date, O.tax_amount, O.ship_date, OI.item_price, OI.discount_amount, 
		(OI.item_price - OI.discount_amount) AS final_price, OI.quantity, 
			(OI.item_price - OI.discount_amount) * OI.quantity AS item_total, P.product_name
    FROM orders O NATURAL JOIN order_items OI NATURAL JOIN products P;
    
SELECT * FROM order_item_products;


/*Problem 5*/
CREATE OR REPLACE VIEW product_summary AS
	SELECT product_name, COUNT(quantity) AS order_count, SUM(item_total) AS order_total
    FROM order_item_products
    GROUP BY product_name;
    
SELECT * FROM product_summary;


/*Problem 6*/
SELECT product_name, order_total
FROM product_summary
ORDER BY 2 DESC
LIMIT 0, 5;
