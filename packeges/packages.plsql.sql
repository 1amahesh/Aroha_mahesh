create or replace package pkg_procedure as
v_cnt int;
procedure sp_p1;
function fn_f1 return number;

end;
/
create or replace package body pkg_procedure as
procedure sp_pvt;
procedure sp_p1 as
begin

update emp set sal=3000
where empno=7369;
sp_pvt;
dbms_output.put_line(sql%rowcount || 'rows modified');
end;

 function fn_f1 return number as
v_cnt number;
begin
select count(*) into v_cnt
from emp;
return v_cnt;
end;

procedure sp_pvt as
v_cnt int;

begin


dbms_output.put_line('hello');

end;
end;

/
exec pkg_procedure.sp_p1;
/
select pkg_procedure.fn_f1 from dual;
/
create or replace package body pkg_private as
procedure sp_p1 as
v_cnt int;

begin

update emp set sal=3000
where empname='allen';

dbms_output.put_line(sql%rowcount || 'rows modified');
end;
/
select * from emp;