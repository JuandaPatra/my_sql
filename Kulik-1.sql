create schema kantor_ketiga;

select * from products group by productLine;

select * from customers group by country;

-- AGGREGATE FUNCTION
select avg(creditLimit)as Average from customers;

-- count (ditotal jumlah datanya)
select count(*) from products;

-- sum (ditotal(ditambah) value nya)
select sum(quantityInStock) as totalQuantity from products;


-- min & max
select min(amount) as minimumPayment from payments;

select max(amount) from payments;

select customerNumber, paymentDate , min(amount) from payments;

select t1.productName, t1.productCode, t1.productLine, t2.textDescription
from products t1
inner join productlines t2
on t1.productLine = t2.productLine ;

select productLine, avg(buyPrice) as average from products group by productLine;

select * from products where productScale like '%1:10%' ;
select productCode, productName,productScale from products;

select * from products where productLine='classic Cars' limit 5,10;
select * from products limit 5,19;

-- case 1
select customerName,city,state,country from customers where country='USA' or country='France' order by customerName limit 3,5;

-- case 2
select * from customers where salesRepEmployeeNumber is not null and country='germany' and contactFirstName like '%n%' order by contactFirstName;

-- case 3
select * from customers where salesRepEmployeeNumber is not null and creditLimit>60000 order by creditLimit limit 10,4;

-- case 4
select country, count(*), creditLimit, avg(creditLimit) as Average_Credit_Limit from customers group by country having Average_Credit_Limit order by count(*) desc ;

select* from customers ;

select productLine, avg(buyPrice) as Average from products group by productLine order by Average;

select * from customers where customerNumber < 200 ;
 
select * from customers where addressLine2 is not null  order by city ;

select city, count(*) as Employee_per_city from customers group by city order by Employee_per_city desc;

select * from desc_kerja;
insert into desc_kerja (section, id_karyawan , desc_pekerjaan) values('office', 1, 'Deal Project') ,('warehouse', 2, 'Quality Control'), ('warehouse', 3, 'Quality Control'), ('Office', 4, 'Supervisor Quality Control'),('warehouse', 5, 'Quality Control'),('warehouse', 7, 'Quality Control') ;

-- inner join (karyawan dan desc kerja)
select k1.idkaryawan, k1.nama, k1.posisi, d1.section, d1.desc_pekerjaan
from karyawan k1
inner join desc_kerja d1
	on k1.idkaryawan = d1.idkaryawan;

-- left join 
select *
from customers c
left join  orders o 
on o.customerNumber=c.customerNumber ;

CREATE TABLE category (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  parent_id int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (parent_id) REFERENCES category (id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO category(title,parent_id) 
VALUES('Electronics',NULL);

INSERT INTO category(title,parent_id) 
VALUES('Laptops & PC',1);

INSERT INTO category(title,parent_id) 
VALUES('Laptops',2);
INSERT INTO category(title,parent_id) 
VALUES('PC',2);

INSERT INTO category(title,parent_id) 
VALUES('Cameras & photo',1);
INSERT INTO category(title,parent_id) 
VALUES('Camera',5);

INSERT INTO category(title,parent_id) 
VALUES('Phones & Accessories',1);
INSERT INTO category(title,parent_id) 
VALUES('Smartphones',7);

INSERT INTO category(title,parent_id) 
VALUES('Android',8);
INSERT INTO category(title,parent_id) 
VALUES('iOS',8);
INSERT INTO category(title,parent_id) 
VALUES('Other Smartphones',8);

INSERT INTO category(title,parent_id) 
VALUES('Batteries',7);
INSERT INTO category(title,parent_id) 
VALUES('Headsets',7);
INSERT INTO category(title,parent_id) 
VALUES('Screen Protectors',7);


