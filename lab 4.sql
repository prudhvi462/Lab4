--LAB 4
--Name: Prudhvi Krishna Narra,CWID- 200 54 101
--Date:2/13/2014



--1.Get the cities of agents booking an order for customer "Basics".

select city
from agents
where aid in (select aid 
	      from orders
	      where cid = (select cid 
	                   from customers
			   where name = 'Basics'))


--2.Get the pids of products ordered through any agent who makes at least one order for a customer in Kyoto. 
--(This is not the same as asking for pids of products ordered by a customer in Kyoto.)

select distinct pid 
from orders 
where aid in (select aid
              from orders
              where cid in (select cid 
                            from customers
                            where city = 'Kyoto')) order by pid asc

--3.Find the cids and names of customers who never placed an order through agent a03.
select cid,name 
from customers 
where cid not in (select distinct cid 
                  from orders 
                  where aid = 'a03')

--4.Get the cids and names of customers who ordered both product p01 and p07.

select cid, name 
from customers
where cid in (select cid 
              from orders 
              where pid in ('p01','p07')) order by cid asc

--5.Get the pids of products ordered by any customers who ever placed an order through agent a03.

select distinct pid 
from orders 
where cid in(select cid 
             from orders 
             where aid = 'a03') order by pid asc

--6.Get the names and discounts of all customers who place orders through agents in Dallas or Duluth.

select name,discount 
from customers 
where cid in(select cid 
             from orders
             where aid in(select aid 
                          from agents 
                          where city in ('Dallas','Duluth')))


--7.Find all customers who have the same discount as that of any customers in Dallas or Kyoto.

select * from customers 
where discount in (select discount 
                   from customers  
                   where city in('Dallas','Kyoto')) 
 and discount in (select discount
                   from customers  
                   where city not in('Dallas','Kyoto')) 
and city not in('Dallas','Kyoto')