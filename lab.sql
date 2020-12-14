-- *************************part 1
-- select * from invoice i
-- inner join invoice_line il
-- on i.invoice_id=il.invoice_id
-- where unit_price>.99;

-- select i.invoice_date,c.first_name,c.last_name,i.total
-- from invoice i
-- inner join customer c
-- on i.customer_id=c.customer_id;

-- select c.first_name,c.last_name,e.first_name,e.last_name
-- from customer c
-- inner join employee e
-- on c.support_rep_id=e.employee_id;

-- select al.title,ar.name
-- from album al
-- inner join artist ar
-- on al.artist_id=ar.artist_id;

-- select pt.track_id
-- from playlist_track pt
-- inner join playlist p
-- on pt.playlist_id=p.playlist_id
-- where p.name='Music';

-- select t.name from track t
-- join playlist_track pt
-- on t.track_id=pt.track_id
-- where pt.playlist_id=5;

-- select t.name,p.name from track t
-- join playlist_track pt
-- on t.track_id=pt.track_id
-- join playlist p
-- on pt.playlist_id=p.playlist_id;

-- select t.name,a.title from track t
-- join album a
-- on t.album_id=a.album_id
-- join genre g
-- on t.genre_id=g.genre_id
-- where g.name='Alternative & Punk'

-- select t.name trackname,g.name genre,al.title album,ar.name artist from track t
-- join album al
-- on t.album_id=al.album_id
-- join genre g
-- on t.genre_id=g.genre_id
-- join artist ar
-- on al.artist_id=ar.artist_id
-- join playlist_track pt
-- on t.track_id=pt.track_id
-- join playlist p
-- on pt.playlist_id=p.playlist_id
-- where p.name='Music';

-- *************************part 2

-- select * from invoice
-- where invoice_id in (
--   select invoice_id from invoice_line
--   where unit_price>.99);

-- select * from playlist_track pt
-- where playlist_id in (
--   select playlist_id from playlist
--   where name='Music');

-- select name from track
-- where track_id in(
--   select track_id from playlist_track
--   where playlist_id=5);

-- select * from track
-- where genre_id in (
--   select genre_id from genre
--   where genre.name='Comedy');

-- select * from track
-- where album_id in (
--   select album_id from album
--   where title='Fireball');

-- select * from track
-- where album_id in (
--   select album_id from album
--   where artist_id in (
--     select artist_id from artist
--     where artist.name='Queen'));

-- *************************part 3

-- update customer
-- set fax=null where fax is not null;

-- update customer
-- set company='Self' where company is null;

-- update customer
-- set last_name = 'Thompson'
-- where first_name='Julia' and last_name='Barnett';

-- update customer
-- set support_rep_id=4
-- where email='luisrojas@yahoo.cl';

-- update track
-- set composer='The darkness around us'
-- where composer is null and genre_id in(
-- 	select genre_id from genre where name='Metal');
 
--  *************************part 4

-- select count(*),g.name from track t
-- join genre g
-- on t.genre_id=g.genre_id
-- group by g.name
-- order by count

-- select count(*),g.name from track t
-- join genre g
-- on t.genre_id=g.genre_id
-- where g.name='Pop' or g.name='Rock'
-- group by g.name

-- select ar.name,count(*) from artist ar
-- join album al
-- on ar.artist_id=al.artist_id
-- group by ar.name
-- order by count desc

--  *************************part 5


-- select distinct composer from track

-- select distinct billing_postal_code from invoice

-- select distinct company from customer

--  *************************part 6

--  select * from practice_delete where type='bronze';
-- delete from practice_delete where type='bronze';

-- delete from practice_delete where type='silver';

-- select * from practice_delete where value=150;
-- delete from practice_delete where value=150;

--  *************************part 7

create table users
(id serial primary key,name varchar(100),email varchar(100))

insert into users
(name,email)
values
('bob','bob@gmail.com'),('ken','ken@gmail.com'),('gigi','gigi@gmail.com');

create table products
(id serial primary key,name varchar(100),price int);

insert into products
(name,price)
values
('stuff',10),('things',15),('knick-knacks',1);

create table orders(id serial primary key,product_id int  references products(id) )

insert into orders
(product_id)
values
(2),(3),(2);

select name,orders.id from products
join orders
on products.id=orders.product_id
where orders.id=1;

select * from orders;

select sum(price) from products
join orders
on products.id=orders.product_id
where orders.id=1;

alter table orders
add column user_id int references users(id);

update orders
set user_id=1 where id=3;
update orders
set user_id=2 where id=2;
update orders
set user_id=3 where id=1;