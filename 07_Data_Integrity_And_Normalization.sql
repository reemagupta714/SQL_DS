-- 07_Data_Integrity_And_Normalization.sql
-- Data integrity and normalization principles

-- Example constraints
ALTER TABLE employees
ADD CONSTRAINT chk_salary_positive CHECK (salary >= 0);

-- Normalized table design example
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    unit_price DECIMAL(10,2)
);
