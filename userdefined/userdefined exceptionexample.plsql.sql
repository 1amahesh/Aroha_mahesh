declare
a number(2):=10;
b number(2):=1;
c number(2);
one_divide exception;
begin
if b=1 then
  raise one_divide;
   end if;
c:=a/b;
dbms_output.put_line(c);

exception
when zero_divide then
dbms_output.put_line('zero divide');
when one_divide then
raise_application_error(-20001,'one divide');
when others then
dbms_output.put_line(sqlerrm);
end;
/
set SERVEROUTPUT ON;
/
select * from dual;