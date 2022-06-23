create or replace function fun_total_amount return number as 
        v_from_date date;
        v_to_date date;
        v_from_week number(2);
        v_from_year number(4);
        v_to_week number(2);
        v_to_year number(4);
        v_tot_amt number(20);
        v_shop_id number(5);
    begin
        v_from_date := '10-JAN-18';
        v_to_date := '10-DEC-19';
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
            and week_in_year between v_from_week and v_to_week
            and yr between v_from_year and v_to_year;
            return v_tot_amt;
    end;
    /
    select fun_total_amount from dual;
    /
    
    --1. Display the count of ‘L’ in ‘Fintellix’ string.

select regexp_count('fintellix','l') from dual;

--2.Update the salary of employees
--If sal&gt;10000 then sal+1000
--Sal&gt;5000 then sal+500
--Else sal
--Using case.

update emp set sal=case
                  when sal>10000 then sal+1000
                  when sal>5000 then sal+500
                  else null end;
rollback;
/
select * from emp;

update emp set sal=sal+111
where empno=7349;

3.Display Dnames and no of employees in it.
ACCOUNTING RESEARCH SALES OPERATIONS
------------------- ------------ ---------- ----------


/*
9. We have a sequence for id column with increment 1.
Input: 
1000
1001
1002
1004
1005
1006
1009
1010
I want to select the missing numbers in the sequence.
Output should be
1003
1007
1008
*/

select level+999
from dual
connect by level<=11

minus

select * from mahes
/
desc mahes;
truncate table mahes;
insert into mahes values(1000);
insert into mahes values(1001);
insert into mahes values(1002);
insert into mahes values(1004);
insert into mahes values(1005);
insert into mahes values(1006);
insert into mahes values(1009);
insert into mahes values(10010);
insert into mahes values(1011);



/
select * from user_views;

select * from all_sequences;
/
--5. Waq to display the date and time of sysdate in 24hr format.-mm-dd-yy for 24hr format

select to_char(sysdate,'HH:mm:ss') from dual;

--6. Waq to display alternate records.

select * from mahes;

select empno
from emp
where mod(empno,2)=1;


--23. What is count(*),count(null), count(empno), count(1).

select count(*) from mahes;

--1. Select table names created by SCOTT.
 select table_name 
 from user_tables
 where tablespace_name='USERS';


select user from dual;
--2. Select view names created by SCOTT.
select  * from user_views ; 
--3. Display the Constraint name, constraint type of all the constraints in EMP table.

select constraint_name,constraint_type
from user_constraints
where table_name='EMP';


--4. Display all indexes on DEPT table.


select * from all_indexes
where table_name='DEPT';
--5. Display all the user names from oracle database.
select * from all_users;