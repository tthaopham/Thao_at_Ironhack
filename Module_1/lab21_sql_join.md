![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)
# Lab | MySQL Select

## Introduction

In this lab you will practice how to use the MySQL `SELECT` statement which will be extremely useful in your future work as a data analyst/scientist/engineer. **You will use the `publications` database**. You can find it in Ironhack's database. Use your database management application to query `publications`. 

You will create a `solutions.sql` file in the `your-code` directory to record your solutions to all challenges.

## Challenge 1 - Who Have Published What At Where?

In this challenge you will write a MySQL `SELECT` query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

* `AUTHOR ID` - the ID of the author
* `LAST NAME` - author last name
* `FIRST NAME` - author first name
* `TITLE` - name of the published title
* `PUBLISHER` - name of the publisher where the title was published


If your query is correct, the total rows in your output should be the same as the total number of records in Table `titleauthor`.

'172-32-1176','White','Johnson','Prolonged Data Deprivation: Four Case Studies','New Moon Books'
'213-46-8915','Green','Marjorie','The Busy Executive\'s Database Guide','Algodata Infosystems'
'213-46-8915','Green','Marjorie','You Can Combat Computer Stress!','New Moon Books'
'238-95-7766','Carson','Cheryl','But Is It User Friendly?','Algodata Infosystems'
'267-41-2394','O\'Leary','Michael','Cooking with Computers: Surreptitious Balance Sheets','Algodata Infosystems'
'267-41-2394','O\'Leary','Michael','Sushi, Anyone?','Binnet & Hardley'
'274-80-9391','Straight','Dean','Straight Talk About Computers','Algodata Infosystems'
'341-22-1782','Smith','Meander',NULL,NULL
'409-56-7008','Bennet','Abraham','The Busy Executive\'s Database Guide','Algodata Infosystems'
'427-17-2319','Dull','Ann','Secrets of Silicon Valley','Algodata Infosystems'
'472-27-2349','Gringlesby','Burt','Sushi, Anyone?','Binnet & Hardley'
'486-29-1786','Locksley','Charlene','Net Etiquette','Algodata Infosystems'
'486-29-1786','Locksley','Charlene','Emotional Security: A New Algorithm','New Moon Books'
'527-72-3246','Greene','Morningstar',NULL,NULL
'648-92-1872','Blotchet-Halls','Reginald','Fifty Years in Buckingham Palace Kitchens','Binnet & Hardley'
'672-71-3249','Yokomoto','Akiko','Sushi, Anyone?','Binnet & Hardley'
'712-45-1867','del Castillo','Innes','Silicon Valley Gastronomic Treats','Binnet & Hardley'
'722-51-5454','DeFrance','Michel','The Gourmet Microwave','Binnet & Hardley'
'724-08-9931','Stringer','Dirk',NULL,NULL
'724-80-9391','MacFeather','Stearns','Cooking with Computers: Surreptitious Balance Sheets','Algodata Infosystems'
'724-80-9391','MacFeather','Stearns','Computer Phobic AND Non-Phobic Individuals: Behavior Variations','Binnet & Hardley'
'756-30-7391','Karsen','Livia','Computer Phobic AND Non-Phobic Individuals: Behavior Variations','Binnet & Hardley'
'807-91-6654','Panteley','Sylvia','Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean','Binnet & Hardley'
'846-92-7186','Hunter','Sheryl','Secrets of Silicon Valley','Algodata Infosystems'
'893-72-1158','McBadden','Heather',NULL,NULL
'899-46-2035','Ringer','Anne','The Gourmet Microwave','Binnet & Hardley'
'899-46-2035','Ringer','Anne','Is Anger the Enemy?','New Moon Books'
'998-72-3567','Ringer','Albert','Is Anger the Enemy?','New Moon Books'
'998-72-3567','Ringer','Albert','Life Without Fear','New Moon Books'

## Challenge 2 - Who Have Published How Many At Where?

Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 


To check if your output is correct, sum up the `TITLE COUNT` column. The sum number should be the same as the total number of records in Table `titleauthor`.

*Hint: In order to count the number of titles published by an author, you need to use [MySQL COUNT](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html). Also check out [MySQL Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html) because you will count the rows of different groups of data. Refer to the references and learn by yourself. These features will be formally discussed in the Temp Tables and Subqueries lesson.*

## Challenge 3 - Best Selling Authors

Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

* Your output should have the following columns:
	* `AUTHOR ID` - the ID of the author
	* `LAST NAME` - author last name
	* `FIRST NAME` - author first name
	* `TOTAL` - total number of titles sold from this author
* Your output should be ordered based on `TOTAL` from high to low.
* Only output the top 3 best selling authors.

'Anne Ringer','6'
'Albert Ringer','5'
'Marjorie Green','3'


'Anne Ringer','148'
'Albert Ringer','133'
'Marjorie Green','50'


## Challenge 4 - Best Selling Authors Ranking

Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display `0` instead of `NULL` as the `TOTAL`). Also order your results based on `TOTAL` from high to low.

'Anne Ringer','148'
'Albert Ringer','133'
'Marjorie Green','50'
'Sheryl Hunter','50'
'Ann Dull','50'
'Michael O\'Leary','45'
'Stearns MacFeather','45'
'Michel DeFrance','40'
'Sylvia Panteley','40'
'Cheryl Carson','30'
'Charlene Locksley','25'
'Burt Gringlesby','20'
'Reginald Blotchet-Halls','20'
'Akiko Yokomoto','20'
'Livia Karsen','20'
'Abraham Bennet','15'
'Johnson White','15'
'Dean Straight','15'
'Innes del Castillo','10'
'Meander Smith','0'
'Morningstar Greene','0'
'Dirk Stringer','0'
'Heather McBadden','0'

## Deliverables

* `solution.sql` that contains all your MySQL queries.

## Submission

* Add `solutions.sql` to git.
* Commit your code.
* Push to your fork.
* Create a pull request to the class repo.

## References

[MySQL Reference: Counting Rows](https://dev.mysql.com/doc/refman/8.0/en/counting-rows.html)

[MySQL Reference: Group By](https://dev.mysql.com/doc/refman/8.0/en/group-by-modifiers.html)

[MySQL Reference: SUM Function](https://dev.mysql.com/doc/refman/8.0/en/group-by-functions.html#function_sum)
