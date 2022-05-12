--Pre-defined exception or system defined ecxeptions
--1.DUP_VAL_ON_INDEX
begin
insert into product values(108,'soap','STATIONARY',20,15,'03-02-2020');
exception
when dup_val_on_index then
dbms_output.put_line('data exists');
end;
/

--2.N0_DATA_FOUND 
declare
a varchar2(20);
begin
select p_name into a
from product
where p_id=110;
exception
when no_data_found then
dbms_output.put_line('PRODUCT NOT EXISTS');
end;
/

--3.TOO many_rows
declare
a product.p_name%type;
begin
select p_name into a
from product
where p_family='computer';
dbms_output.put_line(a);
exception
when too_many_rows then
dbms_output.put_line('too many values');
end;
/

--4.ZERO_DIVIDE
declare
a int(5):=6;
b int(5):=0;
c int(5);
begin
c:=a/b;
dbms_output.put_line('C = ' ||c);
exception
when zero_divide then
dbms_output.put_line('YOU ARE TRYING TO DIVIDE BY ZERO,CHANGE THE VALUE.');
end;
/

--5.INVALID_CURSOR
declare
    cursor c1 is select * from product;
    v_prod product%rowtype;
begin
    loop
    fetch c1 into v_prod;
    exit when c1%notfound;
    dbms_output.put_line(v_prod.p_name);
    end loop;
exception
    when invalid_cursor then
    dbms_output.put_line('cursor not opened');
end;
/

--6.VALUE_ERROR
declare
a int(20);
begin
    select p_name into a
    from product
    where p_id=102;
        dbms_output.put_line('PRODUCT NAME IS ' || a);
exception
    when value_error then
        dbms_output.put_line('data type mis match');
end;
/

--7.invalid number
begin
    update product
    set price='978actCX'
    where p_id=102;
exception
    when invalid_number then
    dbms_output.put_line('ENTER NUMBERS ONLY');
end;
/

--8.cursor already open
declare
    cursor c1 is select * from product;
    cursor c2 is select * from customer;
    v_prod product%rowtype;
begin
    open c1; 
    loop
    fetch c1 into v_prod;
    exit when c1%notfound;
    open c2;
    dbms_output.put_line(v_prod.p_name);
    end loop;
    close c1;
    end;
    /
exception
    when cursor_already_open then
    dbms_output.put_line('YOU OPENED CURSOR INSIDE ANOTHER CURSOR');
end;
/

