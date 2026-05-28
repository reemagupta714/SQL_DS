# =========================================================
# CRUD OPERATIONS + FILTERING (SESSION 2 + HR QUERIES)
# =========================================================

# -------------------------
# CREATE TABLE + INSERT
# -------------------------
create table customer(
custId int,
custName varchar(10),
phone_no int,
email varchar(20)
);

insert into customer values
(101, 'Ravi', 999999, 'ravi@gmail.com'),
(103, 'shyam', 555555, 'shyam@gmail.com'),
(104, 'Mohan', 45678, 'mohan33@gmail.com');


# -------------------------
# UPDATE + DELETE
# -------------------------
set SQL_SAFE_UPDATES=0;

update customer
set email = 'ci@gmail.com'
where custId = 101;

delete from customer where custId=103;


# -------------------------
# ALTER TABLE OPERATIONS
# -------------------------
Alter table customer change phone_no mobile_no bigint;
Alter table customer add pan varchar(10) after custId;
Alter table customer modify mobile_no varchar(20);

rename table customer to customer_info;


# =========================================================
# HR SCHEMA FILTERING (WHERE CLAUSE PRACTICE)
# =========================================================

use hr;

# -------------------------
# BASIC FILTERS
# -------------------------
select * from employees where salary > 10000;
select * from employees where salary < 5000;

select * from employees where job_id = 'IT_PROG';
select * from employees where job_id != 'IT_PROG';


# -------------------------
# DATE FILTERING
# -------------------------
select * from employees where hire_date > '1997-06-25';


# -------------------------
# BETWEEN / IN / LOGICAL OPS
# -------------------------
select * from employees where hire_date between '1989-09-21' and '1997-06-25';

select * from employees where department_id in (60, 100, 10);
select * from employees where job_id in ('IT_PROG', 'FI_ACCOUNT');

select * from employees where department_id = 60 and salary > 3000;
select * from employees where department_id = 10 or salary > 3000;


# -------------------------
# NULL CHECKS
# -------------------------
select * from employees where manager_id is null;
select * from employees where manager_id is not null;


# -------------------------
# LIKE PATTERN MATCHING
# -------------------------
select * from employees where first_name like 'd%';
select * from employees where first_name like 'd____';
select * from employees where first_name like '%e';
select * from employees where job_id like '%vp%';


# -------------------------
# DISTINCT VALUES
# -------------------------
select distinct department_id from employees;
select distinct job_id from employees;