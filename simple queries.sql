select * from orders;
select * from products;
select * from customers;

-- 20 Subqueries

-- 1) Find all customers who placed orders above 5000.
select C.customer_name,C.city,O.amount from customers as C
INNER JOIN orders as O
ON C.customer_id=O.customer_id
WHERE O.amount > 5000;

-- 2) Find all products priced above the average price.
select P.product_name,
P.price from products as P
WHERE P.price > (select AVG(price) as Average from Products);

-- 3) Find the cheapest product purchased.
select product_name,price from products
ORDER BY price ASC
LIMIT 1;

-- 4) Find the costliest product purchased.
select product_name,price from products
ORDER BY price DESC
LIMIT 1;

-- 5) Get the names of customers who ordered Electronics items.
select DISTINCT C.customer_name,C.city,category from customers as C
INNER JOIN orders as O
ON C.customer_id=O.customer_id
INNER JOIN products as P
ON P.product_id=O.product_id
WHERE category='Electronics';

-- 6) Find all orders placed after the average order date (use subquery with MAX).
select O.order_id,
O.order_date from orders as O
WHERE (select MAX(order_date) as Max_Order_date from orders);

-- 7) Get customers who placed at least one order.
select C.customer_name,C.city,COUNT(O.order_id) as Total_order from customers as C
INNER JOIN orders as O
ON C.customer_id=O.customer_id
GROUP BY C.customer_name,C.city
HAVING Total_order >= 1;

-- 8) Find products ordered by customer “Rahul”.
select P.product_name,P.price,O.order_date from Products as P
INNER JOIN orders as O
ON P.product_id=O.product_id
INNER JOIN customers as C
ON C.customer_id=O.customer_id
WHERE customer_name='Rahul';

-- 9) Find the city of the customer who bought a Laptop.
select C.customer_name,C.city,P.product_name from customers as C
INNER JOIN Orders as O
ON C.customer_id=O.customer_id
INNER JOIN Products as P
ON P.product_id=O.product_id
WHERE product_name='Laptop';

-- 10) Find all orders above the minimum order amount.
select O.order_date,O.order_id,amount from Orders as O
WHERE amount > (select MIN(amount) from Orders);

-- 11) Find orders equal to the average order amount.
select O.order_date,O.order_id,amount from Orders as O
WHERE O.amount = ROUND((select AVG(amount) from Orders),0);

-- 12) Find customers who bought more than 1 product.
select C.customer_name,C.city,COUNT(product_name) as Total_Count_of_Products from customers as C
INNER JOIN orders as O
ON C.customer_id=O.customer_id
INNER  JOIN products as P
ON P.product_id=O.product_id
GROUP BY C.customer_name,C.city
HAVING Total_Count_of_Products > 1;

-- 13) Get all products which were never ordered.
select P.product_name,P.category from products as P
LEFT JOIN orders as O
ON P.product_id=O.product_id
WHERE O.product_id IS NULL;

-- 14) Find orders placed by customers from Mumbai.
select O.order_date,O.order_id,city from orders as O
INNER JOIN customers as C
ON O.customer_id=C.customer_id
WHERE C.customer_id IN(select customer_id from customers where city='Mumbai');

-- 15) Find customers who placed orders less than 1000.
select C.customer_name,O.amount from customers as C
INNER JOIN Orders as O
ON C.customer_id=O.customer_id
WHERE O.amount < 1000;

 -- 16) Get customer name who placed order id 1003.
select C.customer_name,C.city from customers as C
INNER JOIN Orders as O
ON C.customer_id=O.customer_id
WHERE order_id=1003;

-- 17) Find the join date of customers who placed orders above 10000.
select C.join_date,C.customer_name from Customers as C
WHERE C.customer_id IN(select O.customer_id from Orders as O WHERE amount > 10000);

-- 18) Find the second highest order amount.
select O.amount from orders as O
ORDER BY amount DESC
LIMIT 1 OFFSET 1;

--          OR

select MAX(amount) from Orders
WHERE amount < (select MAX(amount) from Orders);

-- 19) Find customers who spent more than average spending.
select C.customer_name,C.city,O.amount from Customers as C
INNER JOIN orders as O
ON C.customer_id=O.customer_id
WHERE O.amount > (select AVG(amount) from orders);

-- 20) Find customers who ordered at least 2 different categories.
select C.customer_name from customers as C
INNER JOIN orders as O
ON C.customer_id=O.customer_id
INNER JOIN products as P
ON P.product_id=O.product_id
GROUP BY C.customer_name
HAVING COUNT(DISTINCT P.category) >= 2;





