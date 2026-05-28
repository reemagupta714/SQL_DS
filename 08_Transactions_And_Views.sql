# =========================================================
# VIEWS + TRANSACTIONS (SESSION 7)
# =========================================================

use hr;


# -------------------------
# VIEW CREATION
# -------------------------
create view table_view1 as
select employee_id, hire_date
from employees;


select * from table_view1;