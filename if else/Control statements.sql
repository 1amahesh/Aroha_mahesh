--1.Write a code to find maximum between two numbers
declare
a int(5):=10;
b int(5):=15;
begin
if a>b then
dbms_output.put_line(a || ' is a maximum number' );
else
dbms_output.put_line(b || ' is a maximum number');
end if;
end;
/

--2.Write a code to find maximum between three numbers
declare
a int(5):=10;
b int(5):=15;
c int(5):=30;
begin
if a>b and a>c then
dbms_output.put_line(a || ' is a maximum number' );
elsif b>a and b>c then
dbms_output.put_line(b || ' is a maximum number');
else
dbms_output.put_line(c || ' is a maximum number');
end if;
end;
/

--3.write a code to check whether a number is negative, possitive or not
declare
a int(5):=-15;
begin
if a>0 then
dbms_output.put_line(a || ' is a positive');
elsif a<0 then
dbms_output.put_line(a || ' is negative');
else
dbms_output.put_line(a || ' is  not');
end if;
end;
/

--4.write a program to check whether a number is divisable by 5 and 11 or not
declare
a int(5):=&a;
begin
if mod(a,5)=0 and mod(a,11)=0 then
dbms_output.put_line(a || ' is divisable by 5 and 11');
else
dbms_output.put_line(a || ' is not divisable by 5 and 11');
end if;
end;
/

--05.calculating profit or loss after inputting the CP and SP of the item
declare
sp int(10):=&sp;
cp int(20):=&cp;
begin
if sp>cp then
dbms_output.put_line(' profit');
else
dbms_output.put_line(' loss');
end if;
end;
/

--6.WAC to check whether a given alphabet is vowel or consonant
declare
a varchar2(20):=&a;
begin
if  a in ('a','e','i','o','u') then
dbms_output.put_line(a || ' is a vowel');
else
dbms_output.put_line(a || ' is consonant');
end if;
end;
/

--7.WAC to check whether a given character is alphabet, digit or special character
declare
a varchar2(20):=&a;
begin
if regexp_like(a,'[0-9]') then
dbms_output.put_line(a || ' is a number');
elsif regexp_like(a,'[a-z,A-Z]') then
dbms_output.put_line(a || ' is a character');
else 
dbms_output.put_line(a || ' is a special char');
end if;
end;
/

--8.input month number and print number of days in that month
declare
a int(5):=&a;
start_date date;
last_date date;
no_of_days int(5);
begin
start_date:=trunc(to_date(a,'mm'),'mm');
last_date:=add_months(start_date,1);
no_of_days:=last_date-start_date;
dbms_output.put_line(no_of_days);
end;
/


--9.Input angles of a triangle and check whether triangle is valid or not
declare
a int(3):=50;
b int(3):=70;
c int(3):=50;
begin
if a+b+c=180 and a<>0 and b<>0 and c<>0 then
dbms_output.put_line('triangle is valid ');
else
dbms_output.put_line('Triangle is invalid ');
end if;
end;
/

--10.Input all sides of a triangle and check whether triangle is valid or not
declare
ab int(3):=50;
bc int(3):=70;
ca int(3):=60;
begin
if  and ab+bc>ca and bc+ca>ab and ca+ab>ab then
dbms_output.put_line('triangle is valid');
else
dbms_output.put_line(' triangle is invalid');
end if;
end;
/

--11.check whether the triangle is equilateral, isosceles or scalene triangle
declare
ab int(5):=10;
bc int(5):=10;
ca int(5):=5;
begin 
if ab=bc and bc=ca  then 
dbms_output.put_line('equilateral triangle');
elsif ab<>bc and bc<>ca then
dbms_output.put_line('scalene triangle');
else
dbms_output.put_line('isosceles triangle');
end if;
end;
/

--12.input marks of five subjects Physics, Chemistry, Biology, Mathematics and Computer
/* If percentage &gt;= 90% : Grade A
If percentage &gt;= 80% : Grade B
If percentage &gt;= 70% : Grade C
If percentage &gt;= 60% : Grade D
If percentage &gt;= 40% : Grade E
If percentage &lt; 40% : Grade F */
declare
physics int(3):=&ph;
chemistry int(3):=&ch;
biology int(3):=&bi;
math int(3):=&ma;
computer int(3):=&com;
total_marks int(3):=500;
total_marks_gain int(3);
percentage int(3);
begin
total_marks:=sum(physics,chemistry,biology,math,computer);
percentage:=(total_marks_gain/total_marks)*100;
if percentage>=90 then
dbms_output.put_line(' Grade a');
if percentage>=80 then
dbms_output.put_line(' Grade b');
if percentage>=70 then
dbms_output.put_line(' Grade c');
if percentage>=60 then
dbms_output.put_line(' Grade d');
if percentage>=40 then
dbms_output.put_line(' Grade e');
else percentage<40 then
dbms_output.put_line(' Grade f');
end if;
end;
/
