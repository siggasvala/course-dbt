# WEEK 4

### PART 1

I created 'orders.sql' in snapshots. After running dbt snapshot, i could see that values updated and dbt_valid_to changed to NULL for the new information. The old rows are still visible but dbt_valid_to has now a date. 

SELECT 
  * 
FROM 
  dbt.snapshots.orders_snapshot
WHERE 
  order_id IN ('914b8929-e04a-40f8-86ee-357f2be3a2a2','05202733-0e17-4726-97c2-0520c024ab85')

### PART 2

I created a model in marts>product>product_funnel.sql. I look the percentage of sessions with page views (all page views have product_id), add to cart and checkout events. I make the table incremental so it collects data historically (if there were regular runs).

I can see that all sessions have page_views. 
 - 80.8 % of users that browse add products to cart 
  - 19.2 % dropoff w.r.t. page views
 - 62.5 % purchase
  - 27.5 % dropff w.r.t. to page views
  - 18.3 % dropoff w.r.t add to cart
The most important room is to get higher rate of purchases from those that actually add product to carts. So I would start there. Ideally 

### PART 3

**If your organization is thinking about using dbt, how would you pitch the value of dbt/analytics engineering to a decision maker at your organization?**

I work in a company where we use SQL, have set up a base, core and report layer. There are several things i love about dbt; 
 - **The community** I see that more and more companies are using it. There is a lot of content online, huge slack community and, more and more people out there that know how to use it. 
 - **Testing** It is so useful just to be able to do quick testing for uniqueness, not nulls and etc. But also more complicated tests out there in different packages, and ofc we can write our tests. 
 - **Documentation** The setup of dbt sort of forces you to document tables and it makes it also easy for reviewers of the code to look at the documentation. 
 - **Reusability** The functionality of Jinja and macros makes it use to write code that can be applicapabel in different SQL queries. 
 - **Flexibility** The Jinja code also provides a flexibility that is not in SQL, such as for loops and other things. 

If your organization is using dbt, what are 1-2 things you might do differently / recommend to your organization based on learning from this course?
We do not use dbt now, but I will for sure advocate for it. 

If you are thinking about moving to analytics engineering, what skills have you picked that give you the most confidence in pursuing this next step?
I think the most important one being more considerate of what functionality should be applied to each layer (base/staging/models). Also the importance of testing and documenting, especially when there are many people working on the code at the same time. 