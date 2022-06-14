create or replace trigger trg_employee_sal1
before  insert on aroha
for each row

begin

    if :new.grade='A' and :new.emp_sal not between 15000 and 20000 then
        raise_application_error(-20001,'salary not matching');
  elsif :new.grade='B' and :new.emp_sal not between 30000 and 40000 then
   raise_application_error(-20002,'ctc not matching');
   elsif :new.grade='C' and :new.emp_sal not between 40000 and 50000 then
      raise_application_error(-20003,'ctc not matching');
    end if;
end;
/
create table aroha as select * from employee 
                       where 1=2;
                       
                       select * from aroha;/
                       
alter table aroha add  grade varchar2(5);

select * from aroha;
/
insert into aroha(emp_id,emp_dob,emp_sal,grade)values(14,'10-jun-1991',4000,'C');
/
 create or replace trigger trg_act_pay 
after insert or update on  Acc_Payable
for each row
declare
v_rem_amt number(20);
begin

   select rem_amt  into v_rem_amt from  (select rem_amt ,dense_rank() over(order by rem_amt desc)rnk
    from budget1
    where dept_id=:new.dept_id)A
    where A.rnk=1 ;
    
    if v_rem_amt-:new.amount_paid<0 then
    raise_application_error(-20001,'that much remainig amount is not available');
else
    update budget1 set  rem_amt=rem_amt-:new.Amount_paid 
    where dept_id=:new.dept_id;
    end if;
end;  
    /
insert into acc_payable values(   
    
end;
/
update budget1 set rem_amt=200000;

select * from budget1;
/
select * from  department;
update budget1 set rem_amt=0;
select * from acc_payable;

commit;
insert into acc_payable(pay_id,amount_paid,dept_id) values(su_sq.nextval,300000,11);
insert into acc_payable(pay_id,amount_paid,dept_id) values(su_sq.nextval,3000,11);
insert into acc_payable(pay_id,amount_paid,dept_id) values(su_sq.nextval,6000,11);
/
/
create sequence su_sq;
    /
delete from acc_payable
where pay_id=11;
/

insert into budget1 values(10,11,2021,200000,100000,'12-04-2021','mahesh');
/

select * from budget1;
/
create table budget1(bud_id number(2), dept_id references department12( dept_id), bud_year number(4), bud_amt number(10), 
rem_amt number(10), crt_dt date , crt_by varchar(20) );

insert into budget()

select * from department

create table Acc_Payable(
Pay_id number(10)primary key,
Pay_date date,
Emp_id number(10),
Supp_id number(10),
Invoice_id number(10),
Amount_paid number(10),
Dept_id number(10) REFERENCES department(Dept_id));

insert into Acc_payable(pay_id, pay_date,amount_paid, dept_id) values (11,'10-jun-2022', 40000,null )
insert into acc_payable values(10,12-0    
(

select * from budget



insert into trg_aut values(seg_aut.nextval.var_emp,sysdate.user);

/////////////////////////
create table department12(dept_id number(10)primary key,dept_name varchar(45))

insert into department12 values(11,'IT');
insert into department12 values(12,'Accounting');

select * from department12

create table Acc_Payable(
Pay_id number(10)primary key,
Pay_date date,
Emp_id number(10),
Supp_id number(10),
Invoice_id number(10),
Amount_paid number(10),
Dept_id number(10) REFERENCES department12(Dept_id));

insert into acc_payable values(101,'15-05-2021',111,123,144,500000,11);










/

create table project(
Projec_id number(10),
Start_date date,
End_date date,
No_of_emp number(10),
Budget number(10),
Crt_dt date,
Crt_by varchar(45),
Updt_dt date,
Upd_by varchar(45));

insert into project values(1,'12-03-2021','15-06-2022',5,500000,'12-05-2021','ssss','24-07-2021','bbbb');
select * from project
/
create table Project_Hist(
Projec_h_id number(10),
Project_id number(10),
Start_date date,
End_date date,
No_of_emp number(10),
Budget number(10),
Del_flg varchar(15),
Crt_dt date,
Crt_by varchar(15))
/
select * from project;
select * from project_hist;
desc project_hist;
create sequence sq_project;
/
create or replace trigger trig_project
before update or delete on project
for each row


begin
  if updating then
  insert into project_hist values(sq_project.nextval,old:project_id,:old.start_date,:old.end_date,:old.no_of_emp,
  :old.budget,:old.del_flg,sysdate,'N');
  
  end if;
  end;
  /