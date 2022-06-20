create table city_promotion (
city_id number(5) primary key,
city_name varchar2(30),
state_name varchar2(30));

insert into city_promotion values(10,'BLR','KA');
insert into city_promotion values(20,'CHN','TN');

create table promotion (
prom_id	number(5) primary key,
prom_name varchar2(20),
discount number(5));

insert into promotion values(10,'FirstBuy',10);
insert into promotion values(11,'TengthBuy',12);

create table store_promotion (
store_id number(5) primary key,
store_nm varchar2(20),
city_id	number(5) references city_promotion(city_id));

insert into store_promotion values(100,'JP Nagar Store',10);
insert into store_promotion values(101,'JayaNagar Store',10);	

create table customer_promotion (
cus_id number(5) primary key,
cus_name varchar2(30),
city_id	number(5) references city_promotion(city_id));

insert into customer_promotion values(1,'TIM',10);
insert into customer_promotion values(2,'BILL',10);	
insert into customer_promotion values(3,'UMA',20);

create table point_of_sale (
Sale_id	number(5) primary key,
Sale_date date,
store_id number(5) references store_promotion(store_id),
cus_id	number(5) references customer_promotion(cus_id),
promo_id number(5) references promotion(prom_id),
Sale_Amt number(10),
Discount number(10));

insert into point_of_sale values(1000,'08-Jun-21',100,2,10,3000,300);
insert into point_of_sale values(1001,'09-Jun-21',101,1,null,2500,null);
/

--Display the store name, customer name, store city_name for all the customers	
--who purchased from us in the current month
/
	select cus_name,store_nm,city_name
    from city_promotion a,store_promotion b,customer_promotion c,point_of_sale d
    where a.city_id=b.city_id and a.city_id=c.city_id and b.store_id=d.store_id and c.cus_id=d.cus_id
    and to_char(sale_date,'mm-yy')=to_char(trunc(sysdate,'mm-yy'),'mm');
    
--Create a view to know only the sales happened in the KA state	
--want to see store_name, cust_name, city_name, sales_amount
/
create view mahesh111 as(select cus_name,store_nm,city_name
    from city_promotion a,store_promotion b,customer_promotion c,point_of_sale d
    where a.city_id=b.city_id and a.city_id=c.city_id and b.store_id=d.store_id and c.cus_id=d.cus_id
    and state_name='KA');

select * from mahesh111;
--Find customers who are from bangalore who used a promotion	

	select cus_name
    from city_promotion a,store_promotion b,customer_promotion c,point_of_sale d,promotion e
    where a.city_id=b.city_id and b.store_id=d.store_id and c.cus_id=d.cus_id and e.prom_id=d.promo_id and city_name='BLR';
--Display the stores where cust TIM purchased in the last month	

    select store_nm
    from city_promotion a,store_promotion b,customer_promotion c,point_of_sale d,promotion e
    where a.city_id=b.city_id and b.store_id=d.store_id and c.cus_id=d.cus_id and e.prom_id=d.promo_id and cus_name='tim' and 
    to_char(sale_date,'mm-yy')=to_char(add_months(sydate -1,'mm-yy'));
	
--Find the common products which were bought by both TIM and BILL


	select product
    from city_promotion a,store_promotion b,customer_promotion c,point_of_sale d,promotion e
    where a.city_id=b.city_id and b.store_id=d.store_id and c.cus_id=d.cus_id and e.prom_id=d.promo_id and cust_name='tim'
    
    intersect
    
    select product
    from city_promotion a,store_promotion b,customer_promotion c,point_of_sale d,promotion e
    where a.city_id=b.city_id and b.store_id=d.store_id and c.cus_id=d.cus_id and e.prom_id=d.promo_id and cust_name='bill';
    
	
--Add two more promotional Records and visualize 2 POS records against that promotion	
	
--If we add employee table in this model what tables you will associate that employee table	
	
--Find the store where we had the most sales in the month of JAN-22	

    select a.store_nm
    from store_promotion a,point_of_sale b
    where a.store_id=b.store_id and to_char(sale_date,'mon-yy')='jun-21'
	group by a.store_nm
    having count(sale_id) in (select max(count(sale_id))
    from point_of_sale 
    where to_char(sale_date,'mon-yy')='jun-21'
	group by store_id);
--Display store_name, month_name, total sales amoung for each of the month in the current year	
	
select * from store_promotion;
select * from  city_promotion;
select * from  customer_promotion;
select * from  point_of_sale;
select * from  promotion;


    select a.store_nm,to_char(sale_date,'mm'),sum(sale_amt)
    from store_promotion a,point_of_sale b
    where a.store_id=b.store_id and to_char(sale_date,'yy')='21'
    group by a.store_nm,to_char(sale_date,'mm');

create table state(state_id number primary key ,state_name varchar(20));

select * from state;
cus_id	number(5) references customer_promotion(cus_id),
create table actor1(act_id number(3) primary key,actor_name varchar2(20),state_id number(3) references state(s_id));


select * from 
select * from actor;