# =========================================================
# CASE STUDIES (SESSION 8)
# =========================================================


# -------------------------
# READ TABLES
# -------------------------
select * from customer;
select * from orders;
select * from supplier;
select * from product;
select * from orderitem;


# -------------------------
# COUNTRY WISE CUSTOMERS
# -------------------------
select Country, count(Id) as customer_count
from customer
group by Country;


# -------------------------
# ACTIVE PRODUCTS
# -------------------------
select * from product where isDiscontinued = 0;


# -------------------------
# CUSTOMER FROM MEXICO
# -------------------------
select * from customer where Country = 'Mexico';


# -------------------------
# COSTLIEST ORDERED ITEM
# -------------------------
select c.Id, c.FirstName, p.ProductName, p.UnitPrice
from customer c
join orders o on c.Id = o.Id
join product p on o.Id = p.Id
order by p.UnitPrice desc
limit 1;


# -------------------------
# MONTH / YEAR ANALYSIS
# -------------------------
select month(OrderDate) as month, count(*) as order_count
from orders
group by month;

select year(OrderDate) as year, count(*) as order_count
from orders
group by year;


# -------------------------
# TOP SUPPLIER
# -------------------------
select Country, count(Id) as cnt
from supplier
group by Country
order by cnt desc
limit 1;


# -------------------------
# CUSTOMERS WITH NO ORDERS
# -------------------------
select * from customer
where Id not in (select CustomerId from orders);