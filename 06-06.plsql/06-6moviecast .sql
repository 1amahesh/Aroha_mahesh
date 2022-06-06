 create table actor (
actor_id number(5) primary key,
actor_name varchar2(10),
gender varchar2(10),
dob date,
email varchar2(10),
phone number(12),
city varchar2(20),
start_date date);
INSERT INTO ACTOR VALUES(101,'RAMYA','F','20-03-1989','RAMA@.COM',8574375646,'BANGALORE','12-03-2016');

create table movie_type(
movie_type_id number(5) primary key,
movie_type_desc varchar2(30));

create table movie (
movie_id number(5) primary key,
movie_name varchar2(20),
release_date date,
movie_type_id number(5) references movie_type(movie_type_id));
desc role;
create table role(
role_id number(5) primary key,
actor_id number(5)references actor(actor_id),
movie_id number(5) references movie(movie_id),
start_date date,
end_date date,
role_desc varchar2(30));


INSERT INTO ACTOR VALUES(101,'RAMYA','F','20-03-1989','RAMA@GAMIL.COM',8574375646,'BANGALORE','12-03-2016');
INSERT INTO ACTOR VALUES(102,'NTR','M','12-03-1987','NTR2@G.COM',8574378646,'HYDERABAD','11-06-2006');
INSERT INTO ACTOR VALUES(103,'DEEPIKA','F','20-08-1976','DGAL.COM',89385443,'MUMBAI','27-07-2008');
INSERT INTO ACTOR VALUES(104,'PRAJWAL','M','20-10-1965','PR@IL.COM',857387746,'BANGALORE','22-08-2010');
INSERT INTO ACTOR VALUES(105,'MEGANA','F','20-12-1985','MEA@M.COM',857447646,'MYSORE','18-09-2003');
INSERT INTO ACTOR VALUES(106,'SUDEEP','M','20-04-1974','S@GA.COM',85743744,'HUBALI','05-10-2021');
INSERT INTO ACTOR VALUES(107,'PRIYANKA','F','20-07-1988','P@GAL.COM',857236498,'MANGALORE','11-12-2022');



insert into movie_type values(100,'action');
insert into movie_type values(101,'thriller');
insert into movie_type values(102,'romance');
insert into movie_type values(103,'comedy');
insert into movie_type values(104,'horror');
insert into movie_type values(105,'war');
insert into movie_type values(106,'history');
insert into movie_type values(107,'documentry');
insert into movie_type values(108,'science fiction');
insert into movie_type values(109,'biographical');
insert into movie_type values(110,'sports');


 insert into movie values(200,'kgf','21-dec-2018',100);
insert into movie values(201,'rrr','10-jan-2022',100);
insert into movie values(202,'pushpa','10-july-2021',100);
insert into movie values(203,'uturn','30-jun-2016',101);
insert into movie values(204,'vikram vedha','12-feb-2018',101);
insert into movie values(205,'drishya','01-may-2016',101);
insert into movie values(206,'premam','18-aug-2015',102);
insert into movie values(207,'magadheera','10-mar-2012',102);
insert into movie values(208,'adyaksha','05-sep-2015',103);
insert into movie values(209,'pizza','27-jul-2014',104);
insert into movie values(210,'bahubali','10-jun-2016',105);
insert into movie values(211,'sangolli rayanna','21-oct-2015',106);
insert into movie values(212,'sachinms','24-apr-2017',107);
insert into movie values(213,'ms dho stroy','7-jul-2017',109);
insert into movie values(214,'lagaan','04-mar-2001',110);

desc movie;


INSERT INTO ROLE VALUES(10,102, 200 ,'12-03-2001','22-04-2003','HERO');
INSERT INTO ROLE VALUES(11,105,  200,'12-03-2002','22-04-2005','SIDE ACTOR');
INSERT INTO ROLE VALUES(12,103,  202,'12-03-2007','22-04-2009','COMEDIAN');
INSERT INTO ROLE VALUES(13,107,  207,'12-03-2010','22-04-2012','HERO');
INSERT INTO ROLE VALUES(14,101, 203 ,'12-03-2020','22-04-2022','HEROIN');
INSERT INTO ROLE VALUES(15,102, 209 ,'12-03-2006','22-04-2012','TWIN CHARCATOR');