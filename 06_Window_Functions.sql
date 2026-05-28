# =========================================================
# WINDOW FUNCTIONS (SESSION 7)
# =========================================================

use hr;


# -------------------------
# RANK FUNCTIONS
# -------------------------
select employee_id, salary,
rank() over(order by salary desc) as rnk
from employees;

select employee_id, salary,
dense_rank() over(order by salary desc) as rnk
from employees;


# -------------------------
# ROW NUMBER
# -------------------------
select employee_id, salary,
row_number() over(partition by department_id order by salary desc)
from employees;


# -------------------------
# LEAD / LAG
# -------------------------
select employee_id,
lag(hire_date) over(order by hire_date) as prev_date,
lead(hire_date) over(order by hire_date) as next_date
from employees;


# -------------------------
# NTILE / CUME_DIST
# -------------------------
select employee_id, salary,
ntile(4) over(order by salary) as quartile
from employees;


# -------------------------
# FIRST / LAST VALUE
# -------------------------
select employee_id, department_id, salary,
first_value(salary) over(partition by department_id order by hire_date) as first_salary
from employees;