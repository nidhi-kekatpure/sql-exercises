USE sql_store;

SELECT * 
FROM customers;

SELECT * 
FROM order_item_notes;

SELECT *
FROM customers 
WHERE customer_id = 1;

SELECT * 
FROM customers
-- WHERE customer_id=1
ORDER BY first_name;

-- SELECT CLAUSE

SELECT last_name, first_name, points + 10
FROM customers;

SELECT first_name, last_name, points, points + 10
FROM customers;

SELECT
	first_name,
    last_name,
    points,
    points + 10 * 100
FROM customers;

SELECT 
	first_name,
    last_name,
    points,
    (points + 10) * 100 AS discount_factor
FROM customers;

SELECT
	first_name,
    last_name,
    points,
    (points + 10) * 100 AS 'discounted factor'
FROM customers;

SELECT DISTINCT state
FROM customers;

SELECT *
FROM products;

SELECT 
	name,
    unit_price,
    unit_price * 1.1 AS 'new price'
FROM products;

-- WHERE CLAUSE

SELECT *
FROM customers
WHERE points > 3000;

-- OPERATORS IN WHERE CLAUSE : >, >=, <, <=, =, != (Not equal to), <> (Not equal to)
-- String and Dates in quoates ('' OR "")
-- Dates in YYYY-MM-DD

SELECT * 
FROM Customers
WHERE state = 'VA';

SELECT * 
FROM customers 
WHERE state != 'va';

SELECT *
FROM customers
WHERE state <> 'VA';

SELECT * 
FROM customers
WHERE birth_date > '1990-01-01';

SELECT * 
FROM orders;

SELECT *
FROM orders 
WHERE order_date >= '2018-01-01' AND order_date < '2019-01-01';

SELECT * 
FROM customers
WHERE birth_date >= '1990-01-01' AND points > 1000;

SELECT * 
FROM customers 
WHERE birth_date >= '1990-01-01' OR points > 1000;

-- AND gets executed 1st then OR like in operators * and / does than + -, but we can use ()

SELECT *
FROM customers 
WHERE birth_date > '1990-01-01' OR points > 1000 AND state = 'VA';

SELECT *
from customers 
WHERE birth_date >= '1990-01-01' OR 
	(points > 1000 AND state = 'VA');

-- NOT

SELECT *
FROM customers 
WHERE NOT (birth_date > '1990-01-01' OR points > 1000);

-- NOT operator / Clause turns anything in bracket to reverse so > becomes <= , OR becomes AND ,,,, the below qury will give the same result as above query 

SELECT *
FROM customers 
WHERE birth_date <= '1990-01-01' AND points <=1000;

SELECT * 
FROM order_items;

SELECT *
FROM order_items
WHERE order_id = 6 AND (quantity * unit_price) > 30;

-- in

SELECT *
FROM customers 
WHERE state = 'VA' OR state = 'GA' OR state = 'FL';

-- Above in cleaner and short way using in replacemnet of OR 

SELECT *
FROM customers 
WHERE state IN ('VA', 'FL', 'GA');

SELECT *
FROM customers 
WHERE state NOT IN ('VA', 'FL', 'GA');

SELECT *
FROM customers 
WHERE state IN ('GA','FL');

SELECT * 
FROM products;

SELECT *
FROM products 
WHERE quantity_in_stock IN (49,38,72);

-- BETWEEN

SELECT *
FROM customers 
WHERE points >= 1000 AND points <= 3000;

SELECT *
FROM customers 
WHERE points BETWEEN 1000 AND 3000;

-- BETWEEN operator is inclusive 

SELECT * 
FROM customers 
WHERE birth_date between '1990-01-01' AND '2000-01-01';

SELECT *
FROM customers 
WHERE last_name LIKE 'b%';

SELECT * 
FROM customers 
WHERE last_name LIKE 'brush%';

SELECT * 
FROM customers 
WHERE last_name LIKE '%b%';

SELECT * 
FROM customers 
WHERE last_name LIKE '%y';

SELECT * 
FROM customers
WHERE last_name LIKE '_y';

SELECT *
FROM customers 
WHERE last_name LIKE '_____y';

SELECT *
FROM customers 
WHERE last_name LIKE 'b____y';

-- % for any number of charecters 
-- _ for single character 

SELECT * 
FROM customers 
WHERE address LIKE '%TRAIL%' OR 
	  address LIKE '%AVENUE%';

SELECT * 
FROM customers 
WHERE phone LIKE '%9';

SELECT *
FROM customers
WHERE phone NOT LIKE '%9';

SELECT * 
FROM customers 
WHERE last_name LIKE '%field%';

SELECT * 
FROM customers 
WHERE last_name REGEXP 'field';

SELECT *
FROM customers 
WHERE last_name REGEXP 'field$';

SELECT *
FROM customers 
WHERE last_name REGEXP '^field';

SELECT * 
FROM customers 
WHERE last_name REGEXP 'field|mac|rose';

SELECT *
FROM customers 
WHERE last_name REGEXP '^field|mac|rose';

SELECT *
FROM customers 
WHERE last_name REGEXP 'field$|mac|rose';

SELECT * 
FROM customers
WHERE last_name REGEXP '[gmi]e'; 

-- returns anything with ge, me, ie

SELECT *
FROM customers 
WHERE last_name REGEXP 'e[fmi]';

SELECT *
FROM customers 
WHERE last_name REGEXP '[a-h]y$';

SELECT * 
FROM customers
WHERE last_name REGEXP '[a-h]e';

-- ^ beginning of string
-- $ for end of string 
-- | OR
-- [abcd] any single charater in the bracet  
-- [a-d] without writting abcd in a range 

SELECT * 
FROM customers 
WHERE first_name REGEXP 'ELKA|AMBUR';

SELECT *
FROM customers
where last_name REGEXP 'EY|ON$';

SELECT * 
FROM customers 
WHERE last_name REGEXP 'EY$|ON$';

SELECT *
FROM customers 
WHERE last_name REGEXP 'SE|^MY';

SELECT * 
FROM customers
WHERE last_name REGEXP '^MY|SE';

SELECT *
FROM customers 
WHERE last_name REGEXP 'b[ru]';

SELECT * 
FROM customers 
WHERE last_name REGEXP 'br|bu';

SELECT *
FROM customers 
WHERE phone IS NULL;

SELECT *
FROM customers 
WHERE phone IS NOT NULL;

SELECT *
FROM orders
WHERE shipped_date IS NULL;

SELECT * 
FROM orders 
WHERE shipped_date IS NULL OR shipper_id IS NULL;

SELECT *
FROM orders
WHERE shipper_id IS NULL;

SELECT * 
FROM order_statuses;

SELECT *
FROM orders
WHERE status = 1;

SELECT *
FROM customers
ORDER BY first_name;

SELECT *
FROM customers 
ORDER BY first_name DESC;

SELECT * 
FROM customers
ORDER BY state, first_name;

SELECT * 
FROM customers
ORDER BY state DESC, first_name ASC;

SELECT first_name, last_name 
FROM customers
ORDER BY birth_date;

SELECT first_name, last_name, 10 AS points 
FROM customers 
ORDER BY points, first_name;

SELECT first_name, last_name, points 
FROM customers 
ORDER BY 1,2;

SELECT *
FROM order_items;

SELECT * 
FROM order_items
WHERE order_id = 2
ORDER BY quantity * unit_price DESC;

SELECT 
	order_id,
    product_id,
    quantity, 
    unit_price
FROM order_items 
WHERE order_id = 2
ORDER BY quantity * unit_price DESC;
    
SELECT *, quantity * unit_price AS 'Total price'
FROM order_items 
ORDER BY 'Total price' DESC;


-- LIMIT

SELECT *
FROM customers 
LIMIT 3;

SELECT *
FROM customers 
LIMIT 6, 3;

SELECT *
FROM customers
ORDER BY first_name ASC
LIMIT 3;

SELECT *
FROM customers 
ORDER BY points DESC
LIMIT 5, 2;

SELECT * 
FROM customers
ORDER BY points DESC
LIMIT 3;

-- INNER JOINS

SELECT *
FROM customers 
JOIN orders 
	ON customers.customer_id = orders.customer_id;
    
SELECT
	order_id,
    first_name,
    last_name
FROM customers
JOIN orders
	ON orders.customer_id = customers. customer_id;
    
SELECT
	order_id,
    orders.customer_id,
    first_name,
    last_name
FROM customers
JOIN orders 
	ON orders.customer_id=customers.customer_id;
    
    
SELECT
	order_id,
    o.customer_id,
    first_name,
    last_name
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id;
    
SELECT *
FROM order_items oi
JOIN products p
	 ON oi.product_id = p.product_id;

SELECT 
	order_id,
    p.product_id,
    name,
    quantity,
    oi.unit_price
FROM order_items oi
JOIN products p
	ON oi.product_id = p.product_id;
    
SELECT *
FROM order_items oi
JOIN sql_inventory.products p
	ON oi.product_id = p.product_id;
    
    
USE sql_hr;

SELECT *
FROM employees e
JOIN employees m
	ON e.employee_id = m.reports_to;


USE sql_store;

SELECT *
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
JOIN order_statuses os
	ON os.order_status_id = o.status;
    
SELECT 
	o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS Status
FROM orders o
JOIN customers c
	ON o.customer_id =  c.customer_id
JOIN order_statuses os
	ON os.order_status_id = o.status;
    
USE sql_invoicing;

SELECT *
FROM payments p
JOIN clients c
	 ON p.client_id = c.client_id
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;

SELECT 
    p.invoice_id,
    p.date,
    p.amount,
    c.name AS 'Client Name',
    pm.name AS 'Payment Type'
FROM payments p
JOIN clients c
	ON p.client_id = c.client_id
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id;


-- Compound joins AND 
USE sql_store;

SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_ID
    AND oi.product_id = oin.product_id;
    
-- Implicit join syntax
 

SELECT *
FROM customers c, orders o
WHERE c.customer_id = o.customer_id;

-- DONT USE ABOVE, IF WE FORGET TO WRITE THE WHERE CLAUSE THE TABLES WILL CROSS JOIN LIKE IN THE BELLOW QUERY

SELECT *
FROM customers c, orders o;

-- WE GET MULTIPLUE RECORDS AS WE ACCEDINDLY CROSS JOIN IN THE ABOVE QUERY SO DONT USE IMPLICIT JOIN SYNTAX

-- OUTER JOIN

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id 
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id
FROM customers c
RIGHT JOIN orders o
	ON c.customer_id = o.customer_id 
ORDER BY c.customer_id;

-- LEFT join , joins the table whole of left table , weather c.customer_id = o.customer_id is true or not, it will retuen NULL values for customers who have not ordered 

SELECT
	p.product_id,
    p.name,
    oi.quantity
FROM products p
LEFT JOIN order_items oi
		ON p.product_id = oi.product_id
ORDER BY p.product_id;

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name AS Shipper
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id;

SELECT 
	o.order_date,
    o.order_id,
    c.first_name,
    sh.name AS Shipper,
    os.name AS Status
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON sh.shipper_id = o.shipper_id
JOIN order_statuses os
	ON os.order_status_id = o.status;
    
SELECT 
	o.order_date,
    o.order_id,
    c.first_name,
    sh.name AS Shipper,
    os.name AS Status 
FROM orders o
JOIN customers c
	USING (customer_id)
JOIN order_statuses os 
	ON os.order_status_id = o.status
LEFT JOIN shippers sh
	USING (shipper_id);
    
    
USE sql_hr;

SELECT * 
FROM employees;

SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS Manager 
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;

SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager
FROM employees e
LEFT JOIN employees m
	ON e.reports_to = m.employee_id;
    
USE sql_store;

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name AS Shipper 
FROM customers c
JOIN orders o
	USING (customer_id)
LEFT JOIN shippers sh
	USING (shipper_id);
    


SELECT *
FROM order_item_notes oin
JOIN order_items oi
	USING (order_id,product_id);


SELECT 
	p.date,
    p.amount,
    c.name AS client,
    pm.name AS 'payment method'
FROM payments p
JOIN clients c
	USING (client_id)
JOIN payment_methods pm 
	ON pm.payment_method_id = p.payment_method;
    
SELECT 
	o.order_id,
    c.first_name 
FROM orders o
NATURAL JOIN customers c;

-- Natuaral clause does not require ON or USING clause so dangarous 


-- CROSS JOIN every record from right table will be join to left table
-- CROSS JOIN used to understand probabilty and perputation and combinations of records like Size, S, M, L, to colors Blue, pink , red etc 
SELECT 
	c.first_name AS Customer,
    p.name AS Product
FROM customers c
CROSS JOIN products p
ORDER BY c.first_name;

-- IMPLICIT SYNTAX FROM CROSS JOIN 

SELECT
	c.first_name AS Customer,
    p.name AS Product
FROM customers c, products p
ORDER BY c.first_name;

SELECT 
	p.name AS Product ,
    s.shipper_id
FROM shippers s, products p
ORDER BY Product;

SELECT 
	p.name AS Product,
    s.shipper_id
FROM products p
CROSS JOIN shippers s
ORDER BY p.name;
    
-- UNION 

SELECT *
FROM orders;

SELECT 
	order_id,
    order_date,
    'Active' AS Status 
FROM orders 
WHERE order_date >= '2019-01-01'
UNION
SELECT 
	order_id,
    order_date,
    'Archive' AS Status
FROM orders 
WHERE order_date < '2019-01-01';

SELECT *
FROM customers;

SELECT 
	customer_id,
    first_name,
    points,
    'Bronze' AS Type 
FROM customers
WHERE points < 2000
UNION
SELECT 
	customer_id,
    first_name, 
    points,
    'Sliver' AS TYPE
FROM customers 
WHERE points BETWEEN 2000 AND 3000
UNION 
SELECT
	customer_id, 
    first_name,
    points,
    'Gold' AS Type 
FROM customers
WHERE points > 3000
ORDER BY first_name;

-- Insert, update, delete in coloumn 

INSERT INTO customers 
VALUES (
		DEFAULT, 
		'SMITH',
        'JOHN',
        '1990-01-01',
        NULL,
        'address',
        'fremont',
        'CA',
        default
        );
        
INSERT INTO customers (
	first_name,
    last_name,
    birth_date,
    address,
    city,
    state,
    points)
VALUES (
	'Kuldeep',
    'Ghate',
    '1990-01-01',
    'vista 99',
    'San jose',
    'CA',
    0);
    
INSERT INTO shippers (name)
VALUES ('Shipper1'),
		('Shipper2'),
        ('Shipper3');
        
INSERT INTO products
VALUES (DEFAULT,
		'Bottel',
        25,
        5);
        
INSERT INTO products (
	name,
    quantity_in_stock,
    unit_price)
VALUES (
	'Cup',
    50,
    3);
    
INSERT INTO products (
	name,
    quantity_in_stock,
    unit_price)
VALUES ('TV', 5, 2),
		('Box',45, 3);
        
INSERT INTO orders (customer_id, order_date, status)
VALUES 
		(1, '1990-01-03', 2),
        (2, '1994-02-05', 1);
        
SELECT LAST_INSERT_ID();

INSERT INTO order_items 
VALUES (LAST_INSERT_ID(), 5, 3, 2.95),
		(LAST_INSERT_ID(), 3, 5, 3.95);
    
INSERT INTO shippers (name)
VALUES 	
		('TEST1');
        
SELECT LAST_INSERT_ID();

INSERT INTO shippers (name)
VALUES 
		('TEST2'),
        ('TEST3');
        
SELECT LAST_INSERT_ID();

INSERT INTO orders 
		(customer_id,
        order_date,
        status,
        shipper_id)
VALUES 
		(3, '1992-04-25', 1, LAST_INSERT_ID()),
        (4, '1992-05-02', 2, LAST_INSERT_ID());


-- CREATE COPY OF A TABLE

CREATE TABLE order_archive AS
SELECT * FROM orders;

CREATE TABLE order_archive AS
SELECT * FROM orders;


SELECT * 
FROM orders
WHERE order_date < '2018-01-01';

INSERT INTO order_archive
SELECT *
FROM orders 
WHERE order_date < '2018-01-01';

USE sql_invoicing;

CREATE TABLE invoice_archive AS
SELECT * FROM invoices;

CREATE TABLE invoice_archive_one AS 
SELECT 
	i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.due_date,
    i.payment_date
FROM invoices i
JOIN clients c
	USING (client_id)
WHERE i.payment_date IS NOT NULL;


CREATE TABLE invoice_archive AS
SELECT 
	i.invoice_id,
    i.number,
    c.name AS client,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.due_date,
    i.payment_date
FROM invoices i
JOIN clients c
	USING (client_id)
WHERE i.payment_date IS NOT NULL;

-- DO NOT USE INSERT IF ITS NOT SELECT * , AS IN THW THE WHOLE TABLE , IF YOU ARE ADDING COLOUMNS ONE BY ONE IN A TABLE TO CREATE COPY IT CAN RUN IN INTEGER VALUE PROBLEM 
-- USE CREATE TABLE ___ AS SELECT order_id etc if insert is not working 

-- update

UPDATE invoices 
SET payment_total = 50, 
	payment_date = '1990-01-01'
WHERE invoice_id = 1;

UPDATE invoices 
SET payment_total = DEFAULT,
	payment_date = null
WHERE invoice_id = 1;

UPDATE invoices 
SET payment_total = invoice_total * 0.5,
	payment_date = due_date
 WHERE invoice_id = 3;   
 
 -- IN workbench sql editoe it does not allow multiple updates of row, in previous versions , to change that go to prefrences in edit and go to SQL editor , and unclick safe updates (rejects updates and delete with no restrictions )
 
UPDATE invoices 
SET payment_total = invoice_total * 0.7,
	payment_date = due_date
WHERE client_id = 3;

-- IF you want to update all the records in a table, dont write WHERE cluse , it will update all the records to what it wants 

UPDATE invoices 
SET payment_total = invoice_total * 0.8,
	payment_date = due_date 
WHERE client_id IN (3,4);

USE sql_store;

SELECT *, points + 50
FROM customers 
WHERE birth_date < '1990-01-01';

UPDATE customers 
SET points = points + 50
WHERE birth_date < '1990-01-01';

USE sql_invoicing;

UPDATE invoices 
SET payment_total = invoice_total * 0.8,
	payment_date = due_date 
WHERE client_id = 
				(SELECT client_id
				FROM clients 
				WHERE name = 'Vinte');
                
UPDATE invoices 
SET payment_total = invoice_total * 0.7,
	payment_date = due_date 
WHERE client_id IN
				(SELECT client_id
				FROM clients 
				WHERE state IN ('CA', 'TX'));
                
USE sql_store;

UPDATE orders
SET comments = 'Gold customer'
WHERE customer_id IN
				(SELECT customer_id
				FROM customers 
				WHERE points > 3000);

-- DELETE IS A VERY DANGEROUS QUERY USE CAREFULLY

-- DELETE FROM invoice 

-- ABOVE query will delete all the records in the table invioces

USE sql_invoicing;

DELETE FROM invoices 
WHERE client_id = 
				(SELECT client_id
				FROM clients 
				WHERE name = 'myworks');

