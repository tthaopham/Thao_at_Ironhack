-- 1. From the `order_items` table, find the price of the highest priced order and lowest price order.
SELECT distinct(price) as price_list FROM olist.order_items
ORDER BY price_list ASC
LIMIT 1;

-- 2. From the `order_items` table, what is range of the shipping_limit_date of the orders?
SELECT distinct(shipping_limit_date) as ship_date FROm olist.order_items
ORDER BY ship_date ASC
LIMIT 1;

-- 3. From the `customers` table, find the states with the greatest number of customers.
USE olist;
SELECT customer_state, COUNT(DISTINCT(customer_id)) as cus_count from customers
GROUP BY customer_state
ORDER BY cus_count DESC
LIMIT 1;

-- 4. From the `customers` table, within the state with the greatest number of customers, 
-- find the cities with the greatest number of customers.
SELECT customer_state, customer_city, count(distinct(customer_id)) as cus_count_city FROM customers
WHERE customer_state = "SP"
GROUP BY customer_city
ORDER BY cus_count_city DESC;

-- 5. From the `closed_deals` table, how many distinct business segments are there (not including null)?
SELECT distinct(business_segment)  FROM closed_deals
WHERE business_segment != "NULL";

-- 6. From the `closed_deals` table, 
-- sum the declared_monthly_revenue for duplicate row values in business_segment 
-- and find the 3 business segments with the highest declared monthly revenue 
-- (of those that declared revenue).

SELECT business_segment, sum(declared_monthly_revenue) as rev FROM closed_deals
GROUP BY business_segment
ORDER BY rev DESC 
LIMIT 3;

-- 7. From the `order_reviews` table, find the total number of distinct review score values.
SELECT count(distinct(review_score)) FROM order_reviews;

-- 8. In the `order_reviews` table, 
-- create a new column with a description that corresponds to each number category for each review score from 1 - 5, 
-- then find the review score and category occurring most frequently in the table.

ALTER TABLE order_reviews
ADD review_category varchar(255);

-- SELECT review_score, review_category;
UPDATE order_reviews
SET review_category = CASE
    WHEN review_score = 1 THEN "Don't bother"
    WHEN review_score = 2 THEN "Not worth it"
    WHEN review_score = 3 THEN "Bof"
    WHEN review_score = 4 THEN "Good"
    WHEN review_score = 5 THEN "Excellent"
    ELSE "not rate"
	END;

-- ALTER TABLE order_reviews
-- DROP COLUMN review_category;
-- UPDATE order_reviews
-- SET review_category = "Don't bother"
-- WHERE review_score = 1;

SELECT review_category, count(review_score) as review_count FROM order_reviews
GROUP BY review_category
ORDER BY review_count;











