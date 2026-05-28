# SQL FOR DATA ANALYTICS - QUICK NOTES & CHEATSHEET

This file is a compact revision sheet covering:
- SQL concepts
- Commands
- Joins
- Subqueries
- Window functions
- Constraints
- Transactions
- Interview patterns

# =========================================================
# 1. SQL COMMAND TYPES
# =========================================================

DDL (Data Definition Language)
- CREATE → create database/table
- ALTER → modify structure
- DROP → delete structure
- TRUNCATE → remove all data

DML (Data Manipulation Language)
- INSERT → add data
- UPDATE → modify data
- DELETE → remove data

DQL (Data Query Language)
- SELECT → retrieve data

TCL (Transaction Control Language)
- COMMIT → save changes
- ROLLBACK → undo changes

DCL (Data Control Language)
- GRANT → give permission
- REVOKE → remove permission



# =========================================================
# 2. SQL EXECUTION ORDER (VERY IMPORTANT)
# =========================================================

FROM
JOIN
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT



# =========================================================
# 3. FILTERING RULES (WHERE vs HAVING)
# =========================================================

WHERE:
- filters rows before grouping
- cannot use aggregate functions

HAVING:
- filters after GROUP BY
- used with aggregates



# =========================================================
# 4. JOINS CHEATSHEET
# =========================================================

INNER JOIN → matching rows only
LEFT JOIN → all left table + matched right
RIGHT JOIN → all right table + matched left
FULL JOIN → left + right (via UNION)
CROSS JOIN → cartesian product
SELF JOIN → table joins itself

JOIN SYNTAX:
SELECT *
FROM A
JOIN B
ON A.id = B.id



# =========================================================
# 5. SUBQUERIES TYPES
# =========================================================

Single Row Subquery:
- returns 1 value
- uses =, >, <

Multiple Row Subquery:
- returns list
- uses IN, NOT IN

Correlated Subquery:
- inner query depends on outer query

EXISTS:
- checks existence
- faster than IN in large datasets

ANY / ALL:
- ANY → at least one condition true
- ALL → all conditions must be true



# =========================================================
# 6. WINDOW FUNCTIONS
# =========================================================

Basic Syntax:
OVER(PARTITION BY col ORDER BY col)

Functions:

RANK()
- skips ranks (1,2,2,4)

DENSE_RANK()
- no skip (1,2,2,3)

ROW_NUMBER()
- unique numbering

LEAD()
- next row value

LAG()
- previous row value

NTILE(n)
- divides into n buckets

CUME_DIST()
- cumulative distribution



# =========================================================
# 7. TOP PATTERNS (INTERVIEW GOLD)
# =========================================================

-- Top N rows
ORDER BY column DESC
LIMIT N

-- Second highest salary
MAX < MAX pattern

-- Remove duplicates
DISTINCT

-- Handle NULL
COALESCE(), IFNULL()

-- Highest per group
Use RANK or DENSE_RANK + subquery



# =========================================================
# 8. CONSTRAINTS
# =========================================================

PRIMARY KEY → unique + not null
FOREIGN KEY → relationship between tables
UNIQUE → no duplicates
NOT NULL → mandatory value
CHECK → condition rule
DEFAULT → default value



# =========================================================
# 9. DATA INTEGRITY
# =========================================================

Entity Integrity → primary key
Referential Integrity → foreign key
Domain Integrity → valid values (CHECK)



# =========================================================
# 10. TRANSACTIONS (ACID)
# =========================================================

A → Atomicity → all or nothing
C → Consistency → valid state
I → Isolation → no interference
D → Durability → permanent after commit

Commands:
- COMMIT → save
- ROLLBACK → undo
- SAVEPOINT → partial rollback



# =========================================================
# 11. IMPORTANT FUNCTIONS SUMMARY
# =========================================================

Aggregate:
- COUNT, SUM, AVG, MIN, MAX

String:
- CONCAT, SUBSTR, LENGTH, UPPER, LOWER, REPLACE

Numeric:
- ABS, ROUND, CEIL, FLOOR, POWER, SQRT

Date:
- CURDATE, NOW, YEAR, MONTH, DATE_FORMAT, ADDDATE

Conditional:
- IF, CASE, IFNULL, COALESCE


# =========================================================
# 1. Difference between DELETE, DROP, TRUNCATE?
# =========================================================

DELETE:
- Removes specific rows using WHERE
- Can be rolled back
- Slower (row-by-row operation)

TRUNCATE:
- Removes ALL rows
- Cannot use WHERE
- Faster than DELETE
- Cannot rollback (in most DBs)

DROP:
- Removes entire table (structure + data)
- Irreversible

# =========================================================
# 2. WHERE vs HAVING?
# =========================================================

WHERE:
- Filters rows BEFORE grouping
- Cannot use aggregate functions

HAVING:
- Filters AFTER GROUP BY
- Used with aggregate functions

Example:
WHERE salary > 5000
HAVING AVG(salary) > 8000

# =========================================================
# 3. INNER JOIN vs LEFT JOIN?
# =========================================================

INNER JOIN:
- Returns only matching rows in both tables

LEFT JOIN:
- Returns all rows from LEFT table
- Matching rows from RIGHT table
- Non-matching values = NULL

# =========================================================
# 4. What is PRIMARY KEY?
# =========================================================

- Uniquely identifies each row in a table
- Cannot be NULL
- Cannot have duplicate values
- Only one primary key per table

Example:
PRIMARY KEY (id)

# =========================================================
# 5. What is FOREIGN KEY?
# =========================================================

- Creates relationship between two tables
- References PRIMARY KEY of another table
- Maintains referential integrity

Example:
FOREIGN KEY (dept_id) REFERENCES department(dept_id)


# =========================================================
# 6. What is Normalization?
# =========================================================

Normalization:
Process of organizing data to reduce redundancy and improve integrity.

Forms:
- 1NF → atomic values (no repeating groups)
- 2NF → no partial dependency
- 3NF → no transitive dependency

Goal:
- Reduce duplication
- Improve consistency
- Efficient database design

# =========================================================
# 7. RANK vs DENSE_RANK?
# =========================================================

RANK:
- Skips ranks after ties

Example:
1, 2, 2, 4

DENSE_RANK:
- No skipping of ranks

Example:
1, 2, 2, 3

# =========================================================
# 8. EXISTS vs IN?
# =========================================================

IN:
- Compares full result set
- Slower for large datasets

EXISTS:
- Checks existence only
- Stops when match found
- Faster in correlated queries

# =========================================================
# 9. What is Correlated Subquery?
# =========================================================

- Subquery that depends on outer query
- Executes once per row of outer query

Example:
SELECT *
FROM employees e1
WHERE salary >
(SELECT AVG(salary)
 FROM employees e2
 WHERE e1.department_id = e2.department_id);

# =========================================================
# 10. What is ACID?
# =========================================================

ACID ensures reliable database transactions:

A → Atomicity → All or nothing
C → Consistency → Valid state before & after
I → Isolation → No interference between transactions
D → Durability → Changes persist after commit

# =========================================================
# 11. What is a Window Function?
# =========================================================

Window function performs calculations across related rows
WITHOUT collapsing the result set.

Syntax:
OVER(PARTITION BY column ORDER BY column)

Examples:
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- LEAD()
- LAG()

Example:
SELECT employee_id,
       RANK() OVER(ORDER BY salary DESC)
FROM employees;

# =========================================================
# FINAL QUICK REVISION SUMMARY
# =========================================================

DELETE → remove selected rows
TRUNCATE → remove all rows
DROP → remove table

WHERE → before grouping
HAVING → after grouping

INNER JOIN → matching rows only
LEFT JOIN → all left + matched right

PRIMARY KEY → unique row identifier
FOREIGN KEY → relationship between tables

Normalization → remove redundancy

RANK vs DENSE_RANK → skip vs no skip

IN vs EXISTS → full scan vs existence check

Correlated subquery → depends on outer query

ACID → transaction reliability

Window function → analytics without grouping collapse