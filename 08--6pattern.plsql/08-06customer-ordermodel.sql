create table product_day5
(prod_bkey varchar2(5),
prod_name varchar2(20),
price number(10),
family varchar2(20)
);

insert all
into product_day5 values('p1','laptop',30000,'electronics')
into product_day5 values('p2','headphone',3000,'electronics')
into product_day5 values('p3','earphone',100,'electronics')
into product_day5 values('p4','chocolates',100,'food')
into product_day5 values('p5','biscuits',50,'food')
into product_day5 values('p6','chips',80,'food')
select * from dual;
/

/
create table customer_day5
(cust_bkey varchar2(5),
cust_name varchar2(20),
dob date,
phone number(10),
address varchar2(20),
city varchar2(20),
zip number(10),
state varchar2(20)
);


insert all
into customer_day5 values(11,'ram','12-aug-1996',8907879778,'vijayanagar','bangalore',56086,'ka')
into customer_day5 values(12,'sham','15-jun-1986',9007879778,'jayanagar','bangalore',56087,'ka')
into customer_day5 values(13,'krisna','10-may-1993',8907879334,'vidyanagr','darwad',58080,'ka')
into customer_day5 values(14,'adbul','06-jan-1994',7907879778,'shantinagar','rameshwar',56089,'tn')
into customer_day5 values(15,'john','23-nov-1987',8904879778,'rajnagar','hydrabad',56082,'ap')
into customer_day5 values(16,'abhi','14-sep-1996',8907879778,'laxmianagar','vijayapur',56096,'ka')
into customer_day5 values(17,'vinod','28-feb-1996',8934879778,'gandianagar','bangalore',56046,'ka')
select * from dual;



create table sales_day5
(sales_id varchar2(5),
cust_bkey varchar2(5),
prod_bkey varchar2(5),
store_bkey varchar2(5),
qty number(10),
sales_amount number(10),
sales_date date
);

insert all
into sales_day5 values(1001,12,'p1',101,10,10000,'10-jul-2021')
into sales_day5 values(1002,11,'p2',102,12,20000,'03-jan-2022')
into sales_day5 values(1003,13,'p3',103,14,50000,'19-mar-2019')
into sales_day5 values(1004,14,'p4',104,13,5000,'02-jun-2020')
into sales_day5 values(1005,15,'p1',105,10,8000,'20-sep-2021')
into sales_day5 values(1006,16,'p5',106,16,4000,'30-dec-2018')
into sales_day5 values(1007,12,'p6',101,16,60000,'10-feb-2021')
into sales_day5 values(1008,17,'p2',108,13,9000,'23-nov-2020')
select * from dual;
/



create table stores_day5
(store_bkey varchar2(5),
store_name varchar2(20),
address varchar2(20),
phone number(10),
city varchar2(20),
zip number(10),
state varchar2(20)
);

insert all
into stores_day5 values(101,'abc','jayanagar',9898987779,'bangalore',57484,'ka')
into stores_day5 values(102,'xyz','vijaynagar',9898987788,'hubli',57483,'ka')
into stores_day5 values(103,'pqr','vidyanagar',9898987708,'mangalore',57482,'ka')
into stores_day5 values(104,'lmn','rajajinagar',9898987878,'bangalore',57482,'ka')
into stores_day5 values(107,'jkl','gandinagar',9898987798,'chennai',57481,'tn')
into stores_day5 values(108,'iso','indiranagar',9898987578,'hydrabad',57480,'ap')
into stores_day5 values(109,'klm','jp nagar',9898987728,'gadag',57489,'ka')
into stores_day5 values(110,'kfc','shanti nagar',9898687778,'rameshwar',57485,'ka')
into stores_day5 values(111,'who','om nagar',9898987438,'mysore',57481,'ka')
select * from dual;

/
update sales_day5 set sales_date='07-06-2022'
where sales_id=1003;
/
--1.Get the customer names who made sales on or before 3rd jan 2022.
select cust_name
from  customer_day5 a,sales_day5 b
where a.cust_bkey=b.cust_bkey and to_char(sales_date,'dd-mon-yyyy')='03-jan-2022';

--2 Get the customer names who made sales yesterday and today.
select cust_name
from  customer_day5 a,sales_day5 b
where a.cust_bkey=b.cust_bkey and to_char(sales_date,'dd-mon-yyyy')=to_char(sysdate -1,'dd-mon-yyyy')
union
from  customer_day5 a,sales_day5 b
where a.cust_bkey=b.cust_bkey and to_char(sales_date,'dd-mon-yyyy')=to_char(sysdate ,'dd-mon-yyyy');


--3.Get the customer names who made max total sale (qty*price) on 03-jan-2022

/

select cust_name
from  customer_day5 a,sales_day5 b
where a.cust_bkey=b.cust_bkey and to_char(sales_date,'dd-mon-yyyy')='08-jun-2022'
group by cust_name
having count(sales_id)in(select count(sales_id)
                       from sales_day5
                       where to_char(sales_date,'dd-mon-yyyy')='08-jun-2022'
                       group by cust_bkey);
/
--4.Get the customer name who bought ‘abc’ manufacturers.
select * from stores_day5;
select * from sales_day5;
select * from customer_day5;
select * from product_day5;
/
select cust_name
from  customer_day5 a,stores_day5 b,sales_day5 c
where a.cust_bkey=c.cust_bkey and b.store_bkey=c.store_bkey and store_name='abc';


--5 Get the number of customers who bought ‘ABC’ manufacturers till today.
select cust_name
from  customer_day5 a,stores_day5 b,sales_day5 c
where a.cust_bkey=c.cust_bkey and b.store_bkey=c.store_bkey and store_name='abc'and sales_date <=sysdate;

