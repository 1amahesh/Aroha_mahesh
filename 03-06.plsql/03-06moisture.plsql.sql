	
create table input_src	
(specification_mix varchar(20),	
actual_value int);	
	
	
create table output_tbl_tgt	
(specification_mix varchar(50),	
Actual_val int,	
Ash_val int,	
moisture_val int,	
protein_val int);	
	
	
	insert into input_src values ('Ash 12345 Mix',12);
insert into input_src values ('Moisture 1234 TY',13);
insert into input_src values ('Protein 12A ',10);
insert into input_src values ('Ash ABC 124',11);
insert into input_src values ('Moistu wint Wheat',14);

drop table input_src;

create or replace procedure sp_moisture as
      cursor c_moist is select specification_mix,actual_value from input_src;
      v_count number(5);
      v_1 number:=0;
       v_2 number:=0;
       v_3 number:=0;
     
begin
    for i in c_moist loop
      select count(*) into v_count
      from output_tbl_tgt	
      where specification_mix=i.specification_mix
      and actual_val=i.actual_value;
        if v_count=0 then
          if i.specification_mix like 'Ash%' then
             insert into output_tbl values(i.specification_mix,i.actual_value,i.actual_value,v_2,v_3);
         elsif i.specification_mix like 'Moisture%' then
             insert into output_tbl values(i.specification_mix,i.actual_value,v_1,i.actual_value,v_3);
        elsif i.specification_mix like 'Protein%' then
             insert into output_tbl values(i.specification_mix,i.actual_value,v_1,v_2,i.actual_value);
        else
           dbms_output.put_line('do not insert');
          end if;
        end if;
    end loop;
exception
when others then
dbms_output.put_line(sqlcode||'-'||sqlerrm);
end;
/

exec sp_moisture;
/
select * from input_src;
set serveroutput on;
/
exec sp_moisture;
/
select * from input_src;
select * from output_tbl_tgt;
truncate table output_tbl_tgt;
/
select actual_value
from input_src
where specification_mix like 'A%';
/
declare
begin
insert into output_tbl_tgt (select specification_mix,actual_value,
                                       case when specification_mix in ('Ash 12345 Mix','Ash ABC 124') then actual_value
                                       else 0
                                       end Ash_val,
                                       case when specification_mix in ('Moisture 1234 TY','Moistu wint Wheat') then actual_value
                                       else 0
                                       end moisture_val,
                                       case when specification_mix in ('Protein 12A') then actual_value
                                       else 0
                                       end protein_val 
                                       from input_src); 
                                       
  end;                                     
/
set serveroutput on;
/
select * from output_tbl_tgt;
/
select * from input_src;

























