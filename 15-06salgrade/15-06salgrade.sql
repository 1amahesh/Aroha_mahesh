

CREATE TABLE EMP ( EMPNO INT , ENAME VARCHAR(10), JOB VARCHAR(9),
MGR INT, HIREDATE DATETIME, SAL INT, COMM INT, DEPTNO INT );


INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,'2018-12-17',800, NULL, 20)
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,'2019-02-20',1600,300,30)
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,'2019-02-22',1250,500,30)
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,'2017-04-02',2975,NULL,20)
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,'2017-09-28',1250,1400,30)
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,'2019-05-01',2850,NULL,30)
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,'2016-06-09',2450,NULL,10)
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,'2018-12-09',3000,NULL,20)
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,'2019-11-17',5000,NULL,10)
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,'2017-09-08',1500,0,30)
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,'2016-01-12',1100, NULL,20)
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,'2016-12-03',950,NULL,30)
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,'2018-12-03',3000,NULL,20)
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,'2018-01-23',1300,NULL,10)



CREATE TABLE DEPT ( DEPTNO INT, DNAME VARCHAR(14), LOC VARCHAR(13) )

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');


CREATE TABLE SALGRADE ( GRADE INT, LOSAL INT, HISAL INT )

insert all
INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);
select * from dual;

--1.Display the employees who joined the company in the last
--year.

select ename
from emp
where to_char(hiredate,'yyyy')=to_char(sysdate,'yyyy')-2;

--2.Display the employees whose age &gt;30.Assume there is a DOB
--column in employee table.
select emp_name
from employee
where months_between(sysdate,emp_dob)/12 >30;
/
--to find age of an employee
select emp_name,round(months_between(sysdate,emp_dob)/12)as age
from employee;

--4.Display the oldest employee based on experience in each
--department.

/
select * from (b.ename,b.months_between(sysdate,hiredate)/12 as exp,a.deptno,
dense_rank() over(partition by deptno, order by months_between(sysdate,hiredate)/12 desc )rnk
from dept a,emp b
where a.deptno = b.deptno)A
where A.rnk=1;


--5.Display the latest 3 employees who joined the company very
--recently.

/
select ename from (select ename,dense_rank() over( order by hiredate desc )rnk
                       from emp )A
where A.rnk<=3;
/
--6.Display the dname which has highest no. of employees.
/
select a.dname
from dept a,emp b
where a.deptno=b.deptno
group by a.deptno,a.dname
having count(b.empno) in (select max(count(empno))
from emp
group by deptno);

--to find highest dept number
select dname
from dept
where deptno in (select max(count(deptno))
from emp
group by empno);

/


--7.Display the dname whose having atleast 5 employees./
select a.dname
from dept a,emp b
where a.deptno=b.deptno
group by a.deptno,a.dname
having count(b.empno)>5;

--8.Display the top 3 employees based on their salary.
select * from salgrade;
select * from emp;
select * from dept;
select ename,sal,rnk from (select ename,sal,dense_rank() over( order by sal desc )rnk
                       from emp )A
where A.rnk<=3;
9.Display Nth highest salary.
select ename,sal,rnk from (select ename,sal,dense_rank() over( order by sal desc )rnk
                       from emp )A
                       where a.rnk=&n;
--10.Display the employees whose salary is greater than the
--average salary in its department.
select b.ename from (select avg(sal) avg_sal,deptno
                from emp 
                group by deptno)A,emp b
                where  b.sal>A.avg_sal and A.deptno =b.deptno;
-- 11.Display the employees whose getting the highest salary in
--each dept.
select ename,sal,rnk,deptno from (select ename,sal,deptno,dense_rank() over( partition by deptno order by sal desc )rnk
                       from emp )A
                       where a.rnk=1;

--12.Display deptwise no. of employees without using group by.
select * from dept;
/
select * from (select deptno, count(empno),dense_rank() over( partition by deptno order by count(empno) desc )rnk
                       from emp
                       
                       group by deptno)A;
                       /
                       select count(deptno),count(empno)
                       from emp;
                       
--13.Display the employees whose joined the company from last 2
--years.
/
select ename
from emp 
where to_char(hiredate,'yyyy')>to_char(sysdate,'yyyy')-2;

--14.Display the employees who joined the company in the 3 rd
--quarter of last year.
select ename
from emp 
where to_char(hiredate,'yyyy')=to_char(sysdate,'yyyy') and to_char(hiredate,'q')=2;

--15.Display the employees who joined the company this week in
---this month.
select ename
from emp 
where to_char(hiredate,'w-mm-yyyy')=to_char(sysdate,'w-mm-yyyy') ;

--16.Display the employees who joined the company in the first
--quarter of 1 to 10 days.
select ename
from emp 
where to_char(hiredate,'dd-mm-yyyy')=to_char(sysdate,'dd-mm-yyyy') and to_char(hiredate,'q')=1;

--17.Display the employees who joined the company in the Friday
--date of last 2 years.

/
select ename
from emp 
where  to_char(hiredate,'day-mm') ='Friday' and  to_char(hiredate,'yyyy')>to_char(sysdate,'yyyy')-2;

/
--18.Display the employees whose salary is greater than
--manager’s salary.
 
   select ename
   from emp a,emp b
   where 

--19.Display the youngest employee in each department.
select * from (b.ename,max(dob),
dense_rank() over(partition by deptno ,order by max(dob) desc )rnk
from employee)
where A.rnk=1;

--20.Display the department whose number of employees is more
--than the number of employees in a department ‘HR’. 
select * from salgrade;
select * from emp;
select * from dept;
/
select a.dname,count(b.empno)
from dept a,emp b
where a.deptno=b.deptno
group by a.dname
having count(b.empno)>(select max((count(empno)))
from dept a,emp b
where a.deptno=b.deptno and dname='ACCOUNTING'
group by a.deptno)
/