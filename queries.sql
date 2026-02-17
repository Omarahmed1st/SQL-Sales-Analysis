/* =====================================================
   Advanced SQL Sales Analysis - PostgreSQL
   Dataset: Superstore (9,994 records)
   Author: Omar ahmed
===================================================== */


/* 1️⃣ Top 10 Customers by Revenue */
SELECT customer_name,
       SUM(sales) AS total_revenue
FROM superstore
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 10;



/* 2️⃣ Monthly Revenue Trend */
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(sales) AS monthly_revenue
FROM superstore
GROUP BY month
ORDER BY month;



/* 3️⃣ Profit by Region */
SELECT region,
       SUM(profit) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;



/* 4️⃣ Best Selling Category */
SELECT category,
       SUM(sales) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;



/* 5️⃣ Average Order Value */
SELECT AVG(sales) AS average_order_value
FROM superstore;



/* 6️⃣ Top 5 Most Profitable Products */
SELECT product_name,
       SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 5;



/* 7️⃣ Ranking Customers by Sales (Window Function) */
SELECT customer_name,
       SUM(sales) AS total_sales,
       RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM superstore
GROUP BY customer_name;



/* 8️⃣ Sales by Segment */
SELECT segment,
       SUM(sales) AS total_sales,
       SUM(profit) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;



/* 9️⃣ Yearly Revenue */
SELECT DATE_PART('year', order_date) AS year,
       SUM(sales) AS yearly_revenue
FROM superstore
GROUP BY year
ORDER BY year;



/* 🔟 Most Discounted Category */
SELECT category,
       AVG(discount) AS avg_discount
FROM superstore
GROUP BY category
ORDER BY avg_discount DESC;
