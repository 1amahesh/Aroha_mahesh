
--query to display customer who did 5 transaction in the current week

insert into transactions values(1101,1002,'credit',39999,'30-05-22');

select cust_name
from customer1 a,accounts1 b,transactions c
where a.cust_id=b.cust_id and b.acc_id=c.acc_id and to_char(txn_date,'w-yyyy')=to_char(sysdate,'w-yyyy');

--query to display customers who are from bangalore and have opened savings account on their birthday

select cust_name
from customer1 a,accounts1 b,transactions c
where a.cust_id=b.cust_id and b.acc_id=c.acc_id and acc_type='savings' and  cust_city='bangalore' and  to_char(acc_open_date,'dd-mm')=to_char(cust_dob,'dd-mm');

--query to display customers who did 3 transactions in the current month & previous month

select cust_name
from customer1 a,accounts1 b,transactions c
where a.cust_id=b.cust_id and b.acc_id=c.acc_id and to_char(txn_date,'mm-yyyy')=to_char(sysdate,'mm-yyyy')
group by cust_name, a.cust_id
having count(c.txn_id)>=3
intersect
select cust_name
from customer1 a,accounts1 b,transactions c
where a.cust_id=b.cust_id and b.acc_id=c.acc_id and to_char(txn_date,'mm-yyyy')=to_char(sysdate,'mm-yyyy')-1
group by cust_name, a.cust_id
having count(c.txn_id)>=3;

--query to display customer having atleast 5 accounts of the same type
select * from customer1;
select * from accounts1;
select * from transactions;

select cust_name
from customer1 a,accounts1 b
where a.cust_id=b.cust_id 
group by cust_name,acc_type
having count(acc_id)>1;

--query to display customers who have opened maximum number of accounts in the current month

select cust_name
from customer1 a,accounts1 b
where a.cust_id=b.cust_id and to_char(acc_open_date,'mm-yy')=to_char(sysdate,'mm-yy')
group by cust_name
having count(acc_id) in (select max(count(acc_id))
                    from accounts1
                    where to_char(acc_open_date,'mm-yy')=to_char(sysdate,'mm-yy')
                 group by cust_id);
