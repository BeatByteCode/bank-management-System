create table customer_details(cust_id number(20) PRIMARY KEY NOT NULL,cust_fname varchar(15),cust_lname varchar(15),cust_password varchar(20),cust_addr1 varchar(30),cust_addr2 varchar(30),cust_pincode number(6),cust_city varchar(20),cust_state varchar(20));

create table transactions(trans_no number(20) PRIMARY KEY NOT NULL,trans_date date,trans_type varchar(70),amount number(20,3),acc_no number(20) REFERENCES accounts(acc_no),to_acc number(20));

create table accounts(acc_no number(20) PRIMARY KEY NOT NULL, acc_type varchar(7),openedDate date,balance number(20,3),cust_id number(20) REFERENCES customer_details(cust_id),closing_date date,status varchar(8));
create table saving_account(acc_no number(20),withdrawCount number(5),cust_id number(20));
create table current_account(acc_no number(20),cust_id number(20));

create table fixed_deposit(f_no number(20)PRIMARY KEY NOT NULL , acc_no number(20) REFERENCES accounts(acc_no),amount number(20,3),terms number(5), cust_id number(20) REFERENCES customer_details(cust_id));
create table loan(l_no number(20) PRIMARY KEY NOT NULL ,acc_no number(20) REFERENCES accounts(acc_no),amount number(20,3),terms number(5),cust_id number(20) REFERENCES customer_details(cust_id));

select * from customer_details;
select * from accounts;
select * from transactions;
select * from saving_account;
select * from current_account;
select * from fixed_deposit;
select * from loan;

select fd.cust_id, cd.cust_fname,cd.cust_lname,fd.amount from
fixed_deposit fd inner join customer_details cd on fd.cust_id=cd.cust_id where fd.amount = 6200;

delete from customer_details;
drop table customer_details;
drop table transactions;
drop table accounts;
drop table saving_account;
drop table current_account;
drop table loan;
drop table fixed_deposit;