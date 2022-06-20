
select * from all_tables;
create or replace function fun_count_column(p_table varchar) return number as

v_cnt number(1);

count_columns number(3);

begin

       select count(*) into v_cnt
       from all_tables
       where table_name=upper(p_table);
    
       
       select count(column_name) into count_columns
       from user_tab_columns
       where table_name=upper(p_table);
     
     if v_cnt>0 then
       return  count_columns;
     else 
        return -1;
      end if;
      
 exception 
 when others then
 dbms_output.put_line(sqlcode||',' ||sqlerrm);
     
     end;
     /
     select  fun_count_column('EMP') from dual;
     
     /
      select count(column_name) 
       from user_tab_columns
       where table_name='EMP';
       
--mutating error

create or replace trigger trg_mutating_error 

after insert or delete or update on employee
disable
declare
v_cnt number(2);
begin
    
    select count(*)into v_cnt
    from employee;
     
     end;
     
   /  
  select * from employee;   
     
     
     
   insert into employee(emp_id,emp_name)values(6,'mahesh');  
     
     
select * from all_triggers
where table_name='EMPLOYEE';
     
     
     
    select date_time(dw,"01/01/94") from dual;
     
     
     