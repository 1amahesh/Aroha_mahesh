SQL Questions:

--Write a query to display all the customer names who do not have a phone
select cust_name
from customer11
where phone is null;

--Write a query to display all the customers and the number of accounts they hold
select cust_name,count(a_no)
from customer11 a,accounts11 b
where a.cust_bkey=b.cust_bkey
group by cust_name;


--Display the customer who have the highest balance across all account types
select cust_name
from customer11 a,accounts11 b
where a.cust_bkey=b.cust_bkey
and balance=(select max(balance)
from accounts11);

--Display the customer name who have the highest balance in individual account types
select * from customer11;
select * from accounts11;
select * from transaction11;
/
select cust_name,act_type,balance
from customer11 a,accounts11 b
where  a.cust_bkey=b.cust_bkey and (balance,act_type) in (select max(balance),act_type
from accounts11
group by act_type);

/
select cust_name ,max(balance)
from customer11 a,accounts11 b
where a.cust_bkey=b.cust_bkey
group by ;
/
from customer11 a,accounts11 b
where a.cust_bkey=b.cust_bkey



--Display the State wise no of accounts opened in the previous year
select * from customer11;
select * from accounts11;
select * from transaction11;

select count(a_no),state
from customer11 a,accounts11 b
where a.cust_bkey=b.cust_bkey and to_char(act_open_date,'yyyy')=to_char(sysdate,'yyyy')-1
group by state;
--Display the customers who hold more than 2 accounts of the same type

select cust_name
from customer11 a,accounts11 b
where a.cust_bkey=b.cust_bkey 
group by cust_name
having count(a_no)>2;

--Display customer name and transaction type wise transaction amounts. (Consider two types of transactions which are Debit and Credit)


select * from customer11;
select * from accounts11;
select * from transaction11;
/
select cust_name,txn_type,fcy_amt,lcy_amt
from customer11 a,accounts11 b,transaction11 c
where a.cust_bkey=b.cust_bkey and b.a_no=c.a_no and txn_type='withdra'
union
select cust_name,txn_type,fcy_amt,lcy_amt
from customer11 a,accounts11 b,transaction11 c
where a.cust_bkey=b.cust_bkey and b.a_no=c.a_no and txn_type='deposit';
/
/
select cust_name,txn_type,sum(fcy_amt),sum(lcy_amt)
from customer11 a,accounts11 b,transaction11 c
where a.cust_bkey=b.cust_bkey and b.a_no=c.a_no 
group by txn_type,cust_name;

/

--Display city wise no of male and female customers
select cust_name,gender
from customer11 
group by city;

--Display the customers who has only savings accout.

Create table customer11
(cust_bkey number(5) primary key,
Cust_name varchar2(20),
Addr varchar2(20),
Gender char(1),
Email varchar2(20),
Phone number(10),
City varchar2(20),
State varchar2(20),
Country varchar2(20)
);

Create table accounts11
(a_no number(5) primary key,
Cust_bkey number(5) references customer11(cust_bkey),
Act_type varchar2(20),
Balance number(6),
Act_open_date date,
Act_status varchar2(20)
);

Create table transaction11
(txn_id number(5),
a_no number(5) references accounts11(a_no),
txn_type varchar2(20),
fcy_amt number(5),
lcy_amt number(5),
txn_date date
);

insert all
/
insert into customer11 values(1000,'MIKI','7thcrossMall','M','d@gmail.com',87887481,'BANGALORE','KARNATAKA','INDIA');
insert into customer11 values(1001,'NIKI','5thblockJayana','M','c@gmail.com',98888787,'BANGALORE','KARNATAKA','INDIA');
insert  into customer11 values(1002,'PONKI','4thblockRajgar','F','g@gmail.com',98897643,'MYSORE','KARNATAKA','INDIA');
insert  into customer11 values(1003,'PINKI','1ststagepeenya','F','f@gmail.com',89787643,'MANGALORE','KARNATAKA','INDIA');
insert  into customer11 values(1004,'SAER','8thcrosskondi','M','b@gmail.com',987458676,'GULBARGA','KARNATAKA','INDIA');
insert  into customer11 values(1005,'MANU','3rdstagelalcong','T','t@yahoo.com',99895889,'MANGALORE','KARNATAKA','INDIA');
select * from dual;

insert all
into accounts11 values(20000,1000,'current',98000.00,'04-07-2007','active')
into accounts11 values(20002,1001,'Savings',98.50,'10-02-2000','active')
into accounts11 values(30003,1002,'current',91000.60,'09-08-2017','active')
into accounts11 values(20003,1003,'S Join',9800.30,'24-03-2007','active')
into accounts11 values(20004,1003,'Savings',6000.00,'04-07-2006','inactive')
into accounts11 values(20055,1000,'Savings',900.00,'14-08-2005','active')
into accounts11 values(20006,1001,'current',98.00,'04-07-2010','active')
into accounts11 values(20007,1002,'current',10.70,'23-07-2018','active')
into accounts11 values(30008,1005,'Savings',760.50,'19-07-2020','active')
into accounts11 values(20009,1004,'Savings',00.23,'14-12-2021','inactive')
into accounts11 values(31000,1004,'current',300.55,'29-07-2012','active')
into accounts11 values(28000,1005,'current',2300.40,'04-06-2009','active')
into accounts11 values(20600,1003,'Current',94002.40,'04-11-2008','inactive')
select * from dual;
commit;

insert all/
/
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(12311,20000,'deposit',20000,73547,'12-09-2007');
/
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(4344,20000,'withdra',200,79877,'12-10-2007');
/
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(5456,20003,'deposit',60000,80760,'10-07-2007');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(4543,20002,'withdra',8000,30050,'12-07-2003');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(6542,20006,'deposit',4000,9000,'01-01-2011');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(5473,20004,'withdrawal',6878,9867,'12-07-2006');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(1243,30008,'withdrawal',28700,6543,'21-07-2020');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(7644,20007,'deposit',10060,34212,'24-10-2018');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(098,20055,'deposit',96764,7,'12-09-2005');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(6464,20009,'withdrawal',87898,5434,'14-12-2021');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(68443,31000,'withdrawal',45634,9867,'30-07-2012');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(7856,20600,'deposit',432,7665,'04-11-2008');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(986,28000,'deposit',26700,73756,'12-07-2009');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(9878,20009,'withdrawal',900,700,'16-12-2021');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(9807,30008,'deposit',19870,6787,'19-07-2020');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(90887,20004,'deposit',98700,79989,'12-07-2006');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(6465,30008,'withdrawal',78680,88765,'21-12-2020');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(9878,20007,'withdrawal',98700,8787,'27-09-2018');
insert into transaction11(txn_id,a_no,txn_type,fcy_amt,lcy_amt,txn_date)values(8977,20000,'deposit',28700,7878,'20-09-2012');
select*from dual;
commit;
