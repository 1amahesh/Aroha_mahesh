

--1. Write a procedure to add columns to the existing customer table by passing column name and datatype.

/
create or replace procedure sp_add_column(p_column varchar2,p_datatype varchar2) as

v_str varchar2(200);
v_ext varchar2(20);
begin
     
     v_str:='alter table city add '||p_column||' '||p_datatype;
     
  --   dbms_output.put_line(v_str);
     execute immediate v_str;

end;
   /  
   exec sp_add_column('zip1' , 'varchar2(20)');
   
   
   set serveroutput on;
     
     select * from city;
     
     alter table city add zip varchar2(20);
     
--3.Write a procedure by passing the location at run time and create ‘office_&lt;location&gt;’ table
--With the columns office_&lt;location&gt;_id,office_&lt;location&gt;_name,office_city.




create table aroha_jayanagar(aroha_id number,office_location varchar2(20));
,location_name varchar2(20),office_city varchar2(20));
drop table aroha_jayanagar;
/
create or replace procedure sp_create_table(p_office varchar2,p_location varchar2) as

v_str varchar2(200);

begin
     
     v_str:='create table '||p_office||'_'||p_location||'('||p_office||'_id number ,'||p_office||'_'||p_location||' varchar2(20))';
     
   --dbms_output.put_line(v_str);
    execute immediate v_str;
end;
/
exec sp_create_table('aroha' ,'jayanagar');


set serveroutput on;


desc aroha_jayanagar;



select *
from emp
where rowid in (select max(rowid)
from emp);

--4. Write a procedure by passing the table name and check the table exists or not, if exists
--display all the column names in that table otherwise handle the exception.
  /
  
create or replace procedure sp_column_namne(p_table varchar) as

v_cnt number;
v_str varchar2(300);
type t_col is table of  varchar2(20);

v_col t_col;
begin

    select count(*) into v_cnt
    from all_tables
    where table_name= upper(p_table);
    
    if v_cnt=1 then
    
      v_str:='select column_name from user_tab_columns where table_name='||''''||upper(p_table)||'''';
    execute immediate v_str bulk collect into v_col;
    
    for i in 1..v_col.last  loop
    
    dbms_output.put_line(v_col(i));
    end loop;
    end if;
    end;
    
/
exec sp_column_namne('emp');
set SERVEROUTPUT ON;




--using merge command
/
select * from city;
create table city_copy as select * from city;
select * from city_copy;

/

merge into city_copy  tagt using  city src
on (src.city_id=tagt.city_id)
when matched then
update set tagt.city_pop=src.city_pop
where src.city_id=tagt.city_id

when not matched then
insert (city_id,city_name,city_pop)values(src.city_id,src.city_name,src.city_pop);


/
select * from city_copy;

insert into city values(40,'kolkatta',723647,1,1,1);
update city set city_pop=2000
where city_id=10;


    select count(column_name )
    from user_tab_columns
    where table_name='EMP';


--5. Write a procedure by passing the select statement as input parameter and print the result
--set using execute immediate and also using loop.
/
create or replace procedure sp_result(p_string varchar)as
v_str varchar2(200);
type list is table of varchar2(20);
v_list list;
begin
v_str:=p_string;

--dbms_output.put_line(v_str);
execute immediate v_str bulk collect into v_list;
for i in 1..v_list.last loop
dbms_output.put_line(v_list(i));
end loop;

end;
/
exec sp_result('select job from emp');
/
select * from emp;

--creating synonym 

create synonym mounav for city;

select * from mounav;




--6. Pass the month and year and display the total sales of current month and previous month
--sales.
/

create or replace procedure sp_total_sales(p_mm_yy varchar2)as

v_cnt_current number;
v_cnt_previous number;

begin
/

select count(sales_id) into v_cnt_current
from sales_retail
where to_char(sales_date,p_mm_yy)=p_mm_yy;

end;
/
exec sp_total_sales('6-22');

union all
/
select count(sales_id)
from sales_retail
where to_char(sales_date,'mm-yy')=to_char(add_months(sysdate ,-1),'mm-yy');

/

select * from sales_retail;
update sales_retail set sales_date= '29-06-22'
where sales_id =1;
/

7. Pass the month and year and create the transaction table as txn_month_year with the
columns txnid, cid, pid, sales_dt, qty and amt.
8.Pass the table_name in a procedure and display the no. of records and no. of columns in that
table using dynamic sql.
9.Pass the table_name , if the table passed is parent display the child table names of that table
and if the table passed is child display the parent table names and handle the exception if there
no child or parent.    