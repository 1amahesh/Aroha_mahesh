declare

v_city varchar2(100);
v_pos number(20);
v_city1 varchar2(100);
v_city2 varchar2(100);
v_city3 varchar2(100);


begin
 v_city:='bangalore,chennai,dharwad';
 
    if instr(v_city,',')=0 then
      raise_application_error(-20001,'no comma found');
    else
       v_pos:=instr(v_city,',');
       v_city1:=substr(v_city,1,v_pos-1);
       v_city2:=substr(v_city,v_pos+1,v_pos-instr(v_city,',',2)-1);
      v_city3:=substr(v_city,(instr(v_city,',',2)),(instr(v_city,',',-1)));
    end if;
--dbms_output.put_line(v_city1);
--dbms_output.put_line(v_city2);
dbms_output.put_line(v_city3);
end;
/
SET SERVEROUTPUT ON;
     select substr('bangalore,chennai,dharwad',instr('bangalore,chennai,dharwad',',')+1,(instr('bangalore,chennai,dharwad',',',1,2)-instr('bangalore,chennai,dharwad',',')-1) )from dual;
 /
 
 /
 declare

v_city varchar2(100);
v_pos number(20);
v_city1 varchar2(100);
v_city2 varchar2(100);
v_city3 varchar2(100);


begin


 v_city:='bangalore,chennai,dharwad';
 
        v_pos:=instr(v_city,',');
        v_city1:=substr(v_city,1,v_pos-1);
        v_city2:=substr(v_city,v_pos+1,instr(v_city,',',1,2)-instr(v_city,',',1)-1);  
        v_city3:=substr(v_city,instr(v_city,',',1,2)+1,instr(v_city,',',-1));

dbms_output.put_line(v_city1);
dbms_output.put_line(v_city2);
dbms_output.put_line(v_city3);
end;

/

declare

x varchar2(200):='bangalore,chennai,dharwad,mysore';
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

