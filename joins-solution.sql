-- 1. Get all customers and their addresses.
SELECT first_name, last_name, street, city, state, zip FROM customers
JOIN addresses ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items.
SELECT order_date, product_id FROM orders
JOIN line_items ON orders.id = line_items.order_id;
-- unsure if returning expected columns

-- 3. Which warehouses have cheetos?
SELECT warehouse, description FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
where description = 'cheetos'
GROUP BY warehouse, description;

-- table products has:
--  id
--  description

-- table line_items has:
--  id
--  order_id
--  product_id

-- table warehouse has:
--  id
--  warehouse

-- table warehouse_product has:
--  product_id
--  warehouse_id
--  on_hand

-- 4. Which warehouses have diet pepsi?
SELECT warehouse, description FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
where description = 'diet pepsi'
GROUP BY warehouse, description;

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
-- table customers has:
--  id, first_name, last_name
-- table addresses has customer_id
-- along with:  street, city, state, zip, address_type
-- table orders has:
--  id, order_date, address_id
SELECT first_name, last_name, COUNT(customers.id) AS number_of_orders FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customers.id;

-- 6. How many customers do we have?
SELECT COUNT(customers.id) AS number_of_customers FROM customers;

-- 7. How many products do we carry?
SELECT COUNT(id) AS number_of_products FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT description, SUM(on_hand) FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
JOIN products ON warehouse_product.product_id = products.id
where description = 'diet pepsi'
GROUP BY description;
