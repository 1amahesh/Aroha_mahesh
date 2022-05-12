declare
x number(5):=&x;

begin
for i in 1..x-1 loop
x:=x*i;
end loop;
dbms_output.put_line('factorial of number is' || x);
end;