select * from prod_family;
select * from prod_cat;
select * from products;
desc prod_dim;

create or replace procedure sp_scd1 as
cursor c is select * from (select pp.prod_name,pc.prod_cat_desc,pf.prod_fam_desc,pp.prod_price
                         from prod_family pf,prod_cat pc,products pp
                         where pf.prod_fam_id=pc.prod_fam_id and pc.prod_cat_id=pp.prod_cat_id);
v_cnt number(20);                       
begin
for i in c loop

select count(*) into v_cnt
from prod_dim
where prod_nm=i.prod_name and prod_cat=i.prod_cat_desc and prod_family=i.prod_fam_desc;

if v_cnt=0 then
   insert into prod_dim values(SQ_dim1.nextval,i.prod_name,i.prod_cat_desc,i.prod_fam_desc,i.prod_price,null,sysdate);
else
  update prod_dim set prod_nm=i.prod_name,
                   prod_cat=i.prod_cat_desc,
                   prod_family=i.prod_fam_desc,
                   prod_price=i.prod_price,
                   crt_date=null,
                   upd_date=sysdate
 where    prod_nm<>i.prod_name or prod_cat<>i.prod_cat_desc or prod_family<>i.prod_fam_desc or prod_price<>i.prod_price or upd_date<>sysdate;
end if;
end loop;
end;
/
exec sp_scd1;
/
select * from prod_dim;
       select * from prod_family;
select * from prod_cat;
select * from products;
/
insert into prod_family(prod_fam_id,prod_fam_desc)values(130,'plastic');
insert into prod_cat(prod_cat_id,prod_cat_desc)values(23,'cricket');
insert into products(prod_id,prod_name)values(24,'bat');

