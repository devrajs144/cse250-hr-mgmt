# HR Management System (CSE250)

## Project Overview

The HR Management System is a relational database project developed using MariaDB.  
The database used in this project is:

cse250_hr

This system manages structured HR data including departments, employees, projects, and payroll transactions.

The project demonstrates practical implementation of:

- Database creation and deletion
- Table creation with primary and foreign keys
- One-to-many relationships
- Data insertion
- SQL JOIN queries for verification

---

## Database Setup

```sql
CREATE DATABASE IF NOT EXISTS cse250_hr;
USE cse250_hr;
```

The database is dropped and recreated to ensure a clean environment before execution.

---

## Tables and Structure

The system consists of four main tables:

1. departments  
2. employees  
3. projects  
4. payroll  

---

### 1. departments

Stores department information.

**Attributes:**

- dept_id (INT, Primary Key, AUTO_INCREMENT)
- dept_name (VARCHAR(50), NOT NULL)

This table categorizes employees into different departments.

---

### 2. employees

Stores employee details.

**Attributes:**

- id (INT, Primary Key, AUTO_INCREMENT)
- full_name (VARCHAR(100), NOT NULL)
- role (VARCHAR(50))
- dept_id (INT, Foreign Key → departments.dept_id)
- salary (DECIMAL(10,2))

Each employee belongs to one department through the foreign key relationship.

---

### 3. projects

Stores project details handled by the organization.

**Attributes:**

- project_id (INT, Primary Key, AUTO_INCREMENT)
- project_name (VARCHAR(100), NOT NULL)
- budget (DECIMAL(15,2))

This table tracks project names and allocated budgets.

---

### 4. payroll

Stores payroll transaction records.

**Attributes:**

- transaction_id (INT, Primary Key, AUTO_INCREMENT)
- emp_id (INT, Foreign Key → employees.id)
- payment_date (DATE)
- amount (DECIMAL(10,2))

Each payroll entry corresponds to a specific employee and payment date.

---

## Relationships

- One department → Many employees
- One employee → Many payroll transactions

Foreign key constraints ensure:

- Referential integrity
- Data consistency
- Prevention of orphan records

---

## Data Population

Sample data is inserted into:

- departments
- employees
- projects
- payroll

This enables testing of relational queries and JOIN operations.

---

## Verification Query

```sql
SELECT e.full_name, d.dept_name, e.role, p.amount as last_pay
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN payroll p ON e.id = p.emp_id;
```

Additional verification:

```sql
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM payroll;
```

---

## Key Concepts Implemented

- Primary Keys
- Foreign Keys
- One-to-Many Relationship
- SQL JOIN operations
- Auto Increment fields
- Decimal and Date datatypes

---

## Technologies Used

- Database: MariaDB
- Language: SQL
- IDE: IntelliJ IDEA
- Version Control: Git & GitHub

---

## Authors

- Devraj Sangharajka (AU2420181)
- Dvij Desai (AU2420139)
