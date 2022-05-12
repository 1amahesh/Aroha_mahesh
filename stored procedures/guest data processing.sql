Create table guests
(name varchar2(20),
Phone number(10),
City varchar2(20),
Pro_flg char(1));

insert into guests (name,phone,city) values('rajesh',783738,'blr');
insert into guests (name,phone,city) values('bala',78939,'chn');
insert into guests (name,phone,city) values('arun',892393,'del');
insert into guests (name,phone,city) values('john',770260,'blr');
insert into guests (name,phone,city) values('gundu',77026089,'blr');
insert into guests (name,phone,city) values('tom',8555900,'hyd');


Create table customer_guest
(c_id number(4),
c_nm varchar2(20),
c_phone number(10),
c_city varchar2(20));

insert into customer_guest values(1,'raj',12345,'blr');
insert into customer_guest values(2,'rani',989734,'hyd');
insert into customer_guest values(3,'kimm',878384,'chn');
insert into customer_guest values(4,'rajesh',783738,'blr');
insert into customer_guest values(6,'arun',892393,'del');

create table call
(call_id number(10),
c_nm varchar2(20),
phone number(10),
city varchar2(20));

