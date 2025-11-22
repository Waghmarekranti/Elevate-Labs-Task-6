# Elevate-Labs-Task-6
Sales Trend Analysis Using Aggregations

✅ 1. Selecting the Database and Viewing the Table
use Elevate_Lab;
select * from ecommerce_sales;


You first selected the Elevate_Lab database to make sure all queries run on the correct dataset.
Then you displayed all the data from the ecommerce_sales table to understand the columns such as:

order_id

order_date

amount

This helped you confirm the structure of the data before performing analysis.

✅ 2. Extracting YEAR and MONTH from the Date Column
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month
FROM ecommerce_sales;

✔ What this does:

The order_date column is NOT a real date — it is stored as text like 15-08-2023.

To work with it, you converted it into a proper date using:
STR_TO_DATE(order_date, '%d-%m-%Y')

Then you extracted:

Year

Month

This prepares your data for grouping and monthly calculations.

✅ 3. Grouping by Year & Month and Calculating Revenue and Order Count
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales
GROUP BY 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY order_year, order_month;

✔ What this does:

Converts text date → real date

Extracts year and month

SUM(amount) → Calculates total monthly revenue

COUNT(DISTINCT order_id) → Counts unique orders per month

Groups the data by year/month

Sorts the results in order (January → December)

This is your main query for monthly performance analysis.

✅ 4. Using SUM() for Revenue Again
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales
GROUP BY 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY 
    order_year,
    order_month;


This repeats the same logic as above — confirming that:

SUM() is used for total revenue

COUNT(DISTINCT order_id) counts unique orders

Results are grouped by month

✅ 5. Calculating Monthly Order Volume Only
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    COUNT(DISTINCT order_id) AS order_volume
FROM ecommerce_sales
GROUP BY 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY 
    order_year,
    order_month;

✔ What this does:

Here you focused ONLY on order count, without revenue.
This shows how many orders happened per month.

Useful for:

Tracking customer activity

Identifying demand patterns

✅ 6. Sorting the Results Properly
ORDER BY 
    order_year ASC,
    order_month ASC;

✔ What this does:

Sorts the output by year → month in increasing order, making the results easier to read.

✅ 7. Filtering the Results to a Specific Year (2023)
SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM ecommerce_sales
WHERE YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) = 2023
GROUP BY 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY 
    order_month;

✔ What this does:

Filters data to only the year 2023

Calculates:

Monthly revenue

Monthly order count

Groups the results by month

Sorts months from January to December

This creates a year-specific monthly sales report.

🎯 FINAL SUMMARY — What You Achieved With All This Code

By writing all the above SQL, you successfully:

✔ Converted text dates to real date format
✔ Extracted year and month for time-based analysis
✔ Created monthly summaries of:

Revenue

Order volume

✔ Sorted results chronologically
✔ Filtered data for specific years (e.g., 2023)
✔ Built a complete month-by-month performance report
