
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

create or replace procedure sp_ref_select(p_id in int,p_ref out sys_refcursor)as
begin
if p_id=1 then
open p_ref for select * from customer_retail;
else
open p_ref for select * from product_retail;
end if;
end;
/

variable b_ref refcursor;
exec sp_ref_select(1,:b_ref);
print :b_ref;