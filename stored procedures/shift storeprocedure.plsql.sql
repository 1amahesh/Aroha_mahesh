
--Write a stored procedure which takes MON_YY as the argument and populate the shifts table
--Business Rules
--Company don’t work on Sunday, so no shifts on that day
--We work from Monday to Saturday
--If the day falls in Holiday_list then no shift for that day
--Saturday has only morning shift */
Create table holiday
(holi_id number(10),
Dt_date date,
Reason varchar2(20));

Create table shift_type
(shift_desc varchar2(20),
Start_time varchar2(20),
End_time varchar2(20));

Create table shifts
(shift_id number(10),
Dt_date date,
Start_time varchar2(20),
End_time varchar2(20));

insert into holiday values('101','01-jan-15','New Year');
insert into holiday values('102','16-jan-15','Shankaranthi');
insert into holiday values('103','26-jan-15','republic day');
insert into holiday values('104','18-feb-15','Id day');
insert into holiday values('105','01-may-15','May day');
insert into holiday values('106','15-aug-15','independence day');
insert into holiday values('107','01-nov-15','Karnataka day');

insert into shift_type values('erly_mrng_shift','6:00AM','2:00PM');
insert into shift_type values('afternoon_shift','2:00AM','10:00PM');
/
create sequence sequence_startdate
start with  1
increment by 1
minvalue 1
maxvalue 100
nocycle;


/
drop sequence sequence_startdate;

/
create or replace procedure sp_start_proc as
x varchar2(20):='4-22';
start_dt date;
last_dt date;
no_of_days number(20);
begin 
start_dt:=to_date(x,'mm-yy');
last_dt:= last_day(start_dt)+1;
no_of_days:=last_dt-start_dt;
for i in 1..no_of_days loop
insert into shifts values(sequence_startdate.nextval,start_dt,'6:00AM','2:00PM');
start_dt:=start_dt+1;
end loop;
end;

/
exec sp_start_proc;
/
set serveroutput on;
/
desc shifts;

select * from shifts;

/--using while loop ,
create or replace procedure sp_start_proc (p_mm_yy varchar2)as
v_cnt number(20);
start_dt date;
last_dt date;
s_count number(20);
u_month exception;
begin 
 start_dt:=trunc(to_date(p_mm_yy,'mon-yy'),'yy');
  last_dt:=last_day(start_dt);

while start_dt <= last_dt loop
    select count(*) into s_count
     from holiday
      where dt_date=start_dt;
      
      select count(*)into v_cnt
      from shifts
      where start_dt=dt_date;
      
    if v_cnt=1 then
    raise u_month;
    
   if s_count=0 and to_char(start_dt,'dy')<>'sun' then
         if to_char(start_dt,'dy')='sat' then
         insert into shifts values(sequence_startdate.nextval,start_dt,'6:00AM','2:00PM');
          else
          insert into shifts values(sequence_startdate.nextval,start_dt,'6:00AM','2:00PM');
           insert into shifts values(sequence_startdate.nextval,start_dt,'2:00pM','10:00PM');
           end if;

end if;
start_dt:=start_dt+1;
end if;
end loop;

exception
when u_month then
DBMS_OUTPUT.PUT_LINE('month exist');
when others then
DBMS_OUTPUT.PUT_LINE(sqlcode ||' - '||SQLERRM);
end;
/
exec  sp_start_proc('mar-19');
/
select * from shifts;
/
truncate table shifts;
/
set serveroutput on;




















