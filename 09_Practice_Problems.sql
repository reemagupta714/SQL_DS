# =========================================================
# PRACTICE PROBLEMS (WAQ / WAP) - SESSION 1 TO 8
# =========================================================
# NOTE:
# These are interview + revision focused questions
# Write solutions in SQL Workbench for practice
# =========================================================


# =========================================================
# SESSION 1 - BASICS + DDL
# =========================================================

# WAQ: Create a database and switch to it
create database pes_university;
use pes_university;

# WAQ: Create a table students with id and name
create table students(
student_id int,
student_name char(20)
);

# WAQ: Insert multiple records into students table
insert into students(student_id, student_name)
values (240, 'Mukesh'), (102, 'Ram'), (103, 'Prakash');

# WAQ: Remove all records but keep table structure
truncate table students;


# =========================================================
# SESSION 2 - CRUD + CONSTRAINTS
# =========================================================

# WAQ: Update email of customer with custId = 101
update customer
set email = 'c1@gmail.com'
where custId = 101;

# WAQ: Delete customer with custId = 103
delete from customer where custId = 103;

# WAQ: Rename column phone_no to mobile_no
alter table customer change phone_no mobile_no bigint;

# WAQ: Add a new column PAN after custId
alter table customer add pan varchar(10) after custId;

# WAQ: Rename table customer to customer_info
rename table customer to customer_info;

# WAQ: Create table with primary key, unique, not null, check, default
create table customer_master(
custid int primary key,
custname varchar(20) not null,
email varchar(20) unique,
age int check(age > 10),
active_status varchar(20) default 'no'
);


# =========================================================
# SESSION 3 - FILTERING + FUNCTIONS
# =========================================================

# WAQ: Display employee full name using CONCAT
select employee_id,
concat(first_name, ' ', last_name) as full_name
from employees;

# WAQ: Display employee name in lowercase
select employee_id,
lower(concat(first_name, ' ', last_name))
from employees;

# WAQ: Pad job_id to length 5 using LPAD
select lpad(job_id, 5, 'X') from employees;

# WAQ: Display employees hired in year 1996
select employee_id, hire_date
from employees
where year(hire_date) = 1996;

# WAQ: Calculate years since employee joined
select employee_id,
datediff(curdate(), hire_date)/360 as years_worked
from employees;

# WAQ: Get probation completion date (6 months after hire)
select employee_id,
adddate(hire_date, interval 6 month) as probation_date
from employees;

# WAQ: Format hire date as Month-Year
select employee_id,
date_format(hire_date, '%M-%Y') as hire_month
from employees;


# =========================================================
# SESSION 4 - CONDITIONAL LOGIC + AGGREGATION
# =========================================================

# WAQ: Replace NULL commission with 0.02
select employee_id,
ifnull(commission_pct, 0.02)
from employees;

# WAQ: Salary bucket using IF
select employee_id, salary,
if(salary >= 1000, 'highly paid', 'moderately paid')
from employees;

# WAQ: Salary classification using CASE
select employee_id, salary,
case
when salary < 5000 then 'low'
when salary between 5000 and 10000 then 'medium'
else 'high'
end as salary_bucket
from employees;

# WAQ: Bonus calculation based on salary slabs
select employee_id, salary,
case
when salary > 20000 then salary * 0.1
when salary > 10000 then salary * 0.2
when salary > 5000 then salary * 0.25
else salary * 0.3
end as bonus
from employees;

# WAQ: Total pay = salary + commission
select employee_id, salary,
salary + coalesce(commission_pct, 0) as total_pay
from employees;

# WAQ: Count employees per department
select department_id, count(*)
from employees
group by department_id;

# WAQ: Count employees per manager
select manager_id, count(*)
from employees
group by manager_id;

# WAQ: Count employees hired per year
select year(hire_date), count(*)
from employees
group by year(hire_date);

# WAQ: Top 10 highest salaries
select salary
from employees
order by salary desc
limit 10;


# =========================================================
# SESSION 5 - JOINS
# =========================================================

# WAQ: Join employees and departments
select employee_id, department_name, salary
from employees e
join departments d
on e.department_id = d.department_id;

# WAQ: Employees with department and city
select employee_id, department_name, city
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

# WAQ: Departments with no employees
select *
from departments d
left join employees e
on d.department_id = e.department_id;

# WAQ: Full join simulation
select * from employees e
left join departments d on e.department_id = d.department_id
union
select * from employees e
right join departments d on e.department_id = d.department_id;

# WAQ: Employees and their managers (self join)
select emp.employee_id, emp.salary, mgr.salary
from employees emp
join employees mgr
on emp.manager_id = mgr.employee_id;

# WAQ: Employees earning more than their manager
select emp.employee_id
from employees emp
join employees mgr
on emp.manager_id = mgr.employee_id
where emp.salary > mgr.salary;


# =========================================================
# SESSION 6 - SUBQUERIES
# =========================================================

# WAQ: Employees with highest salary
select * from employees
where salary = (select max(salary) from employees);

# WAQ: Employees above average salary
select * from employees
where salary > (select avg(salary) from employees);

# WAQ: Second highest salary
select * from employees
where salary = (
select max(salary)
from employees
where salary < (select max(salary) from employees)
);

# WAQ: Departments with no employees
select department_name
from departments
where department_id not in (
select department_id from employees
where department_id is not null
);


# =========================================================
# SESSION 7 - WINDOW FUNCTIONS
# =========================================================

# WAQ: Rank employees by salary
select employee_id, salary,
rank() over(order by salary desc)
from employees;

# WAQ: Dense rank by salary
select employee_id, salary,
dense_rank() over(order by salary desc)
from employees;

# WAQ: Highest paid employee per department
select * from (
select employee_id, department_id, salary,
dense_rank() over(partition by department_id order by salary desc) as rnk
from employees
) t
where rnk = 1;

# WAQ: Next hire date using LEAD
select employee_id,
lead(hire_date) over(order by hire_date)
from employees;

# WAQ: Previous hire date using LAG
select employee_id,
lag(hire_date) over(order by hire_date)
from employees;


# =========================================================
# SESSION 8 - CASE STUDY QUESTIONS
# =========================================================

# WAQ: Country wise customer count
select Country, count(Id)
from customer
group by Country;

# WAQ: Products not discontinued
select * from product
where isDiscontinued = 0;

# WAQ: Customers from Mexico
select * from customer
where Country = 'Mexico';

# WAQ: Costliest product ordered
select *
from product
order by UnitPrice desc
limit 1;

# WAQ: Suppliers by country count
select Country, count(*)
from supplier
group by Country
order by count(*) desc;

# WAQ: Customers who did not place any order
select *
from customer
where Id not in (select CustomerId from orders);