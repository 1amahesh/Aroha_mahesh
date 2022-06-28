declare
p_a varchar2(30):='mahesh mounav';
v_a varchar2(10);
v_c number(10);
begin
for i in 1..length (p_a) loop
v_a:=substr(p_a,i,1) ;
select regexp_count(p_a,v_a) into v_c
from dual;
dbms_output.put_line(substr(p_a,i,1)||'='||v_c);
end loop;
end;
/
set serveroutput on;

/
declare
x number:=0;
begin

for i in 1..10 loop
   dbms_output.put_line(3);
   if mod(i,3)=0 then 
   x:=i+3;
    dbms_output.put_line(x);
   end if;
   --dbms_output.put_line(x);
end loop;

end;
  / 
  
  
  declare
  x number:=3;
  y number:=0;
  begin
  while y<=1000-3 loop
  y:=y+x;
  dbms_output.put_line(y);
  end loop;
  
  end;

/

select * from sales_retail;

/
select count(sales_id)
from sales_retail
where to_char(sales_date,'yy') between to_char(sysdate,'yy')-4 and to_char(sysdate,'yy');

/
select to_char(sysdate,'yy')-2 from dual;

select * from sales_retail;

--top 3 sales on  last 5 years in 2nd quarter of ist week

select * from (select sales_id as sales,dense_rank() over(order by sales_id desc)rnk
               from  sales_retail
               where  to_char(sales_date,'q')=2 and to_char(sales_date,'w')=3 and to_char(sales_date,'yy') = to_char(sysdate,'yy')-4)A
               where A.rnk<=3;


select instr('maheshmounav@gmail.comjbdjcbdb','@') from dual;

select substr('maheshmounav@gmail.com',instr('maheshmounav@gmail.com','@')+1,
instr('maheshmounav@gmail.com','.')-instr('maheshmounav@gmail.com','@')-1) from dual;



select instr('maheshmounav@yahoo.com','.') from dual;

select substr('maheshmounav@gmail.comjbdjcbdb',instr('maheshmounav@yahoo.com','@')+1,
instr('maheshmounav@yahoo.com','.')-instr('maheshmounav@yahoo.com','@')-1) from dual;


select * from customer_retail;


select * 
from customer_retail
where length(phone_no)=7 and cust_email like '%gmail%';






select 