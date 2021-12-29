USE my_guitar_shop;

/*Problem 1*/
SELECT * FROM categories;

INSERT INTO categories
VALUES(DEFAULT, 'Brass');
    
/*Problem 2*/
SELECT * FROM categories;

UPDATE categories
SET category_name = 'Woodwinds'
WHERE category_id = 5;

/*Problem 3*/
SELECT * FROM categories;

DELETE FROM categories
WHERE category_id = 5;

/*Problem 4*/
SELECT * FROM products;

INSERT INTO products
	(product_id, category_id, product_code, product_name, description, 
    list_price, discount_percent, date_added)
VALUES(DEFAULT, 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 
'Long description to come.', 799.99, 0, now());
    
/*Problem 5*/
SELECT * FROM products;

UPDATE products
SET discount_percent = 35
WHERE product_id = 11;

/*Problem 6*/
SELECT * FROM categories;
SELECT * FROM products;

DELETE FROM products
WHERE category_id = 4;

DELETE FROM categories
WHERE category_id = 4;
