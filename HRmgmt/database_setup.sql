DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
-- 1. Setup Database
CREATE DATABASE IF NOT EXISTS cse250_hr;
USE cse250_hr;

-- 2. Create Departments table
CREATE TABLE IF NOT EXISTS departments (
                                           dept_id INT PRIMARY KEY AUTO_INCREMENT,
                                           dept_name VARCHAR(50) NOT NULL
);

-- 3. Create Employees table
CREATE TABLE IF NOT EXISTS employees (
                                         id INT PRIMARY KEY AUTO_INCREMENT,
                                         full_name VARCHAR(100) NOT NULL,
                                         role VARCHAR(50),
                                         dept_id INT,
                                         salary DECIMAL(10, 2),
                                         FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- 4. Populate Data
INSERT IGNORE INTO departments (dept_name) VALUES ('IT'), ('HR'), ('Finance');

INSERT IGNORE INTO employees (full_name, role, dept_id, salary) VALUES
                                                                    ('Aarav Sharma', 'Software Engineer', 1, 85000.00),
                                                                    ('Priya Mehta', 'HR Manager', 2, 75000.00),
                                                                    ('Rohan Gupta', 'Financial Analyst', 3, 82000.00),
                                                                    ('Sanya Malhotra', 'System Architect', 1, 105000.00),
                                                                    ('Vikram Singh', 'Recruitment Specialist', 2, 62000.00),
                                                                    ('Ananya Iyer', 'Data Scientist', 1, 98000.00),
                                                                    ('Kabir Verma', 'Accountant', 3, 68000.00),
                                                                    ('Ishani Kapoor', 'DevOps Engineer', 1, 92000.00),
                                                                    ('Rahul Reddy', 'Employee Relations', 2, 58000.00),
                                                                    ('Meera Joshi', 'Portfolio Manager', 3, 110000.00);

SELECT * FROM employees;