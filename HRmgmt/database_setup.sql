CREATE DATABASE IF NOT EXISTS cse250_hr;
USE cse250_hr;

-- 1. Setup Database
DROP DATABASE IF EXISTS cse250_hr;
CREATE DATABASE IF NOT EXISTS cse250_hr;
USE cse250_hr;

-- 2. Create Tables
CREATE TABLE departments (
                             dept_id INT PRIMARY KEY AUTO_INCREMENT,
                             dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
                           id INT PRIMARY KEY AUTO_INCREMENT,
                           full_name VARCHAR(100) NOT NULL,
                           role VARCHAR(50),
                           dept_id INT,
                           salary DECIMAL(10, 2),
                           FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE projects (
                          project_id INT PRIMARY KEY AUTO_INCREMENT,
                          project_name VARCHAR(100) NOT NULL,
                          budget DECIMAL(15, 2)
);

CREATE TABLE payroll (
                         transaction_id INT PRIMARY KEY AUTO_INCREMENT,
                         emp_id INT,
                         payment_date DATE,
                         amount DECIMAL(10, 2),
                         FOREIGN KEY (emp_id) REFERENCES employees(id)
);

CREATE TABLE employee_projects (
                                   emp_id INT,
                                   project_id INT,
                                   PRIMARY KEY (emp_id, project_id),
                                   FOREIGN KEY (emp_id) REFERENCES employees(id),
                                   FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- 3. Populate Data
INSERT INTO departments (dept_name) VALUES ('IT'), ('HR'), ('Finance'), ('Engineering'), ('Marketing');

INSERT INTO employees (full_name, role, dept_id, salary) VALUES
                                                             ('Aarav Sharma', 'Software Engineer', 1, 85000.00),
                                                             ('Priya Mehta', 'HR Manager', 2, 75000.00),
                                                             ('Rohan Gupta', 'Financial Analyst', 3, 82000.00),
                                                             ('Sanya Malhotra', 'System Architect', 1, 105000.00),
                                                             ('Vikram Singh', 'Recruitment Specialist', 2, 62000.00),
                                                             ('Ananya Iyer', 'Data Scientist', 1, 98000.00),
                                                             ('Kabir Verma', 'Accountant', 3, 68000.00),
                                                             ('Ishani Kapoor', 'DevOps Engineer', 1, 92000.00),
                                                             ('Arjun Reddy', 'Employee Relations', 2, 58000.00),
                                                             ('Meera Joshi', 'Portfolio Manager', 3, 110000.00);

INSERT INTO projects (project_name, budget) VALUES
                                                ('Cloud Migration', 500000.00),
                                                ('HR Portal Redesign', 150000.00),
                                                ('Financial Audit 2026', 75000.00);

# INSERT INTO employee_projects (emp_id, project_id) VALUES (1, 1), (2, 2), (3, 3), (4, 1), (6, 1);

INSERT INTO payroll (emp_id, payment_date, amount) VALUES
                                                       (4, '2026-01-31', 105000.00), (5, '2026-01-31', 62000.00), (6, '2026-01-31', 98000.00),
                                                       (7, '2026-01-31', 68000.00), (8, '2026-01-31', 92000.00), (9, '2026-01-31', 58000.00),
                                                       (10, '2026-01-31', 110000.00);
-- 4. Verify
SELECT e.full_name, d.dept_name, e.role, p.amount as last_pay
FROM employees e
         JOIN departments d ON e.dept_id = d.dept_id
         JOIN payroll p ON e.id = p.emp_id;

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM payroll;
# SELECT * FROM employee_projects;