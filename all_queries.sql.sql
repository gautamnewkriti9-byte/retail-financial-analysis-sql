USE retail_finance;

-- ================================================
-- Q1: Total Revenue, Profit, and Overall Margin
-- ================================================
SELECT 
  ROUND(SUM(sales), 2) AS total_revenue,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM orders;

-- ================================================
-- Q2: Revenue and Profit by Region
-- ================================================
SELECT 
  region,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM orders
GROUP BY region
ORDER BY total_profit DESC;

-- ================================================
-- Q3: Top 10 Products by Total Sales
-- ================================================
SELECT 
  p.product_name,
  p.category,
  ROUND(SUM(o.sales), 2) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY total_sales DESC
LIMIT 10;

-- ================================================
-- Q4: Top 10 Products by Total Profit
-- ================================================
SELECT 
  p.product_name,
  p.category,
  ROUND(SUM(o.profit), 2) AS total_profit
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY total_profit DESC
LIMIT 10;

-- ================================================
-- Q5: Revenue, Profit, and Margin by Category
-- ================================================
SELECT 
  p.category,
  ROUND(SUM(o.sales), 2) AS total_sales,
  ROUND(SUM(o.profit), 2) AS total_profit,
  ROUND(SUM(o.profit) / SUM(o.sales) * 100, 2) AS profit_margin_pct
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- ================================================
-- Q6: Average Discount vs Average Margin by Category
-- ================================================
SELECT 
  p.category,
  ROUND(AVG(o.discount) * 100, 2) AS avg_discount_pct,
  ROUND(SUM(o.profit) / SUM(o.sales) * 100, 2) AS profit_margin_pct
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_discount_pct DESC;

-- ================================================
-- Q7: Monthly Revenue Trend
-- ================================================
SELECT 
  YEAR(order_date) AS yr,
  MONTH(order_date) AS mo,
  ROUND(SUM(sales), 2) AS monthly_sales
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY yr, mo;

-- ================================================
-- Q8: Total Revenue by Year (YoY Growth Check)
-- ================================================
SELECT 
  YEAR(order_date) AS yr,
  ROUND(SUM(sales), 2) AS yearly_sales
FROM orders
GROUP BY YEAR(order_date)
ORDER BY yr; 

-- ================================================
-- Q9: Top 5 Customers by Total Revenue
-- ================================================
SELECT 
  c.customer_name,
  c.segment,
  ROUND(SUM(o.sales), 2) AS lifetime_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name, c.segment
ORDER BY lifetime_revenue DESC
LIMIT 5;