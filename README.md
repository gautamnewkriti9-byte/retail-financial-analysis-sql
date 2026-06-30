# Retail Business Financial Performance Analysis (SQL Project)

## About this project

This is a SQL project I built to practice and demonstrate financial/business analysis using MySQL. I'm an MBA graduate (finance specialization) currently building toward Data Analyst / Financial Analyst / BI Analyst roles, and I wanted a project that actually reflects how I'd approach a business problem, not just a list of queries for the sake of it.

The dataset is a retail company selling across three categories, Technology, Furniture, and Office Supplies, with orders spread across 2022-2024, four regions, and three customer segments. I designed the schema, loaded the data, and wrote SQL queries to answer real business questions, the kind an FP&A or financial analyst would actually be asked.

Note: the dataset is simulated (built to mirror the structure of the well-known Superstore dataset), with patterns intentionally built in: regional differences, seasonal spikes, discount-driven margin issues, so the analysis below isn't just running queries on random numbers. It's pulling out patterns that are actually there.

## Tools used

- MySQL (Community Server)
- MySQL Workbench

## Database structure

Three tables: `customers`, `products`, `orders`. `orders` is the main fact table and links to both other tables through foreign keys (customer_id, product_id). Full schema is in `/schema/01_schema.sql`.

## Business questions I answered

1. What's the company's overall revenue, profit, and margin?
2. How does performance differ by region?
3. What are the top 10 products by sales?
4. What are the top 10 products by profit (and does that list match #3)?
5. How does profitability differ by category?
6. Is there a relationship between discounting and margin?
7. What does the monthly revenue trend look like (seasonality)?
8. How did revenue grow year over year?
9. Who are the top 5 customers by revenue?
10. How do customer segments compare on revenue and margin?

All the actual SQL is in `/queries/all_queries.sql`, each one labeled with a comment.

## What I found

**Overall, the business runs a 16.3% profit margin** ($4.4M revenue, $717K profit), which sounds fine until you break it down by category, because that average is hiding a real problem.

**Furniture is actually losing money.** -7.52% margin, despite being the second highest category by revenue ($1.37M in sales). I dug into why, and it comes down to discounting. Furniture gets discounted by 25.55% on average, compared to about 5-6% for Technology and Office Supplies. That's roughly 5x the discount rate, and it's enough to wipe out the category's profitability entirely. Technology, by comparison, runs a healthy 27.6% margin and barely gets discounted at all.

**Technology dominates everything.** Every single product in the top 10 by sales AND top 10 by profit is a Technology product, same list, almost the same order. That's a useful finding but also a bit of a warning sign for the business: there's heavy reliance on one category, and if Technology demand softened, the company doesn't really have a strong second category to fall back on (Furniture is unprofitable, Office Supplies is tiny in comparison).

**North is the strongest region**, both on revenue ($1.5M) and margin (17.06%). East is the weakest on both. Worth asking why. Could be logistics costs, local competition, pricing strategy, regional team performance, hard to say without more data, but it's a clear gap worth investigating.

**There's a strong, consistent year-end spike** in Nov/Dec every single year, roughly 2-3x a normal month's revenue. Makes sense for a retail business (year-end buying, budget flush purchases from corporate clients, etc.) and is useful for forecasting/inventory planning.

**Revenue grew 31% from 2023 to 2024**, after being basically flat from 2022 to 2023. That's the strongest growth year in the data.

**Corporate customers are the most profitable segment** (17.03% margin) even though Consumer brings in slightly more total revenue. Worth noting for whoever's deciding where to focus account growth efforts.

## Skills this project demonstrates

SELECT, WHERE, JOIN (INNER), GROUP BY, HAVING, aggregate functions (SUM, AVG, COUNT), CASE WHEN logic, multi-table joins, date functions (YEAR, MONTH), schema design with primary/foreign keys, and writing SQL specifically to answer business/financial questions rather than just demonstrating syntax.

## What's next

I'm planning to go back and add CTEs and window functions to this same dataset (ranking products within category, running totals, year-over-year comparisons done properly instead of manually like I did above), those are concepts I'm still working through, and I'd rather build them into this project once I actually understand them than fake it now.

## Folder structure

```
SQL (OneShot)/
├── README.md
├── files/              (raw CSV data)
├── schema/
│   └── 01_schema.sql
└── queries/
    └── all_queries.sql
```
