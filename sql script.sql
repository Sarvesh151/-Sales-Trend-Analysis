CREATE DATABASE company_3;
USE company_3;
SELECT * FROM cleaned_amazon_dataset;


ALTER TABLE cleaned_amazon_dataset
DROP COLUMN MyUnknownColumn;
SELECT * FROM cleaned_amazon_dataset;
SELECT
    YEAR(STR_TO_DATE(Order_date, '%d-%m-%Y')) AS order_year,
    MONTH(STR_TO_DATE(Order_date, '%d-%m-%Y')) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(Final_Price) AS total_revenue
FROM
    cleaned_amazon_dataset
WHERE
    Order_Status = 'Delivered'
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;
