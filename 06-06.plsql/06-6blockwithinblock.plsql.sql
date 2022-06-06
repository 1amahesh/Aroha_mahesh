create or replace procedure sp_guestt_cust_call1 as

cursor c_call_guest is select * from guests_input;
    v_name varchar2(20);
    v_phone varchar2(20);
    v_city varchar2(20);
begin

   for i in c_call_guest loop
   
   
                       begin
                       
                            select c_nm,c_phone,v_city into v_name,v_phone,v_city
                            from customer_guest_chek
                            where c_nm=i.name and c_phone=i.phone  and c_city=i.city;

                            delete from guests_input
                            where name=i.name and phone=i.phone and city=i.city ;
                            
                      exception
                         when no_data_found then
                         dbms_output.put_line(v_name ||'no such name found');
                         insert into call_tgt values(call_guest.nextval,i.name,i.phone,i.city);
                          update guests_input set pro_flg='y'
                          where name=i.name and phone=i.phone and city=i.city ;
                      end;
   
  end loop;
  
exception
when others then
rollback;
     raise_application_error(-20001,'program execution failed for other reason');

end;
/
exec sp_guestt_cust_call1;
/
create sequence call_guest;
select * from call_tgt;
select * from guests_input;
truncate table guests_input;
select * from customer_guest_chek;

insert into guests_input values('mohan','8123280899','mglr','n');
/
set SERVEROUTPUT ON;