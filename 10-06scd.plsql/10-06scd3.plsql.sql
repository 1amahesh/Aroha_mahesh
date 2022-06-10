create table prod_dim_type3
(prod_id number(5) primary key,
pd_nm varchar2(30),
pd_pre_nm varchar2(30),
prod_cat varchar2(20),
prod_pre_cat varchar2(20),
prod_family varchar2(30),
prod_pre_family varchar2(30),
prod_price number,
prod_pre_price number
);


prod_id,pd_nm,prod_cat,prod_family,prod_price
/
create or replace procedure sp_scd3 as
cursor c is select * from (select pp.prod_id,pp.prod_name,pc.prod_cat_desc,pf.prod_fam_desc,pp.prod_price
                         from prod_family pf,prod_cat pc,products pp
                         where pf.prod_fam_id=pc.prod_fam_id and pc.prod_cat_id=pp.prod_cat_id);
v_cnt number(20);                       
begin
for i in c loop

select count(*) into v_cnt
from prod_dim_type3
where prod_id=i.prod_id and pd_nm=i.prod_name and prod_cat=i.prod_cat_desc and prod_family=i.prod_fam_desc;

if v_cnt=0 then
   insert into prod_dim_type3(prod_id,pd_nm,prod_cat,prod_family,prod_price)values(i.prod_id,i.prod_name,i.prod_cat_desc,i.prod_fam_desc,i.prod_price);
else
update  prod_dim_type3 set pd_pre_nm=pd_nm,
                           prod_pre_cat=prod_cat,
                           prod_pre_family=prod_family,
                           prod_pre_price=prod_price
where prod_id=i.prod_id;

update prod_dim_type3 set pd_nm=i.prod_name,
                   prod_cat=i.prod_cat_desc,
                   prod_family=i.prod_fam_desc,
                   prod_price=i.prod_price
where prod_id=i.prod_id and pd_pre_nm is not null;
end if;
end loop;
end;
/
exec sp_scd3;
select * from prod_dim_type3;
select * from products;
desc prod_dim_type3; 
/
select * from products;

update products set prod_price=80000
where prod_id=1;
/
truncate table prod_dim_type3;