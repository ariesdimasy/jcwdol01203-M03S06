use sakila;
use jcwdol011db;

select count(first_name), last_name from actor; -- 208
select count(actor_id) from film_actor; -- 5440

select count(first_name) , title 
from actor join film_actor
on actor.actor_id = film_actor.actor_id
join film 
on film.film_id = film_actor.film_id
group by title;

select * from students;
select * from tasks;

select students.student_id , name, id_task, task_name 
from 
students cross join tasks 
on 
students.student_id  = tasks.student_id ;

select cu.first_name, cu.last_name from customer cu;
select ad.* from address ad;

select c.first_name, c.last_name, a.address 
from 
customer c join address a 
on 
c.address_id = a.address_id; 

select count(c.first_name) , s.store_id
from 
customer c join store s
on
c.store_id  = s.store_id
group by store_id;

select * from film_actor where film_id = 3
-- film --> actor

select sum(amount) from payment p where p.customer_id = 1;
select count(amount) from payment p where customer_id = 1;
select avg(amount) from payment p where customer_id = 1;
select min(amount) from payment p where customer_id = 1;
select max(amount) from payment p where customer_id = 1;

select sum(amount), c.customer_id from payment p group by customer_id;
select c.first_name, c.last_name, sum(amount) as total_transaction, c.customer_id 
from payment p join customer c 
on c.customer_id = p.customer_id
group by customer_id 
having total_transaction < 60;

select city_id, city from city where city_id = 300;
select * from address where city_id in (300, 440, 567);
select * from address where city_id in ( select city_id from city where city_id = 300);

select film_id, title, rental_duration from film where rental_duration > (
	select avg(rental_duration) from film 
) order by rental_duration desc;

-- select ( select nama_kolom where nama_table2 where ) as whatever from nama_table
start transaction;
insert into students  ( name, marks, gender ) values 
("arifah",90,"female");
delete from students where student_id = 1; 
commit;
rollback;

select * from students s ;


