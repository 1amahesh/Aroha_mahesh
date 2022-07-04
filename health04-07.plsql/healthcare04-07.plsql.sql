--1. Find all the patients who are treated in the first week of this month.
  
/
select p.fname,p.lname,c.admission_date
from patient p,case c
where p.pat_id=c.pat_id and to_char(admission_date,'w-yy')=to_char(sysdate,'w-yy');
/
select p.fname,p.lname,c.admission_date
from patient p,case c
where p.pat_id=c.pat_id and  to_char(admission_date,'w')=2 and to_char(admission_date,'mm')=to_char(sysdate ,'mm')-1
and to_char(admission_date,'yy')=  to_char(sysdate,'yy');
/
update case set admission_date='01-07-2022'
where doc_id ='d3';

insert into case values('14-08-2022','p5','d3','fever');
desc case;


    
--2. Find all the doctors who have more than 3 admissions today

/
select  d.fname,d.lname
from doctor d,case c
where d.doc_id=c.doc_id and to_char(admission_date,'dd-mm-yy') = to_char(sysdate,'dd-mm-yy')
group by fname,lname
having count(c.admission_date)>3;
/
--3. Find the patient name (first,last) who got admitted today where the doctor is ‘TIM’

 /                          
select fname,lname
from patient
where   pat_id in (select pat_id
                    from doctor d,case c
                    where d.doc_id=c.doc_id and to_char(admission_date,'dd-mm-yy')=to_char(sysdate,'dd-mm-yy') and d.fname='arun' 
                    and d.lname ='patel');
                           /
                           
--4. Find the Doctors whose phone numbers were not update (phone number is null)
select * from doctor;
select * from patient;
select * from case;
insert into patient values('p6','an','kumar','n',null);
/
select fname,lname
from patient
where phone is null;

/

--5. Display the doctors whose specialty is same as Doctor ‘TIM’

select  fname,lname
from doctor
where specialty in  (select specialty
                            from doctor
                            where fname='tim');

update doctor set specialty='general'
where doc_id='d3';


--6. Find out the number of cases monthly wise for the current year

 select to_char(admission_date,'mon'),diagnosis
 from case
 where to_char(admission_date,'yy')=to_char(sysdate,'yy')
 group by to_char(admission_date,'mon'),diagnosis;

--7. Display the doctors who don’t have any cases registered this week

/
         select fname         
          from doctor
          where  doc_id  not in  (select distinct doc_id
                            from case
                             where to_char(admission_date,'w-mm-yy')=to_char(sysdate,'w-mm-yy'));

update case set admission_date='01-01-2022'
where pat_id ='p1';
select to_char(add_months(sysdate ,5+level),'mon')
from dual
connect by level<=12;



--8. Display Doctor Name, Patient Name, Diagnosis for all the admissions which happened on 1 st of
--Jan this year

/
select d.fname,p.fname,c.diagnosis
from doctor d,patient p,case c
where d.doc_id=c.doc_id and p.pat_id=c.pat_id
and admission_date=trunc(sysdate,'yy');
/
--9. Display Doctor Name, patient count based on the cases registered in the hospital.
select * from doctor;
select * from patient;
select * from case;


select count(p1)


--10. Display the Patient_name, phone, insurance company, insurance code (first 3 characters of
--insurance company)
select * from doctor;
select * from patient;
select * from case;

  select fname,lname,phone,ins_comp
  from patient;
  
--11. Create a view which gives the doctors whose specialty is ‘ORTHO’ and call it as ortho_doctors

create view view_doctor1 as(select fname
                            from doctor
                            where specialty='ortho');
                            
                            select * from  view_doctor1;
                            
    
select substr('aroha',level,1) 
from dual
connect by level <=length('aroha');

a
ar
aro
aroh
aroha

select substr('aroha',1,level)
from dual 
connect by level<=length('aroha');

/
declare
x varchar(20):='aroha';
v_sub varchar(20);
begin
for i in 1..length(x) loop
v_sub:= substr(x,1,i);
dbms_output.put_line(v_sub);
end loop;
--dbms_output.put_line(v_sub);
end;
  /   
  set serveroutput on;
            
  select to_char(sysdate +level-1,'day-mm-yy')  
  from dual
  connect by level<=10;