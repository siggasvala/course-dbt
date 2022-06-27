WEEK 2 ____________________________

What is our user repeat rate?
    76 % 

What are good indicators of a user who will likely purchase again?
What about indicators of users who are likely NOT to purchase again? 
If you had more data, what features would you want to look into to answer this question?

I couldn't find anything, but I checked number of products purchased and money spent in first order
for those that ordered once versus again. I would probably look at demographic 
indicators, location, time of purchase and more. 

Explain the marts models you added. Why did you organize the models in the way you did?

I added as per suggestion from the Project Week 2 description. 

__core__
>> fact_orders contains all informatino 
about each order which i got from the orders table. I also added info such as 
totla number of products, total number of distinct products, and list of product ids in the order. 
>> dim_products is basically everything from the products table (i could not think) of
anything other to add for now. 
>> dim_users includes everythin from the user table but i also added the total 
number of orders and total order cost. 

What assumptions are you making about each model? (i.e. why are you adding each test?)
__product__
>> fact_pageviews includes all rows from the events table that have event_type page_views. 
I did not think of any useful information to add there for now. 

__marketing__
>> I did not add anything yet there. 

What assumptions are you making about each modgiel? 
__core__
>> fact_orders; order_id, user_id can't be null. order_id must be unique. 
>> dim_users; user_id can't be null and must be unique. 
>> dim_products; product_id can't be null and must be unique.

__product__
>> fact_pageviews.sql. event_id, page_url and user_id can't be null. event_id has to be unique.

