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
                                   employee_id   INT NOT NULL,
                                   project_id    INT NOT NULL,
                                   assigned_date DATE DEFAULT (CURRENT_DATE),
                                   PRIMARY KEY (employee_id, project_id),
                                   FOREIGN KEY (employee_id) REFERENCES employees(id),
                                   FOREIGN KEY (project_id)  REFERENCES projects(project_id)
);
-- 3. Populate Data
INSERT INTO departments (dept_name) VALUES ('IT'), ('HR'), ('Finance'), ('Engineering'), ('Marketing');

-- 2. Populate Assignments for all 10 Employees
-- We are mapping every Employee ID to a Project ID
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
                                                       (1, '2026-01-31', 85000.00),
                                                       (2, '2026-01-31', 75000.00),
                                                       (3, '2026-01-31', 82000.00),
                                                       (4, '2026-01-31', 105000.00),
                                                       (5, '2026-01-31', 62000.00),
                                                       (6, '2026-01-31', 98000.00),
                                                       (7, '2026-01-31', 68000.00),
                                                       (8, '2026-01-31', 92000.00),
                                                       (9, '2026-01-31', 58000.00),
                                                       (10, '2026-01-31', 110000.00);
-- 4. Verify
SELECT e.full_name, d.dept_name, e.role, p.amount as last_pay
FROM employees e
         JOIN departments d ON e.dept_id = d.dept_id
         JOIN payroll p ON e.id = p.emp_id;

INSERT INTO employee_projects (employee_id, project_id) VALUES
                                                            (1, 1), -- Aarav Sharma -> Cloud Migration
                                                            (2, 2), -- Priya Mehta -> HR Portal Redesign
                                                            (3, 3), -- Rohan Gupta -> Financial Audit 2026
                                                            (4, 1), -- Sanya Malhotra -> Cloud Migration
                                                            (5, 2), -- Vikram Singh -> HR Portal Redesign
                                                            (6, 1), -- Ananya Iyer -> Cloud Migration
                                                            (7, 3), -- Kabir Verma -> Financial Audit 2026
                                                            (8, 1), -- Ishani Kapoor -> Cloud Migration
                                                            (9, 2), -- Arjun Reddy -> HR Portal Redesign
                                                            (10, 3); -- Meera Joshi -> Financial Audit 2026
SELECT
    e.id AS 'Employee ID',
    e.full_name AS 'Full Name',
    p.project_name AS 'Project Name'
FROM employees e
         JOIN employee_projects ep ON e.id = ep.employee_id
         JOIN projects p ON ep.project_id = p.project_id
ORDER BY e.id;



SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM payroll;
SELECT * FROM employee_projects;