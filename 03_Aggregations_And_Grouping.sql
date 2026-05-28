# =========================================================
# AGGREGATIONS + GROUP BY + HAVING (SESSION 4 + 5)
# =========================================================

use hr;


# -------------------------
# AGGREGATE FUNCTIONS
# -------------------------
select min(salary), max(salary), avg(salary)
from employees;

select min(salary), max(salary), round(avg(salary))
from employees where department_id = 90;


# -------------------------
# GROUP BY BASICS
# -------------------------
select department_id, count(*) as cnt
from employees
group by department_id;


# -------------------------
# HAVING FILTERING
# -------------------------
select department_id, count(*) as cnt
from employees
group by department_id
having cnt > 20;


# -------------------------
# ORDER OF EXECUTION NOTES
# -------------------------
# from → where → group by → having → select → order by → limit


# -------------------------
# UNION / UNION ALL
# -------------------------
select min(salary), max(salary), avg(salary), 'overall'
from employees

union

select min(salary), max(salary), avg(salary), '90'
from employees where department_id = 90;


# -------------------------
# SET DIFFERENCE BEHAVIOR
# -------------------------
-- UNION removes duplicates
-- UNION ALL keeps duplicates