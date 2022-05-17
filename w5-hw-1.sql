--1. List all customers who live in Texas (use JOINs)
select  concat(c.first_name, ' ', c.last_name) as name  from customer c 
join address a on c.address_id = a.address_id 
where a.district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full Name
select concat(c.first_name,' ',c.last_name) as name from payment p 
join customer c on c.customer_id = p.customer_id 
where amount > 6.99

--3. Show all customers names who have made payments over $175(use subqueries)
select concat(c.first_name, ' ', c.last_name) as name
from customer c 
where c.customer_id in (
	select p.customer_id from payment p 
	where p.amount > 175
)

--4. List all customers that live in Nepal (use the city table)
select concat(c1.first_name, ' ', c1.last_name) as name from customer c1
join address a on c1.address_id  = a.address_id 
join city c2 on c2.city_id  = a.city_id 
join country c3 on c3.country_id = c2.city_id 
where c3.country = 'Nepal'

--5. Which staff member had the most transactions?
select concat(s.first_name, ' ', s.last_name) as name  from rental r 
join staff s on s.staff_id = r.staff_id 
group by name
order by count(rental_id) desc 
limit 1


--6. How many movies of each rating are there?
select rating, count(film_id) from film f 
group by rating 

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select concat(c.first_name, ' ',last_name) as name from customer c 
where c.customer_id in (
	select customer_id from payment p 
	where amount > 6.99
	group by customer_id 
	having count(amount) = 1)

--8. How many free rentals did our stores give away?
	select count(payment_id) from payment p 
	where amount = 0  --23
	
