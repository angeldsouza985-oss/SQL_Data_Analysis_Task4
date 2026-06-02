CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    city TEXT
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    amount REAL,
    order_date TEXT
);

INSERT INTO customers VALUES (1,'John','Mumbai');
INSERT INTO customers VALUES (2,'Alice','Delhi');
INSERT INTO customers VALUES (3,'Bob','Bangalore');
INSERT INTO customers VALUES (4,'Emma','Chennai');
INSERT INTO customers VALUES (5,'David','Pune');

INSERT INTO orders VALUES (101,1,5000,'2026-01-10');
INSERT INTO orders VALUES (102,2,2500,'2026-01-15');
INSERT INTO orders VALUES (103,1,3000,'2026-02-01');
INSERT INTO orders VALUES (104,3,4500,'2026-02-05');
INSERT INTO orders VALUES (105,4,6000,'2026-02-10');
INSERT INTO orders VALUES (106,2,1500,'2026-02-12');
INSERT INTO orders VALUES (107,5,7000,'2026-03-01');
INSERT INTO orders VALUES (108,3,3500,'2026-03-05');
SELECT * FROM customers;
SELECT * FROM orders
WHERE amount > 4000;
SELECT * FROM orders
ORDER BY amount DESC;
SELECT customer_id,
       SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;
SELECT AVG(amount) AS average_order_value
FROM orders;
SELECT c.customer_name,
       o.order_id,
       o.amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;
SELECT customer_id,
       amount
FROM orders
WHERE amount >
(
    SELECT AVG(amount)
    FROM orders
	
);
CREATE VIEW customer_spending AS
SELECT c.customer_name,
       SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;
SELECT * FROM customer_spending;
CREATE INDEX idx_customer_id
ON orders(customer_id);
SELECT c.customer_name,
       o.order_id,
       o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;
