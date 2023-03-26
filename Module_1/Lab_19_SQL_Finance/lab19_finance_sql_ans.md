![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)
# Lab | MySQL Select

## Introduction

 In this lab, we will practice selecting and projecting data. You can finish all questions with only these clauses:
- `SELECT`
- `SELECT DISTINCT`
- `COUNT`
- `FROM`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `SUM`
- `LIMIT`

The Sql script is here: https://drive.google.com/file/d/1tT1OTdIgkI5tkeeXIsnZwMC5SxI1FE9m/view
Please submit your solutions in a text file `solutions.sql`.

#### 1. From the `order_items` table, find the price of the highest priced order and lowest price order.

max = 6735
min = 0.85

#### 2. From the `order_items` table, what is range of the shipping_limit_date of the orders?

max = 2020 04 10
min = 2016 09 19

#### 3. From the `customers` table, find the states with the greatest number of customers.
SP = 41746


#### 4. From the `customers` table, within the state with the greatest number of customers, find the cities with the greatest number of customers.

SP sao paulo 15540


#### 5. From the `closed_deals` table, how many distinct business segments are there (not including null)?

business_segment
pet
car_accessories
home_appliances
food_drink
health_beauty
computers
household_utilities
construction_tools_house_garden
toys
sports_leisure
stationery
food_supplement
home_decor
bed_bath_table
watches
fashion_accessories
jewerly
party
small_appliances
audio_video_electronics
other
bags_backpacks
home_office_furniture
music_instruments
books
baby
air_conditioning
phone_mobile


#### 6. From the `closed_deals` table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).

construction_tools_house_garden 50695006
phone_mobile 8000000
home_decor 710000


#### 7. From the `order_reviews` table, find the total number of distinct review score values.

5 counts (rating 1, 2, 3, 4, 5)

#### 8. In the `order_reviews` table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.

'Not worth it','3235'
'Bof','8287'
'Don\'t bother','11858'
'Good','19200'
'Excellent','57420'


#### 9. From the `order_reviews` table, find the review value occurring most frequently and how many times it occurs.

Same as 7 & 8

