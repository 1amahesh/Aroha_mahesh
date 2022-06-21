    

alter table actor add s_id number(3) references state(s_id);1,3,5=10,2,4=20,6=30,7=40;


update actor set s_id=50
where actor_id =107;

select * from actor;

select * from state;
--display the actors from each state
select * from (select actor_name,s_name,dense_rank() over(partition by s.s_name order by a.actor_name)rnk
               from state s,actor a
               where s.s_id=a.s_id)A;
               
--display the costliest products in each family    
select * from prod_cat;
select * from products;

select * from(select prod_name,prod_cat_desc,prod_price,dense_rank() over(partition by pc.prod_cat_desc order by pr.prod_price desc)rnk
              from prod_cat pc,products pr
              where pr.prod_cat_id=pc.prod_cat_id)A
              where A.rnk=1;
              
              
--display oldest actors from each state
select * from actor;

select * from state;

select * from (select a.actor_name,s_name,dense_rank() over(partition by s.s_name order by a.dob)rnk
               from state s,actor a
               where s.s_id=a.s_id)A
               where A.rnk=1;
 
 --display the prod_catagory which does not have products  
 select * from prod_cat;
select * from products;
select prod_cat_desc
from prod_cat pc,products pr
where pc.prod_cat_id=pr.prod_cat_id(+) and prod_id is null;

               /
select * from(select deptno,count(empno),dense_rank() over( order by count( empno))rnk
              from emp
              group by deptno)A
              where A.rnk=1;
              
              select * from dept;