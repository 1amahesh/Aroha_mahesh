create table agency_src
(agency varchar(20),
program_name varchar(20),
fiscal_year int,
original_appr_amount numeric);
select * from agency_src;

create table agency_tgt
(agency varchar(20),
program_name varchar(20),
fiscal_year int,
Original_appr_amount numeric,
program_amount numeric,
agency_amount numeric,
total_amount numeric);
select * from agency_tgt;

select * from agency_src;
select * from agency_tgt;

insert into agency_src values('Education','High school grant',2005,350000);
insert into agency_src values('Education','Middle school grant',2005,50000);
insert into agency_src values('Education','High school grant',2004,250000);
insert into agency_src values('Dep','Air',2005,50000);
insert into agency_src values('Dep','Air',2004,60000);
insert into agency_src values('Dep','Water',2005,70000);
/
create or replace procedure sp_agency as
cursor c_agency is select * from agency_src;
v_cnt number;

begin 
for i in c_agency loop

    select count(*) into v_cnt
    from agency_tgt
     where agency=i.agency and program_name=i.program_name and fiscal_year=i.fiscal_year and original_appr_amount=i.original_appr_amount;

        if v_cnt=0 then
          insert into agency_tgt values(i.agency,i.program_name,i.fiscal_year,i.original_appr_amount,(select sum(original_appr_amount) from agency_src
where program_name=i.program_name),(select sum(original_appr_amount) from agency_src where agency=i.agency ),(select sum(original_appr_amount)
from agency_src));
        end if;
end loop;
end;
/
exec sp_agency;
/
select * from agency_tgt;
/
select * from agency_src;


select sum(original_appr_amount)
from agency_src
group by program_name;
select sum(original_appr_amount)
from agency_src
group by agency;