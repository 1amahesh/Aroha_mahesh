select count(column_name) from user_tab_columns where table_name='EMP';
/

select column_name from user_tab_columns
where table_name='EMP';

select * from emp;
/
create or replace procedure sp_dynamic2(p_table in varchar2)as
  v_column varchar2(200);
  v_cnt number(20);
  v_t_cnt number(20);
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
       dbms_output.put_line('table doesnot exist');
     end if;
end;
/
exec sp_dynamic2('emp1');
/
exec sp_dynamic('emp');
/

/
exec sp_table_columns('emp');
/
select *
from user_tab_columns;
/
select column_name from user_tab_columns where table_name='EMP';
/
select column_name from user_tab_columns where table_name='EMP';
/
--4. Write a procedure by passing the table name and check the table exists or not, 
--if exists display all the column names in that table otherwise handle the exception
create or replace procedure sp_table_columns1(p_table varchar2)as
    t_column varchar2(200);
    type t_list is table of varchar2(20);
    v_list t_list;
    v_cnt number(20);
begin
  select count(*) into v_cnt 
  from user_tables where 
  table_name=upper(p_table);
    if v_cnt=1 then
        t_column:='select column_name from user_tab_columns where table_name='||''''||upper(p_table)||'''';
--      dbms_output.put_line(t_column);
        execute immediate t_column bulk collect into v_list;
        for i in 1..v_list.last loop
            dbms_output.put_line(v_list(i));
        end loop;
    else
        dbms_output.put_line('table doesnot exist');
    end if;
end;
/
exec sp_table_columns1('emp');
/
select count(*) from user_tables
where table_name=P_TABLE;
/
select * from user_tab_columns;
/
select * from user_tables;
/


/
--1. Write a procedure to add columns to the existing customer table by passing column name and datatype.

create or replace procedure sp_alter_table(p_column varchar2,p_datatype varchar2)as
v_str varchar2(20);
 
begin 
 v_str:='alter table customer add ='||p_column||' '||p_datatype;
--dbms_output.put_line(v_str);
execute immediate v_str;
end;
/
exec sp_alter_table('landmark' 'varchar2');
/
select * from city; 
/
alter table city add pin number(20);
/
'alter table customer add ='||

||' '||p_datatype;