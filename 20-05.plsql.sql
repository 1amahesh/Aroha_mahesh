create or replace procedure sp_dynamic2(p_table in varchar2)as
  v_column varchar2(200);
  v_cnt number(20);
  v_t_cnt number(20);
  table_not_found exception;
begin
   select count(*) into v_t_cnt 
   from user_tables where 
  table_name=upper(p_table);
      if v_t_cnt=1 then
    
        v_column :='select count(column_name) from user_tab_columns where table_name=' ||''''||upper(p_table)||'''';
        -- dbms_output.put_line('columns are:'||v_column);
           execute immediate v_column into v_cnt;
             dbms_output.put_line('columns are'||v_cnt);
     else
       raise table_not_found;
     end if;
exception
when table_not_found then
raise_application_error(-20001,'table doesnot exist');
end;
/
exec sp_dynamic2('emp1');
/
set SERVEROUTPUT ON;
/
exec sp_dyn('emp');
/
select count(column_name) from user_tab_columns where table_name='EMP';
/
select count(*) from user_tables where table_name='EMP';
/
select * from user_tables
where table_name='EMP';
select * from emp;
/
select count(*) from ;
/
 select *  
   from user_tables where 
  table_name='EMP';
  /
   select count(*) 
   from user_tables where 
  table_name=upper(p_table);
  /
  select * from emp;
  /
--8.Pass the table_name in a procedure and display the no. of records and no. of columns in that table using dynamic sql.  
select * from emp;
/

create or replace procedure sp_cnt_reccolumn(p_table varchar2)as
v_str_rows varchar2(200);
v_count_rows number(20);
v_str_column varchar2(200);
v_count_column number(20);
v_cnt number(20);
begin
select count(*)into v_cnt
from user_tables 
where table_name=upper(p_table);

if v_cnt=1 then
v_str_rows:='select count(*) from '||p_table;
--dbms_output.put_line(v_str_rows);
v_str_column:='select count(column_name) from user_tab_columns where table_name='||''''||upper(p_table)||'''';
--dbms_output.put_line(v_str_column);
execute immediate v_str_rows into v_count_rows;
dbms_output.put_line('the counted rows are :'||v_count_rows);
execute immediate v_str_column into v_count_column;
dbms_output.put_line('columns are :'||v_count_column);
else
dbms_output.put_line('table doesnot exist');
end if;
end;
/
set serveroutput on;
/
exec  sp_cnt_reccolumn('emp1');
/
select * from user_tab_colums;
/
select * from user_tables
where table_name='EMP';

--3.Write a procedure by passing the location at run time and create ‘office_<location>’ table
--With the columns office_<location>_id,office_<location>_name,office_city.
/
create or replace procedure sp_location(p_location varchar2)authid current_user is
v_str varchar2(200);

begin
v_str:='create table office_'||p_location||'(office_'||p_location||'_id number(6) primary key , office_'||p_location||'_name varchar2(20),office_city varchar2(20))';
dbms_output.put_line(v_str);
execute immediate v_str ;

end;
/
exec sp_location('manyatha');
/
desc office_manyatha;

/
set serveroutput on;
/

create table office_basavanagudi(office_basavanagudi_id int primary key,office_basavangudi_name varchar2(20),office_city varchar2(20));


















