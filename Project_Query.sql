drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
Name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent Numeric(5,2),
availableQuantity Integer,
DiscountedSellingPrice Numeric (8,2),
weightInGms Integer,
OutofStock BOOLEAN,
quantity Integer
);
--  sample data view	
SELECT * FROM zepto

--count of rows
Select COUNT (*) from zepto

--null values 
select * from zepto
WHERE name is NULL
OR 
 Category is NULL
OR 
 discountPercent is NULL
OR
 mrp is NULL
OR 
 availableQuantity is NULL
OR 
 DiscountedSellingPrice is NULL
OR 
 weightInGms is NULL
OR
OutofStock is NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
Order BY category

--product in stock vs out of stock
SELECT OutofStock, count(sku_id)
From zepto
Group BY OutofStock;

--Product names present multiple times
Select name, Count(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) >1
ORDER BY count(sku_id) DESC;

--data cleaning
--product with price=0
SELECT * from zepto
where mrp = 0 OR DiscountedSellingPrice = 0;

DELETE FROM zepto
where mrp = 0;

--convert paise to rupees
Update zepto
SET mrp = mrp/100.0,
DiscountedSellingPrice = DiscountedSellingPrice/100.0;

SELECT mrp, DiscountedSellingPrice from zepto

-- Q1. Find the top 10 best-value products based on the discount percentage.

SELECT DISTINCT name, mrp, discountPercent 
From zepto
ORDER bY discountPercent DESC
LIMIT 10;

--Q2.What are the Products with High MRP but Out of Stock

SELECT DISTINCT name, mrp
FROM zepto
where OutofStock = TRUE and mrp > 250
ORDER BY mrp DESC;

--Q3.Calculate Estimated Revenue for each category

SELECT category,
SUM (DiscountedSellingPrice * availableQuantity ) AS total_revenue
FROM zepto
Group by category
ORDER by total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 and discountPercent  < 10
ORDER BY mrp DESC, discountPercent  DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.

SELECT category,
ROUND(AVG(discountPercent ),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.

SELECT DISTINCT name, weightInGms, DiscountedSellingPrice,
ROUND(DiscountedSellingPrice /weightInGms,2) AS price_per_grm
FROM zepto
WHERE weightInGms>+100
ORDER BY price_per_grm;

--Q7.Group the products into categories like Low, Medium, Bulk based on weights.

SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 Then 'Low'
WHEN weightInGms < 5000 Then 'Medium'
Else 'Bulk'
End as weight_category
From zepto;

--Q8.What is the Total Inventory Weight Per Category 

SELECT category,
SUM(weightInGms  * availableQuantity ) AS total_weight
from zepto
GROUP BY category
ORDER BY total_weight;
