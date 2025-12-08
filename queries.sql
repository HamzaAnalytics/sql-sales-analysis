-- 1) Total revenue
SELECT SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- 2) Top selling product
SELECT p.product_name, SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 1;

-- 3) Revenue by country
SELECT c.country, SUM(p.price * s.quantity) AS revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.country;

-- 4) Monthly revenue
SELECT DATE_TRUNC('month', sale_date) AS month, 
       SUM(p.price * s.quantity) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY month
ORDER BY month;
