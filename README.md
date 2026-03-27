# 🗂️ HR Management System — CSE250

The HR Management System is a relational database project built using **MariaDB** as part of the CSE250 Database Management Systems course. The goal of this project is to simulate a real-world organizational HR workflow — tracking which employees belong to which departments, what projects they are assigned to, and how their salaries are processed through payroll. The system is designed to reflect how an actual company might structure and query its HR data, with proper relationships, constraints, and data integrity enforced at the database level.

---

## 📌 Overview

**Database:** `cse250_hr`

The database consists of **5 tables** that together capture the full HR lifecycle of an organization — from department structure and employee records, to project assignments and salary transactions. Every table is connected through foreign keys, ensuring that data remains consistent and no orphan records can exist.

The project demonstrates:
- Designing a normalized relational schema
- Enforcing one-to-many and many-to-many relationships
- Using primary keys, foreign keys, and auto-increment fields
- Populating and querying data using SQL JOINs

---

## 🛠️ Technologies Used

| Tool | Purpose |
|------|---------|
| MariaDB | Relational database engine |
| SQL | Schema definition & data manipulation |
| IntelliJ IDEA | IDE for writing and running SQL scripts |
| Git & GitHub | Version control and project submission |

---

## 📋 Table Descriptions

### 🏢 1. `departments`

Organizes the company into distinct functional units such as IT, HR, Finance, and Engineering. Every employee in the system belongs to one of these departments, making this the top-level entity in the hierarchy.

| Column | Data Type | Constraint | Description |
|--------|-----------|------------|-------------|
| `dept_id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Unique identifier for each department |
| `dept_name` | `VARCHAR(50)` | `NOT NULL` | Name of the department |

---

### 👤 2. `employees`

The central table of the system. Stores personal and professional details of every employee, including their role, the department they belong to, and their base salary. This table connects outward to both payroll and project assignment records.

| Column | Data Type | Constraint | Description |
|--------|-----------|------------|-------------|
| `id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Unique identifier for each employee |
| `full_name` | `VARCHAR(100)` | `NOT NULL` | Employee's full name |
| `role` | `VARCHAR(50)` | — | Job title or designation |
| `dept_id` | `INT` | `FOREIGN KEY → departments(dept_id)` | The department this employee belongs to |
| `salary` | `DECIMAL(10,2)` | — | Employee's base salary |

---

### 📁 3. `projects`

Tracks active organizational projects along with their allocated budgets. Projects in this system can involve multiple employees across different departments, reflecting how cross-functional work actually happens in companies.

| Column | Data Type | Constraint | Description |
|--------|-----------|------------|-------------|
| `project_id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Unique identifier for each project |
| `project_name` | `VARCHAR(100)` | `NOT NULL` | Name of the project |
| `budget` | `DECIMAL(15,2)` | — | Allocated budget for the project |

---

### 💰 4. `payroll`

Records every salary payment made to an employee. Each row represents a single payroll transaction, capturing when it was made and the amount disbursed. This allows HR to maintain a full payment history per employee rather than just storing a current salary figure.

| Column | Data Type | Constraint | Description |
|--------|-----------|------------|-------------|
| `transaction_id` | `INT` | `PRIMARY KEY`, `AUTO_INCREMENT` | Unique identifier for each payment record |
| `emp_id` | `INT` | `FOREIGN KEY → employees(id)` | The employee who received the payment |
| `payment_date` | `DATE` | — | Date the salary was disbursed |
| `amount` | `DECIMAL(10,2)` | — | Amount paid in that transaction |

---

### 🔗 5. `employee_projects`

A junction table that resolves the many-to-many relationship between employees and projects. Since one employee can work on multiple projects, and one project can have multiple employees, a direct foreign key between the two is not sufficient — this table bridges them with a composite primary key.

| Column | Data Type | Constraint | Description |
|--------|-----------|------------|-------------|
| `emp_id` | `INT` | `PRIMARY KEY (composite)`, `FOREIGN KEY → employees(id)` | The employee assigned to the project |
| `project_id` | `INT` | `PRIMARY KEY (composite)`, `FOREIGN KEY → projects(project_id)` | The project the employee is assigned to |

---

## 🔗 Relationships

### One-to-Many: Departments → Employees

Each department can have multiple employees, but each employee belongs to exactly one department. This is enforced by the `dept_id` foreign key in the `employees` table pointing back to `departments`.

```
departments (1) ──────── (many) employees
```

For example, the IT department has multiple engineers, data scientists, and DevOps staff — all linked by the same `dept_id`.

---

### One-to-Many: Employees → Payroll

Each employee can have multiple payroll transactions over time (monthly payments, adjustments, etc.), but each transaction record belongs to exactly one employee. This is enforced by the `emp_id` foreign key in the `payroll` table.

```
employees (1) ──────── (many) payroll
```

This design allows querying full payment history per employee rather than just a snapshot salary.

---

### Many-to-Many: Employees ↔ Projects

An employee can be assigned to multiple projects, and a project can have multiple employees working on it. This relationship cannot be stored with a simple foreign key — it requires a dedicated junction table (`employee_projects`) with a composite primary key made up of both `emp_id` and `project_id`.

```
employees (many) ──── employee_projects ──── (many) projects
```

The composite primary key also prevents duplicate assignments — the same employee cannot be added to the same project twice.

---

## 👥 Authors

| Name | Enrollment No. |
|------|---------------|
| Devraj Sangharajka | AU2420181 |
| Dvij Desai | AU2420139 |
