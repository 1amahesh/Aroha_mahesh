

create table cont_tab(
contract_id number(20),
contract_type varchar2(40),
cont_s_date date,
cont_e_date date,
cpt_id number(20),
cont_amt number(20),
ins_date date,
upd_date date);
/
select * from cont_tab;

insert into cont_tab values(12345,'government','10-jan-10','10-jan-11',101,700000,'10-jan-10',null);
insert into cont_tab values(12879,'government','03-feb-11','15-feb-12',102,489938,'03-feb-11',null);
insert into cont_tab values(12987,'government','15-feb-11','20-feb-13',103,200000,'15-feb-11',null);
insert into cont_tab values(12346,'government','01-sep-12','10-feb-13',100,400000,'01-Sep-12','10-apr-13');


create table expd_rcv_tab(exp_rec_id number(4),exp_rec_date date,contract_id number(20),amount number(20));
/
select * from con_pay_terms;/

create table con_pay_terms(cpt_id number(20),freq_of_pmt varchar2(30));

insert into con_pay_terms values(100,'monthly');
insert into con_pay_terms values(101,'quarterly');
insert into con_pay_terms values(102,'half yearly');
insert into con_pay_terms values(103,'yearly');

--CONTRACT PROBLEM:

--PROBLEM DESCRIPTION:

--Your job is to populate the expected receivables based on the contract payment terms.
--Divide the amount based on the contract payment terms and insert those many records       
--in the expected record id.
--This process helps the company/organization to know the amount they were expecting this month for planning.
/
create or replace procedure sp_contract as

cursor c_src is select * from cont_tab;
 start_dt date;
 end_dt date;
 no_of_months number;
 v_cnt number(20);
 last_dt date;
 exist exception;
begin
for i in c_src loop

   no_of_months:=months_between(i.cont_e_date,i.cont_s_date);
   last_dt :=add_months(i.cont_s_date,no_of_months);

select count(contract_id) into v_cnt
from expd_rcv_tab
where contract_id=i.contract_id;

    if v_cnt=0 then 

        if i.cpt_id=100 then
            while i.cont_s_date <= last_dt loop
              insert into expd_rcv_tab values(sq_contract1.nextval,i.cont_s_date,i.contract_id,i.cont_amt/no_of_months);
               i.cont_s_date:=add_months(i.cont_s_date,1);
         end loop;
         
         elsif i.cpt_id=101 then
    
               while i.cont_s_date <=i.cont_e_date loop
                insert into expd_rcv_tab values(sq_contract1.nextval,i.cont_s_date,i.contract_id,i.cont_amt/(no_of_months/3));
                 i.cont_s_date:=add_months(i.cont_s_date,3);
                end loop;
         
       elsif i.cpt_id=102 then
           while i.cont_s_date <=last_dt loop
              insert into expd_rcv_tab values(sq_contract1.nextval,i.cont_s_date,i.contract_id,i.cont_amt/(no_of_months/6));
               i.cont_s_date:=add_months(i.cont_s_date,6);
          end loop;
       elsif i.cpt_id=103 then
              while i.cont_s_date <=last_dt loop
              insert into expd_rcv_tab values(sq_contract1.nextval,i.cont_s_date,i.contract_id,i.cont_amt/(no_of_months/12));
               i.cont_s_date:=add_months(i.cont_s_date,12);
              end loop;
       end if;
   else
   raise exist;
 
  end if;
  
end loop;

exception
when exist then
dbms_output.put_line('data already populated');

end;
/
exec sp_contract;
/
set serveroutput on;
/
select * from  expd_rcv_tab;
/
truncate table expd_rcv_tab;
/
select * from  cont_tab ;



