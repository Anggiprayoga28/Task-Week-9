create table promos (
	id serial primary key,
	name varchar(100) not null,
	discount int not null
);

create table products (
	id serial primary key,
	name varchar(100) not null,
	promo_id int,
	price int not null,
	FOREIGN KEY (promo_id) REFERENCES promos (id)
);

insert into promos (name, discount) values 
('Soft Opening', 10000),
('Gajian', 5000),
('Lebaran Haji', 15000);

insert into products (name, promo_id, price) values
('Tea', null ,10000),
('Coffee', 1, 12000),
('Cake', 1, 22000),
('Fried Chicken', 2, 15000);

select * from promos;
select * from products;

SELECT 
  d.id, 
  d.name as "product_name", 
  m.name as "promo_name", 
  d.price, 
  m.discount
FROM
  products d
JOIN
  promos m
ON 
  d.promo_id = m.id;

SELECT 
  d.id, 
  d.name as "product_name", 
  m.name as "promo_name", 
  d.price, 
  m.discount
FROM
  products d
RIGHT JOIN
  promos m
ON 
  d.promo_id = m.id;

SELECT 
  d.id, 
  d.name as "product_name", 
  m.name as "promo_name", 
  d.price, 
  m.discount
FROM
  products d
FULL JOIN
  promos m
ON 
  d.promo_id = m.id;

SELECT 
  d.id, 
  d.name as "product_name", 
  m.name as "promo_name", 
  d.price, 
  m.discount
FROM
  products d
LEFT JOIN
  promos m
ON 
  d.promo_id = m.id;

select promo_id, sum(price) as "total_harga"
from products group by promo_id;

select promo_id, avg(price) as "rerata_harga"
from products group by promo_id having avg(price) < 15000;

select promo_id, avg(price) as "rerata_harga"
from products where promo_id is not null
group by promo_id 
having avg(price) < 16000;

select promo_id, min(price) as "min_harga"
from products where promo_id is not null
group by promo_id;

select pro.name as "promo_code", min(prd.price) as "lowest_price"
from products prd
join promos pro
on prd.promo_id = pro.id
group by pro.name;