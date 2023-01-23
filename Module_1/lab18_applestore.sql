SELECT * from apple_sales.applestore;
-- Q1 types of genre
SELECT DISTINCT prime_genre from apple_sales.applestore;

-- Q2 rank rating count
SELECT prime_genre, sum(rating_count_tot) as sum FROM apple_sales.applestore
GROUP BY prime_genre
ORDER BY sum DESC;

-- Q3 and Q4 count top/ bottom apps
SELECT prime_genre, count(distinct track_name) as count FROM apple_sales.applestore
GROUP BY prime_genre
ORDER BY count ASC
LIMIT 1;

-- Q5 top 10 apps most rated
SELECT track_name, sum(rating_count_tot) as top_track FROM apple_sales.applestore
GROUP BY track_name
ORDER BY top_track DESC
LIMIT 10;

-- Q6 top apps rated by user
SELECT track_name, user_rating, price FROM apple_sales.applestore
ORDER BY user_rating DESC
LIMIT 10;

-- Q10, get top 3 apps
SELECT track_name, round((rating_count_tot * user_rating), 0) as total_rating, price FROM apple_sales.applestore
ORDER BY total_rating DESC
LIMIT 10;







