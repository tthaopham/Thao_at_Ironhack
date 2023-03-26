USE ppub;

SELECT tr.au_id,
				(sum(tr.advance_per_title) + sum(tr.roy_per_title)) as profit
FROM
		(SELECT title_royalty.title_id,  -- starting point Q2
						au_id, 
                        sum(title_royalty.sales_royalty) as roy_per_title, 
						sum(title_royalty.advance) as advance_per_title

		FROM
			(SELECT t.title_id, au_id, -- starting point Q1
							(t.advance * ta.royaltyper / 100) as advance, 
							(t.price * s.qty * t.royalty / 100) as sales_royalty,
							s.qty
			FROM titles t
			LEFT JOIN titleauthor ta
			ON t.title_id = ta.title_id
			LEFT JOIN sales s
			ON s.title_id = t.title_id) as title_royalty -- end of Q1
            GROUP BY title_royalty.title_id, au_id) as tr -- end of Q2

GROUP BY au_id
ORDER BY profit DESC
LIMIT 3
;
            
-- USE ppub;
-- SELECT * FROM best_selling_aut
-- WHERE title_id = 'BU1032';

-- SELECT * FROM best_selling_aut
-- WHERE au_fname = "Anne" AND au_lname = "Ringer";




