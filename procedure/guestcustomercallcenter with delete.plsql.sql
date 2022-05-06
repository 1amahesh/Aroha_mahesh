
create table GUESTS
(name varchar2(20),
PHONE number(10),
CITY varchar2(20),
PRO_FLG char(1));

insert into GUESTS (name,PHONE,CITY) values('rajesh',783738,'blr');
insert into GUESTS (name,PHONE,CITY) values('bala',78939,'chn');
insert into GUESTS (name,PHONE,CITY) values('arun',892393,'del');
insert into GUESTS (name,PHONE,CITY) values('john',770260,'blr');
insert into GUESTS (name,PHONE,CITY) values('gundu',77026089,'blr');
insert into GUESTS (name,PHONE,CITY) values('tom',8555900,'hyd');


create table CUSTOMER_GUEST
(C_ID number(4),
C_NM varchar2(20),
C_PHONE number(10),
C_CITY varchar2(20));

insert into CUSTOMER_GUEST values(1,'raj',12345,'blr');
insert into CUSTOMER_GUEST values(2,'rani',989734,'hyd');
insert into CUSTOMER_GUEST values(3,'kimm',878384,'chn');
insert into CUSTOMER_GUEST values(4,'rajesh',783738,'blr');
insert into CUSTOMER_GUEST values(6,'arun',892393,'del');

create table CALL_C
(CALL_ID number(10),
C_NM varchar2(20),
PHONE number(10),
CITY varchar2(20));

commit;
/

--1.Process all the Guest Records
declare
    cursor C_GUEST is select * from GUESTS; 
begin
    for i in C_GUEST loop
        DBMS_OUTPUT.PUT_LINE(i.name||','||i.PHONE||','||i.CITY);
    end loop;
end;
/

exec SP_TOP10_PRODUCTS;
/

create sequence SQ_GUESTS
start with 1
increment by 1
minvalue 0
maxvalue 100
nocycle;
/

--If the Guest name, phone and city exists in customer, then delete that record in Guest table.
--If that Guest does not exists, then insert that guest record to call table so that call center resources call them
--After inserting the Guest record into call table, update the pro_flg of Guest table  */
 
create or replace procedure SP_GUESTS as
cursor C_GUESTS is select name,PHONE,CITY,PRO_FLG from GUESTS for update;
A_CNT int(5);

begin
    for i in C_GUESTS loop
        select count(*) into A_CNT
        from CUSTOMER_GUEST
        where C_NM=i.name and C_PHONE=i.PHONE and C_CITY=i.CITY;
            if A_CNT=1 then
                
                delete from GUESTS
                where current of C_GUESTS;
                
            elsif i.PRO_FLG is null then
                insert into CALL_C  values(SQ_GUESTS.nextval,i.name,i.PHONE,i.CITY);
                update GUESTS
                set PRO_FLG='Y'
                where current of C_GUESTS;
            end if;
end loop;
commit;
exception
when no_data_found then
DBMS_OUTPUT.PUT_LINE('no data found');
when others then
DBMS_OUTPUT.PUT_LINE(sqlcode ||' - '||SQLERRM);
end;
/

exec SP_GUESTS; 
/

select * from CALL_C;
select * from GUESTS;
Guest-Customer--call.sql
displaying guest-customer--call.sql.