select dname, listagg(ename,',')within group(order by dname)
from dept,emp
where dept.deptno=emp.deptno
group by dname;

select * from emp;


select dname,listagg(sal,',') within group (order by sal)
from dept,emp
where dept.deptno=emp.deptno
group by dname;


/
create or replace function fun_factorial return number as

  x number:=5;
begin
  for i in 1..x-1 loop
  x:=x*i;
  end loop;
  return x;
  end;
  /
 select fun_factorial from dual;
 
 select a query to display cust0001...1000
 /
 
 select 'cust000'|| a from
 (select level+01-1 as a
 from dual
 connect by level<=1000)A;
 /
 
 
  
 select substr('mahthmagandhi',instr('mahthmagandhi','g',1,2),2) from dual;
 
 explain plan for select * from emp;
 
 select * from table(dbms_xplan.display());
 