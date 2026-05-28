# =========================================================
# JOINS - SESSION 5 & 6
# =========================================================

use hr;


# -------------------------
# INNER JOIN
# -------------------------
select department_name, employee_id, salary
from employees e
join departments d
on e.department_id = d.department_id;


# -------------------------
# MULTI TABLE JOIN
# -------------------------
select employee_id, department_name, city, salary
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;


# -------------------------
# LEFT JOIN
# -------------------------
select employee_id, department_name
from employees e
left join departments d
on e.department_id = d.department_id;


# -------------------------
# RIGHT JOIN
# -------------------------
select employee_id, salary, department_name
from employees e
right join departments d
on e.department_id = d.department_id;


# -------------------------
# FULL JOIN (SIMULATED)
# -------------------------
select employee_id, department_name
from employees e
left join departments d on e.department_id = d.department_id

union

select employee_id, department_name
from employees e
right join departments d on e.department_id = d.department_id;


# -------------------------
# SELF JOIN
# -------------------------
select emp.employee_id as emp_id,
emp.salary as emp_sal,
mgr.salary as mgr_sal
from employees emp
join employees mgr
on emp.manager_id = mgr.employee_id;


# -------------------------
# JOIN WITH GROUP BY
# -------------------------
select d.department_name, count(employee_id) as emp_count
from employees e
join departments d
on e.department_id = d.department_id
group by d.department_name;