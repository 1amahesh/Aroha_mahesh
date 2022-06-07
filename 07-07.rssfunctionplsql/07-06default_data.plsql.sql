create or replace procedure sp_shop as
/
select * from shop_dimension;
desc shop_dimension;
/
create or replace procedure sp_default_data as

v_cnt number(1);
begin

     select count(*)into v_cnt
     from shop_dimension
     where shop_id=-1;

      if v_cnt=0 then
         insert into shop_dimension values(-1,'raama','unknown','unknown','n','n',0,'unknown',null,null);
         commit;
      else
         raise_application_error(-20001,'data exist');
     end if;
  exception
  when others then
  rollback;
  dbms_output.put_line(sqlcode||','||sqlerrm);
  
end;
/
desc shop_dimension;/

desc employee;
select * from employee;
/
create or replace function fun_age_group(p_empid number) return varchar2 is
v_string varchar2(20);
v_empage number(20);

begin

      select  months_between(sysdate,emp_dob)/12 into v_empage        
      from employee
      where emp_id=empid;

      select(case when v_empage between 20 and 25 then 'junior in the company' 
             when v_empage between 35 and 50 then 'mid level in the company' 
             when v_empage > 50 then 'senior in the company' end )into v_string
      from employee
      where emp_id=p_empid;
      
      return v_string;
      
    exception 
when no_data_found then
dbms_output.put_line('no such empid'||p_empid);
when others then
dbms_output.put_line(sqlcode ||','||sqlerrm);
end;

      
    end;
/
create table employee as select * from adityan.employee;
/
create or replace function fun_age_group1(p_empid number) return varchar2 is
v_string varchar2(20);
v_empage number(20);

begin

      select  months_between(sysdate,emp_dob)/12 into v_empage        
      from employee
      where emp_id=p_empid;

     if v_empage between 20 and 35 then
      v_string:='junior';
      elsif v_empage between 36 and 50 then
     v_string:= 'mid-level';
     elsif v_empage>50 then
     v_string:='senior' ;
     else
     v_string:='unknown';
     end if;
     return v_string;
     
exception 
when no_data_found then
return 'no such empid';
when others then
dbms_output.put_line(sqlcode ||','||sqlerrm);
end;


    
end;
     
  /
  
  select fun_age_group1(2)from dual;
  select * from employee;
  
select * from all_tables
where table_Name='EMPLOYEE';

/
create table mahess1 as select * from adityan.employee
where 1=2;
/
select * from mahess1;




