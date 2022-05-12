/
create or replace procedure sp_accounts(account_id in number,txn_type in varchar2,txn_amount in number) as
v_accno number(20);

begin
select count(acc_id) into v_accno
from accounts1
where acc_id=account_id;

if v_accno=1 then
  insert into transactions values(sq_moneytransfer.nextval,account_id,txn_type,txn_amount,sysdate);
  if txn_type='credit' then
  update accounts1 set balance=balance+txn_amount 
  where acc_id=account_id;
  end if;
else
dbms_output.put_line('account doesnot exist');
end if;
exception
when no_data_found then
DBMS_OUTPUT.PUT_LINE('no data found');
when others then
DBMS_OUTPUT.PUT_LINE(sqlcode ||' - '||SQLERRM);
end;
end;
/
exec sp_accounts(1002,'credit',7000);
  /
select * from accounts1;
desc accounts1;
/
select * from transactions;
/
