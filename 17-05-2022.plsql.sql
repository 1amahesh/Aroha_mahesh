--display all count of columns by passing table name 
create or replace procedure sp_dyn(p_table_name varchar2) as
v_str varchar2(200);
v_cnt int;
begin
v_str:='select count(column_name) from user_tab_columns where table_name='||''''||upper(p_table_name)||'''';
--dbms_output.put_line(v_str);
execute immediate v_str into v_cnt;
dbms_output.put_line('no of columns'||v_cnt);
end;
/
exec sp_dyn('emp');

/
set serveroutput on;
/
select count(*) from emp;
/
select count(column_name) from user_tab_columns where table_name='EMP';
/
select column_name from user_tab_columns where table_name='DEPT';
/
select to_date('10-10-2022','dd-mm-yyyy') from dual;
/

select to_date

/
create or replace procedure sp_dyn_1(p_table_name varchar2) as
v_str varchar2(200);
v_cnt int;
type t is table of varchar2(30);
v_tab t;
begin
v_str:='select column_name from user_tab_columns where table_name='||''''||upper(p_table_name)||'''';
--dbms_output.put_line(v_str);
execute immediate v_str bulk collect into v_tab;
--dbms_output.put_line('no of columns'||v_cnt);
for i in 1..v_tab.last loop
dbms_output.put_line(v_tab(i));
end loop;
end;
/
exec sp_dyn_1('EMP');
/

create or replace procedure sp_ref(p_table_name varchar2) as
v_ref sys_refcursor;
V_COL VARCHAR2(20);
begin
OPEN V_REF FOR select column_name from user_tab_columns where table_name=P_TABLE_NAME;
LOOP
FETCH V_REF INTO V_COL;
EXIT WHEN V_REF%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(V_COL);
END LOOP;
CLOSE V_REF;
end;
/

EXEC SP_REF('EMP');


