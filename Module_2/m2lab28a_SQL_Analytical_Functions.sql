USE sakila;
-- 1. find the running total of rental payments for each customer in the payment table, ordered by payment date. 

SELECT customer_id, payment_date, amount,
				SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) 
FROM payment;

-- 2. find the rank and dense rank of each payment amount within each payment date

SELECT DATE(payment_date), amount,
				RANK() OVER(PARTITION BY DATE(payment_date) ORDER BY amount DESC) AS rank_amount,
                DENSE_RANK() OVER(PARTITION BY DATE(payment_date) ORDER BY amount DESC) AS dense_rank_amount
FROM payment;

-- 3. find the ranking of each film based on its rental rate, within its respective category. 
SELECT * 
FROM
	(SELECT sub_tab.category, sub_tab.rental_rate, sub_tab.title, 
					RANK() OVER(PARTITION BY sub_tab.category ORDER BY sub_tab.rental_rate DESC, sub_tab.title ASC) as rank_film,
					ROW_NUMBER() OVER(PARTITION BY sub_tab.category ORDER BY sub_tab.rental_rate DESC, sub_tab.title ASC) as row_num_film
	
    FROM
			(SELECT f.film_id, f. title, rental_rate, fc.category_id, cat.name as category
			FROM film f
			LEFT JOIN film_category fc
			ON f.film_id = fc.film_id
			LEFT JOIN category cat
			ON fc.category_id = cat.category_id) 
            as sub_tab) 
            
		as sub_q
        
WHERE sub_q.row_num_film <=6;

-- 5. find the difference between the current and previous payment amount 
-- and the difference between the current and next payment amount, for each customer in the payment table

SELECT payment_id, customer_id, amount, payment_date,
				(amount - LAG(amount) OVER(PARTITION BY customer_id ORDER BY payment_date ASC)) as cpd,
                LEAD(amount) OVER(PARTITION BY customer_id ORDER BY payment_date ASC) as cnd
FROM payment;
				
-- 3. Retry:
SELECT
		name as "Category",
        f.title as film_title,
        f.rental_rate,
        RANK() OVER (PARTITION BY "Category" ORDER BY f.rental_rate DESC ) AS rnk,
		DENSE_RANK() OVER (PARTITION BY "Category" ORDER BY f.rental_rate DESC ) AS dense_rnk
FROM film f
LEFT JOIN film_category fc
ON f.film_id=fc.film_id
LEFT JOIN category c
ON fc.category_id=c.category_id
order by rental_rate DESC, name,film_title;




