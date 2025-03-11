SELECT * FROM sql_inventory.products;
USE sql_inventory;

SELECT *
FROM products p
JOIN sql_store.order_items oi
	ON p.product_id = oi.product_id;