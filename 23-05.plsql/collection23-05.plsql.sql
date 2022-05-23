select * from emp;

select B.ename,B.sal,B.deptno from(select avg(sal) avg_sal,deptno
              from emp
              group by deptno)A,emp B
        where B.sal>A.avg_sal and A.deptno=B.deptno;
        
        /
        select ename,avg_sal,deptno from(select ename,deptno,avg(sal)as avg_sal,dense_rank() over(partition by deptno order by avg(sal)desc)rnk
                                          from emp
                                          group by ename,deptno)A
                                          where A.rnk=1;
                                          /
/collections
/
create or replace procedure sp_collection as

type list is table of emp%rowtype;
emp_list list;
begin
select * bulk collect into emp_list
from emp;
for i in 1..emp_list.last loop
dbms_output.put_line(emp_list(i).ename);
end loop;
end;
/
exec sp_collection;
/
select * from emp;
/
select * from emp;
select * from customer_retail;
/
set serveroutput on;
/
create or replace procedure sp_collection_update as

type list is table of emp.empno%type;
empnos_list list :=list(7369,7499,7521,7566,7654);
begin
forall i in 1..empnos_list.last
update emp
set sal=sal+10000
where empno = empnos_list(i);
--dbms_output.put_line(empnos_list(i))

end;
/
select * from emp;


exec sp_collection_update;