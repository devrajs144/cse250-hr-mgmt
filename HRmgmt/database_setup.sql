-- 1. Create the project database
CREATE DATABASE IF NOT EXISTS cse250_hr;

-- 2. Select it for use
USE cse250_hr;

-- 3. Create an employee table
CREATE TABLE IF NOT EXISTS employees (
                                         id INT PRIMARY KEY AUTO_INCREMENT,
                                         full_name VARCHAR(100) NOT NULL,
                                         role VARCHAR(50),
                                         department VARCHAR(50),
                                         salary DECIMAL(10, 2)
);

-- 4. Add a test record
INSERT INTO employees (full_name, role, department, salary)
VALUES ('Dvij Desai', 'System Admin', 'IT', 95000.00);

-- 5. View the data
SELECT * FROM employees;