/*Problem 2*/
CREATE USER dustin@localhost IDENTIFIED BY 'pa55word';


/*Problem 3*/
GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.customers
TO dustin@localhost;

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.orders
TO dustin@localhost;

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.order_items
TO dustin@localhost;

GRANT SELECT
ON my_guitar_shop.products
TO dustin@localhost;

GRANT SELECT
ON my_guitar_shop.categories
TO dustin@localhost;


/*Problem 3*/
SHOW GRANTS FOR dustin@localhost;


/*Problem 4*/
REVOKE DELETE
ON my_guitar_shop.orders FROM dustin@localhost;

REVOKE DELETE
ON my_guitar_shop.order_items FROM dustin@localhost;


/*Problem 5*/
SHOW GRANTS FOR dustin@localhost;
