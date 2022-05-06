--prime numbers
declare
x number:=50;
b number:=0;

begin 
for i in 1..x/2 loop

if mod(x,i)=0 then
b:=1;
exit;
end if;
end loop;

if b=1 then
dbms_output.put_line('it is not a prime number');
else
dbms_output.put_line('it is a prime number');
end if;
end;
/
set SERVEROUTPUT ON;
--top 10 customers using 

select * from customer_retail;
select * from sales_retail;

/
create or replace procedure sp_top10(p_year in varchar2)as
cursor c_top is select cust_name,sum_amount,rnk from(select cust_name,sum(amount) as sum_amount,
dense_rank() over(order by sum(amount) desc)rnk
from customer_retail a,sales_retail b
where a.cust_id=b.cust_id and to_char(sales_date,'yyyy')=p_year
group by cust_name)A
where A.rnk<=10;

begin 
for i in c_top loop
dbms_output.put_line(i.cust_name||','||i.sum_amount||','||i.rnk);
end loop;
end;
/
select * from sales_retail;

/
exec  sp_top10('2019');
/

/*--wap to display o/p as
--dname:HR
Arun
Ajay
dname:Accounts
Akshay
Adarsh
*/
select * from emp;
select * from dept;
create or replace procedure sp_dept_empname as
cursor c_dept is select deptno,dname from dept;
cursor c_emp(p_deptno int) is select ename 
                     from emp
                     where deptno=p_deptno;
begin
for i in c_dept loop
dbms_output.put_line('department:' || i.dname);
for j in c_emp(i.deptno)loop
dbms_output.put_line(j.ename);
end loop;
end loop;
end;
/

/*
waf by passing the age and bgender at runtime if age<18 return 0 otherwise return the no of employee
with that age and gender
*/

select * from emp;
/
exec sp_dept_empname;
/*
wap by passing the month and year and display the grade of the customer
if customer made more than 8 sales in a month -grade A
                           5 sales grade B
                           3 sales grade c
                           <3 sales grade d
                           <1 no sales- insert the customer in call table
*/
select * from dept;
create or replace procedure sp_customer_sale(mm_yy) 





















