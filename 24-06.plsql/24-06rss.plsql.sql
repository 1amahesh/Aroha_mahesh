--20. Display the monthwise no. of employees and the order of
--month should be jan, feb,mar,apr…

select * from emp;
/


select * from ( select to_char(hiredate,'month') as mp,count(empno)
from emp
group by to_char(hiredate,'month') ) order by mp;

order by case when mp='january'  then  1
              when mp='february' then  2
              when mp='march'    then  3
              when mp='april'    then  4
              when mp='may'      then  5
              when mp='june'     then  6
              when mp='july'      then 7
              when mp='august'    then 8
              when mp='september' then 9
              when mp='october'   then 10
              when mp='november'  then  11
              when mp= 'december'  then 12
              else 8
              end ;







select * from (select rownum as arn, to_char ( add_months(trunc(sysdate,'yy'),level-1 ),'month') from dual connect by level<=12)a;

select to_char(hiredate,'mm'),to_char(hiredate,'month'),count(empno)
from emp
group by to_char(hiredate,'mm'),to_char(hiredate,'month') 
order by to_char(hiredate,'mm');







/
select to_char(trunc(sysdate,'yy'),'month')+level
from dual
connect by level<=12;

/
select level from dual
connect by level<=0;
/

select level+level
from dual
connect by level<=20;
/
select substr('aroha',1,1)
from dual;
/

select substr('aroha',level,1)
from dual
connect by  level <=length('aroha'); 

/


select substr('aroha',1,level)
from dual
connect by  level <=length('aroha'); 

/*
4.Display positive and negative nos using case.
I/p O/p
No pos neg
1 1 -1
-1 2 -2
2 3
-2
3*/
select * from mahes;
insert into mahes values(1);
insert into mahes values(-1);
insert into mahes values(2);
insert into mahes values(-2);
insert into mahes values(3);
/
select pos,neg from (
select  rownum as arn , case when mah_id >0 then abs(mah_id) 
             else  abs(mah_id)
             end as pos  from  mahes  )A,
             
( select rownum as brn,neg from ( select case when mah_id <0 then mah_id 
             end as neg  from  mahes) where neg is not null ) B
             where A.arn=b.brn(+);
            
             /
from mahes;
/
select mah_id>0 as pos from mahe

union
select mah_id as neg from mahes
where mah_id<0;


--to display monday-sunday
select to_char(sysdate +level+2,'day')
from dual
connect by level<=7;

--to display january-december

select to_char(add_months(sysdate,6+level),'month')
from dual
connect by level<=12;


--1.find which emp worked more than 30 hours in last seven days

select * from emp;
select *  
from emp
where  to_char(hiredate,'hh')>30;

select * from employee;

select emp_name
from emp
where max(emp_d





2.find the emp details of today


--






