USE ppub;
SELECT count(*) from titleauthor;

SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name 
FROM authors a
LEFT JOIN titleauthor
ON a.au_id = titleauthor.au_id
LEFT JOIN titles t
ON t.title_id = titleauthor.title_id
LEFT JOIN publishers p
ON p.pub_id = t.pub_id;

-- Challenge 1 - publisher & author & title
CREATE TABLE aut_pub 
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name 
FROM authors a
LEFT JOIN titleauthor
ON a.au_id = titleauthor.au_id
LEFT JOIN titles t
ON t.title_id = titleauthor.title_id
LEFT JOIN publishers p
ON p.pub_id = t.pub_id;

-- Challenge 2: count of title
SELECT pub_name, concat(au_lname, " ",au_fname) as name, count(title) as num_title
FROM aut_pub
GROUP BY name, pub_name
ORDER BY pub_name desc;

-- Challenge 3: best selling author
CREATE TABLE best_selling_aut
SELECT a.au_id, a.au_lname, a.au_fname, t.title, s.title_id, s.qty
FROM authors a
LEFT JOIN titleauthor
ON a.au_id = titleauthor.au_id
LEFT JOIN titles t
ON t.title_id = titleauthor.title_id
LEFT JOIN sales s
ON s.title_id = t.title_id
ORDER BY s.qty;

UPDATE best_selling_aut
SET  qty = 0
WHERE qty IS NULL;

SELECT concat(au_fname," ", au_lname) as name, count(title) as count_title FROM best_selling_aut
GROUP BY name
ORDER BY count_title DESC
LIMIT 3;

-- Challenge 4 - rank of all authors
SELECT concat(au_fname," ", au_lname) as name, sum(qty) as ttl_qty FROM best_selling_aut
GROUP BY name
ORDER BY ttl_qty DESC;








