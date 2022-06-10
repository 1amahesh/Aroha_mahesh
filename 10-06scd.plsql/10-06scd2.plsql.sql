--scd-type2 when insert happens in source 
/

create table prod_dim_type2
(pro_sur_id number(10 )primary key,
prod_id int,
prod_nm varchar2(30),
prod_cat varchar2(20),
prod_family varchar2(30),
prod_price number,
from_date date,
to_date date,
cur_rec_ind varchar2(1)
);
create sequence sq_dim2;
desc prod_dim_type2;prod_id,prod_nm,prod_cat,prod_family,prod_price,from_date,to_date,cur_rec_ind
/
select * from prod_dim_type2;
select * from prod_family;
select * from prod_cat;
select * from products;
/
create or replace procedure sp_scd_type2 as
cursor c_scd2 is select * from (select c.prod_id,c.prod_name,b.prod_cat_desc,a.prod_fam_desc,c.prod_price
                 from prod_family a,prod_cat b,products c
                 where  a.prod_fam_id=b.prod_fam_id and b.prod_cat_id=c.prod_cat_id )A;
                
 v_cnt number(2);               
begin

for i in c_scd2 loop
   select count(*) into v_cnt
   from prod_dim_type2
   where prod_id=i.prod_id and prod_nm=i.prod_name and prod_cat=i.prod_cat_desc and prod_family=i.prod_fam_desc;


       if v_cnt = 0 then
          insert into prod_dim_type2 values(sq_dim2.nextval,i.prod_id,i.prod_name,i.prod_cat_desc,i.prod_fam_desc,i.prod_price,sysdate,null,'y');
      else 
         insert into prod_dim_type2 values(sq_dim2.nextval,i.prod_id,i.prod_name,i.prod_cat_desc,i.prod_fam_desc,i.prod_price,sysdate,null,'y');
                 update prod_dim_type2 set to_date=sysdate-1,
                            cur_rec_ind='N'
                 where pro_sur_id=(select pro_sur_id from(select pro_sur_id ,dense_rank() over(order by pro_sur_id desc)rnk
                  from prod_dim_type2 where prod_id=i.prod_id)A
                 where a.rnk=2) ;
      end if;

end loop;
end;
/
exec sp_scd_type2;
/
select * from prod_dim_type2;
/
select pro_sur_id from prod_dim_type2;
/
select pro_sur_id from(select pro_sur_id ,dense_rank() over(order by pro_sur_id desc)rnk
from prod_dim_type2)A
where a.rnk=2
/
truncate table prod_dim_type2;
/
select * from products;
/
delete from products 
where prod_id=24;
/
update products set prod_price=50000
where prod_id=1;