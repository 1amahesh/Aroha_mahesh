declare

x varchar2(200):='mysore,belgaum,mangalore';
b number:=1;
v_pos number(20);
sub varchar2(200);
last_city varchar2(20);
begin

for i in 1..length(x)loop
v_pos:=instr(x,',',1,i);
sub:=substr(x,b,v_pos-b);
b:=v_pos+1;
exit when sub is null;
dbms_output.put_line(sub);
end loop;
last_city:=substr(x,(instr(x,',',-1,1)+1));
dbms_output.put_line(last_city);
end;
/
set serveroutput on;

select instr('mysore,belgaum,mangalore',',',1) from dual;


select instr('aroha techa','a',1,3) from dual;

--pass a string in horizontally and display it in vertically 10,20,30,40,50
  declare
  x varchar2(20):='10,20,30,40,50';
  v_pos number(20);
  v_sub varchar2(20);
  b number(10):=1;
  last_city varchar2(20);
  begin 
  for i in 1..length(x) loop
  v_pos:=instr(x,',',1,i);
  v_sub:=substr(x,b,v_pos-b);
  b:=v_pos+1;
  exit when v_sub is null;
  dbms_output.put_line(v_sub);
  end loop;
  last_city:=substr(x,instr(x,',',-1,1)+1);
  end;
  /
  
  
  
  
  
  
  

--count the charecter in abbbaa
/
declare 
x varchar2(20):='abbbaa';
v_sub varchar2(20);
v_reg_count number(10);

begin

for i in 1..length(x) loop

v_sub:=substr(x,i,1);

select regexp_count(x,v_sub) into v_reg_count
from dual;

dbms_output.put_line(v_sub||'='||v_reg_count);

end loop;

end;
/

begin

for i in 1..5 loop
 for j in 1..i loop
 dbms_output.put(i);
 end loop;
 dbms_output.put_line('');
end loop;
end;
/
set serveroutput on;

select * from dict;




--factorial number

/

declare
x number:=5;

begin

for i in 1..x-1 loop
x:=x*i;
end loop;
dbms_output.put_line(x);

end;

/


create table B(B_id number(5));

insert into B values(1);
insert into B values(1);
insert into B values(null);
insert into A values(0);

select * from A;

select count(*)
from A full outer join B
on  A.A_id = B.B_id;

select *
from emp;
where rowid in (select max(rowid)
from emp);

select count(*)
from A, B
where  A.A_id = B.B_id(+);

select * from emp
where rownum =4;


select * from user_sequences
where sequence_name='SQ_CUST';



select * 
from user_tab_columns
 where table_name='TREAT_TYPE' and rownum<=2;
 
 alter table  treat_type rename column treat_type_desc to treat_desc;
 
 
 select * from treat_type;
 
 select * from A;
 select * from B;
 
create table mahesh1111 as select * from A
where 1=1;

select * from mahesh1111;
drop table  mahesh1111;
 
 
 
 