CUST_ID,CUST_NAME,CUST_PHONE,CUST_CITY


create table cust_load(CUST_ID number,CUST_NAME varchar2(20),CUST_PHONE number(20),CUST_CITY varchar2(20));

select * from cust_load;

drop table cust_load;

truncate table cust_load;

desc cust_load;

--
/
declare
   x varchar2(20):=&x;
  start_dt date;
  end_dt date;
  no_of_days number(10);

begin
  start_dt:=trunc(to_date(x,'yy'),'yy');
  end_dt:=last_day(start_dt);
  no_of_days:=end_dt-start_dt;
   
   for i in 1..no_of_days loop
   if to_char(start_dt,'dy')in ('sun','sat') then
   dbms_output.put_line(start_dt);
      end if;
      start_dt:=start_dt+1;
   end loop;
   end;
   /
  set serveroutput on;
--Display the customer_name who doesnt done any transaction from last 6months.
select * from customer;
select * from transactions;
select * from accounts1;


select * from emp;

select trunc(sysdate,'yy')+level-1
from dual
connect by level<=31;




select trunc(sysdate,'yy') from dual;

select * from sales_retail;



insert into sales_retail values(104,'27-06-22',1102,100,2000);

select cust_id
from sales_retail
where sales_date between trunc(sysdate,'yy') and sysdate;

/

(CUST_ID,CUST_NM,CUST_PH,CUST_CT)
/
create table dep_tab(cust_id number,cust_nm varchar2(20),cust_ph number,cust_ct varchar2(20));


select * from emp;
/
create  
v_empno number:=&v_empno;
v_ename varchar2(20);

begin
   select ename into v_ename
   from emp
   where empno=v_empno;
   
   dbms_output.put_line(v_ename);
exception
when no_data_found then
dbms_output.put_line('no data'||v_empno);

end;
/