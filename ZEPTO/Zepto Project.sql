SELECT * FROM zepto_sql_project.zepto;

SELECT count(*) FROM zepto_sql_project.zepto;

-- sample data
select * from zepto
limit 10;

-- checking null values
SELECT *
FROM zepto
WHERE ï»¿Category IS NULL
   OR name IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR availableQuantity IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;
   
-- DIFFERENT PRODUCT CATEGORIES 
select distinct ï»¿Category from zepto
order by ï»¿Category;

-- PRODUCTS IN STOCK VS OUT OF STOCK
select outOfStock , count(sku_id)
from zepto 
group by outOfStock;

-- SELECT PRODUCT NAME PRESENT MUTLIPLE TIME
select name , count(sku_id) 
from zepto
group by name
having count(sku_id)>1 
order by count(sku_id) ASC;

-- DATA CLEANING 
-- products with price 0
select * from zepto
where mrp = 0 or discountedSellingPrice = 0;         # which is not possible a product cannot be of price 0 , so we need to delete this

delete from zepto 
where mrp = 0 and sku_id= 3603;

SET SQL_SAFE_UPDATES = 0;

-- converting paise to rupees
UPDATE zepto
SET mrp = mrp/100 ,
discountedSellingPrice = discountedSellingPrice/100 ;

-- 	DATA ANALYSIS

-- Q1. Find the top 10 best-value products based on the discount percentage. OR . which products have the highest discount percentages
select name , mrp , discountPercent
from zepto
order by discountPercent DESC
limit 10;

-- Q2.What are the Products with High MRP but Out of Stock
SELECT DISTINCT name, mrp, outOfStock
FROM zepto
WHERE outOfstock = 'TRUE'
ORDER BY mrp DESC;

-- Q3.Calculate Estimated Revenue for each category
SELECT ï»¿Category, SUM(discountedSellingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY ï»¿Category
ORDER BY total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp > 500 AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightInGms,2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

-- Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
