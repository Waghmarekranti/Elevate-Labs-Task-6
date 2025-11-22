use Elevate_Lab;
select * from ecommerce_sales;

# Use EXTRACT(MONTH FROM order_date) for month.

SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month
FROM ecommerce_sales;

#GROUP BY year/month.
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

#Use SUM() for revenue.
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

#COUNT(DISTINCT order_id) for volume.
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
    
#Use ORDER BY for sorting.

SELECT 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_month,
    COUNT(DISTINCT order_id) AS order_volume
FROM ecommerce_sales
GROUP BY 
    YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY 
    order_year ASC,
    order_month ASC;  
    
#Limit results for specific time periods.
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

