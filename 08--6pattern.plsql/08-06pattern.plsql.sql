
--print pattern given below using plsql block
/*
*
**
***
****
*****   */



begin
for i in 1..5 loop
  for j in  1..i loop
  dbms_output.put('*');
  end loop;
  dbms_output.put_line('');
 end loop;
end;
/
set serveroutput on;
/

--print pattern given below using plsql block

*****
****
***
**
*



begin
for i in reverse 1..5 loop
  for j in  1..i loop
    dbms_output.put('*');
  end loop;
  dbms_output.put_line('');
end loop;
end;

----print pattern given below using plsql block
1
22
333
4444
55555
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
----print pattern given below using plsql block
55555
4444
333
22
1


begin
for i in reverse 1..5 loop
   for j in 1..i loop
    dbms_output.put(i);
   end loop;
   dbms_output.put_line('');
end loop;
end;
/
------print pattern given below using plsql block

1
23
456
78910

declare
  k int:=0;
begin
for i in 1..4 loop
   for j in 1..i loop
     k:=k+1;
     dbms_output.put(k);
   end loop;
 dbms_output.put_line('');
end loop;
end;
/

----print pattern given below using plsql block
1
12
123
1234
12345
/

begin
 for i in 1..5 loop
   for j in 1..i loop
     dbms_output.put(j);
   end loop;
 dbms_output.put_line('');
 end loop;
end;
/






