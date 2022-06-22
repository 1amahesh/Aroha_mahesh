/
create or replace procedure sp_ref(p_str in varchar2)as
  v_ref sys_refcursor;
  v_rec emp%rowtype;
begin
   open v_ref for p_str;
loop
   fetch v_ref into v_rec;
exit when v_ref%notfound;
   dbms_output.put_line(v_rec.ename||','||v_rec.sal);
   end loop;
   close v_ref;
end;
/

exec sp_ref('select * from emp');
/

select * from state;
select * from actor;

select actor_name,dob
 from state a,actor b
where a.s_id=b.s_id
 and (dob,s_name) in (select min(dob),a.s_name
                      from state a,actor b
                     where a.s_id=b.s_id
                     group by a.s_name);
                     
-- 1. Display the count of ‘L’ in ‘Fintellix’ string.

select regexp_count('fintellix','f') from dual;


--2.Update the salary of employees
--If sal&gt;10000 then sal+1000
--Sal&gt;5000 then sal+500
--Else sal
--Using case.

select * from customer;

update emp set sal=case sal
            when sal>10000 then sal=sal+1000
            when sal>5000 then sal=sal+500
            else null
            end ;


/
update emp set sal=20000
where empno=7369;

delete 
from emp
where ename is null;
/
alter table emp disable all triggers;

select * from emp;

3.Display Dnames and no of employees in it.
ACCOUNTING RESEARCH SALES OPERATIONS
------------------- ------------ ---------- ----------
3 5 6 1

select dname,count(empno)
from dept a,emp b
where a.deptno=b.deptno
group by dname;
/
declare

cursor c_dept is select deptno,dname from dept;
cursor c_emp(p_deptno number) is select count(empno) as eno from emp where deptno=p_deptno;

begin
for i in c_dept loop
dbms_output.put_line('department name:'||i.dname);
for j in c_emp(i.deptno) loop
dbms_output.put_line(j.eno);
end loop;
end loop;
end;
/
set serveroutput on;
/

create or replace procedure sp_ref(p_str in varchar2)as
  v_ref sys_refcursor;
  v_rec emp%rowtype;
begin
   open v_ref for p_str;
loop
   fetch v_ref into v_rec;
exit when v_ref%notfound;
   dbms_output.put_line(v_rec.ename||','||v_rec.sal);
   end loop;
   close v_ref;
end;
/

exec sp_ref('select * from emp');
/





delete  emp where ename is null;
/
set serveroutput on;
/
create or replace procedure sp_ref_select(p_id in int,p_ref out sys_refcursor)as
begin
 if p_id=1 then
   open p_ref for select * from customer_retail;
 else
   open p_ref for select * from product_retail;
end if;
end;
/




delete  emp where ename is null;
/
set serveroutput on;
/
create or replace procedure sp_ref_select(p_id in int,p_ref out sys_refcursor)as
begin
 if p_id=1 then
   open p_ref for select * from customer_retail;
 else
   open p_ref for select * from product_retail;
end if;
end;
/
/
variable b_ref refcursor;
exec sp_ref_select(0,:b_ref);
print :b_ref;
/

create or replace function fn_get_sales ( v_Shop_id number, v_from_date date, v_to_date date,
                                             v_5_week_sales  OUT REFCURSOR) return number
        v_from_week number(2);
        v_from_year number(4);
        v_to_week number(2);
        v_to_year number(4);
    begin
        v_from_date := '15-AUG-18';
        v_to_date := '15-SEP-18';
        v_shop_id := 100;
        v_from_week := to_char(v_from_date,'ww');
        v_from_Year := to_Char(v_from_date,'YYYY');
        v_to_week := to_char(v_to_date,'ww');
        v_to_Year := to_Char(v_to_date,'YYYY');
        
        select 
            sum(AMOUNT_SOLD)
        from 
            shop_facts sf inner join shop_dimension sd on sf.shop_id = sd.shop_id
            inner join calender_dimension cd on sf.week_id = cd.week_id
        where
            sd.shop_id = v_shop_id
        and cd.week_id between v_from_week and v_to_week
        an cd.year between v_from_year and v_to_year;
        
        -- top5 weeks with in the duration
        Open top_5_week_sales FOR
        select week_in_year, Revenue, Ranking from 
        (select week_in_year, sum(amount_sold) Revenue, dense_rank() over ( order by sum(Amount_Sold) desc) Ranking
        from    shop_facts sf inner join shop_dimension sd on sf.shop_id = sd.shop_id
            inner join calender_dimension cd on sf.week_id = cd.week_id
        where
            sd.shop_id = v_shop_id
        and cd.week_id between v_from_week and v_to_week
        an cd.year between v_from_year and v_to_year
        group by week_in_year) week_sales
        where week_sales.ranking < 6;
        
  end;
  /
  select * from calender_dimension;
  select * from shop_facts;
  select * from shop_dimension;
  /
create or replace function fn_get_sales ( v_Shop_id number, v_from_date date, v_to_date date,
                                             v_5_week_sales in OUT REFCURSOR) return number
        v_from_week number(2);
        v_from_year number(4);
        v_to_week number(2);
        v_to_year number(4);
        v_tot_amt number(20);
    begin
        v_from_date := '15-AUG-18';
        v_to_date := '15-SEP-18';
        v_shop_id := 100;
        v_from_week := to_char(v_from_date,'ww');
        v_from_Year := to_Char(v_from_date,'YYYY');
        v_to_week := to_char(v_to_date,'ww');
        v_to_Year := to_Char(v_to_date,'YYYY');
        select sum(AMOUNT_SOLD) into v_tot_amt
        from shop_facts sf,shop_dimension sd,calender_dimension cd
          where sf.shop_id = sd.shop_id
          and sf.week_id = cd.week_id
          and sd.shop_id = v_shop_id
          and cd.week_in_year between v_from_week and v_to_week
          and cd.year between v_from_year and v_to_year;

           
        
        Open top_5_week_sales FOR
    select week_in_year, Revenue, Ranking 
    from (select week_in_year, sum(amount_sold) Revenue,dense_rank() over ( order by sum(amount_Sold) desc) Ranking
          from shop_facts sf,shop_dimension sd,calender_dimension cd
          where sf.shop_id = sd.shop_id
          and sf.week_id = cd.week_id
          and sd.shop_id = v_shop_id
          and cd.week_in_year between v_from_week and v_to_week
          and cd.year between v_from_year and v_to_year
          group by week_in_year) week_sales
    where week_sales.ranking < 6;     
  end;
        