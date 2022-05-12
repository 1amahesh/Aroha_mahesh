select * from customer_retail;
select * from sales_retail;


select * from product;
select * from sales;

create table customer5(c_id int primary key,c_nm varchar(20),c_pan varchar2(20),
crt_dt date,crt_by varchar2(20),last_txn_date date,total_sales number);
/
create trigger   trig_insert_customer
before insert  on customer5
for each row
begin
:new.crt_dt:=sysdate;
:new.crt_by:='user';
end;
/
insert into customer5 (c_id,c_nm,c_pan)values(1,'mahesh','A12345');

select * from customer5;
/
create table sales5(sale_id int primary key,sales_date date,qty number(5),
revenue number(20),crt_dt date,c_id number references customer5(c_id));
/
create trigger  trig_insert_updt_sales
before insert on sales5
for each row
begin
:new.crt_dt:=sysdate;
update customer5 set last_txn_date=sysdate ,
total_sales=nvl(total_sales,:new.revenue,total_sales+:new.revenue)
where c_id = :new.c_id;
end;
/
insert into sales5(sale_id,sales_date,qty,revenue,c_id)values(11,'10-oct-10',4,4000,1);
/
desc sales5;
/
drop trigger trig_insert_updt_sales3;