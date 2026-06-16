select * from amazon_sales limit 10;

select orderstatus from amazon_sales
group by orderstatus;
-->1. The Revenue Concentration 
-->Business Value: Find your highest-value customers. In e-commerce, the top 10% of customers often generate 50%+ of the revenue. This helps marketing target VIP loyalty campaigns.

select customerid,customername,
count(orderid) as total_orders,
sum(quantity) as total_items_bought,
round(sum(totalamount)::numeric,2) as total_spent
from amazon_sales 
group by customerid, customername
order by total_spent desc
limit 10;

--2. The Operational Bottleneck Question
--Business Value: Pinpoints failure points in your supply chain. High volumes of "Cancelled" or "Returned" orders in specific states or cities signal delivery carrier issues or regional inventory stockouts.

select state, orderstatus,
count(orderid) as orders_count,
round(sum(totalamount)::numeric,2) as affected_revenue
from amazon_sales
where orderstatus in ('Returned','Cancelled') 
group by state, orderstatus
order by orders_count desc
limit 20;

--> 2. Sales by country

select country,
round(sum(totalamount)::numeric,2) as total_sales
from amazon_sales
group by country
order by total_sales desc
limit 10;

--> 3.find top 5 selling products

select productid,productname,
sum(quantity) as total_sold,
round(sum(totalamount)::numeric,2) as total_sales
from amazon_sales 
group by productid,productname 
order by total_sales desc
limit 10;

-->4. The Leakage & Margin Question (Discounts vs. Shipping)
-->Business Value: Identifies if heavy discounting or high shipping costs are eating into your profit margins. If a product category has high discounts and high shipping costs, it might be losing money.

select category,
round(sum(totalamount)::numeric,2) as total_revenue,
sum(discount) as total_discounts,
round((sum(discount)/sum(totalamount)*100)::numeric,2) as discount_percentage,
sum(shippingcost) as total_shippingcost
from amazon_sales 
group by category
order by total_revenue desc
limit 10;

--4. The Product Velocity Question
--Business Value: Identifies your true "hero products" versus dead stock. This tells inventory managers exactly what to reorder immediately from suppliers.

select 
	productid,
	productname,
	category,
sum(quantity) as total_units_sold,
count(distinct customerid) as unique_buyers,
round(sum(totalamount)::numeric,2)as total_sales
from amazon_sales
group by productid,productname,category
order by total_units_sold desc
limit 10;

--5. The Payment Friction Question
--Business Value: Reveals consumer purchasing habits. If a high-value category preferred by customers has a high order failure rate under a specific payment method, it indicates an integration bug in the checkout flow.

select paymentmethod,
count(orderid) as total_transactions,
round(avg(totalamount)::numeric,2) as average_order_value,
round(sum(totalamount)::numeric,2) as total_revenue
from amazon_sales
group by paymentmethod
order by total_revenue desc;
