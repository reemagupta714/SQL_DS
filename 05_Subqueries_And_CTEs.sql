# =========================================================
# SUBQUERIES + CTEs (SESSION 6 & 7)
# =========================================================

use hr;


# -------------------------
# SINGLE ROW SUBQUERY
# -------------------------
select * from employees
where salary = (select max(salary) from employees);


# -------------------------
# MULTI ROW SUBQUERY
# -------------------------
select * from departments
where department_id in (select department_id from employees);


# -------------------------
# CORRELATED SUBQUERY
# -------------------------
select * from employees e
where salary >
(select avg(salary) from employees e1 where e1.department_id = e.department_id);


# -------------------------
# ANY / ALL
# -------------------------
select * from employees
where salary > any (select salary from employees where department_id = 50);

select * from employees
where salary > all (select salary from employees where department_id = 50);


# -------------------------
# EXISTS / NOT EXISTS
# -------------------------
select department_name
from departments d
where not exists (
select 1 from employees e
where e.department_id = d.department_id
);


# -------------------------
# CTE
# -------------------------
with cte as (
select department_id, avg(salary) as avg_salary
from employees group by department_id
)
select * from cte;