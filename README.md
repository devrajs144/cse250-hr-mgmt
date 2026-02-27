# HR Management System  

## Project Description  

The **HR Management System** is a relational database project developed using MariaDB in IntelliJ IDEA. The system is designed to efficiently manage and organize structured employee data using interconnected database tables.

This project focuses on implementing core DBMS concepts such as relational schema design, normalization, primary and foreign key constraints, and structured SQL queries. The database ensures organized storage, integrity, and efficient retrieval of employee-related information.

The system is built around five core tables: **Employees, Departments, Job_Roles, Salaries, and Attendance**, which together represent the fundamental structure of an HR database.

---

## Objectives  

- To design a normalized relational database schema  
- To establish relationships between HR-related entities  
- To maintain structured employee data using constraints  
- To ensure data consistency through primary and foreign keys  
- To perform meaningful SQL queries across related tables  

---

## Technologies Used  

- **Database:** MariaDB  
- **IDE:** IntelliJ IDEA  
- **Language:** SQL  
- **Version Control:** Git & GitHub  

---

## Database Design (Tables & Purpose)  

The HR Management System consists of multiple interconnected tables that maintain relational integrity and avoid redundancy through proper key constraints.

---

### 1. Employees  

This is the central table of the system.  

**Attributes:**
- Employee_ID (Primary Key)  
- First_Name  
- Last_Name  
- Email  
- Phone_Number  
- Hire_Date  
- Department_ID (Foreign Key)  
- Role_ID (Foreign Key)  

The Employees table connects with Departments, Job_Roles, Salaries, and Attendance, forming the backbone of the database structure.

---

### 2. Departments  

This table stores information about different departments within the organization.

**Attributes:**
- Department_ID (Primary Key)  
- Department_Name  
- Location  

This table helps categorize employees and supports structured organizational mapping.

---

### 3. Job_Roles  

This table maintains standardized job positions within the organization.

**Attributes:**
- Role_ID (Primary Key)  
- Role_Title  
- Role_Description  

This structure ensures consistent role classification and prevents redundancy in employee records.

---

### 4. Salaries  

The Salaries table maintains compensation details for employees.

**Attributes:**
- Salary_ID (Primary Key)  
- Employee_ID (Foreign Key)  
- Basic_Salary  
- Allowances  
- Deductions  
- Payment_Date  

This table supports payroll record maintenance and financial tracking.

---

### 5. Attendance  

The Attendance table records employee presence information.

**Attributes:**
- Attendance_ID (Primary Key)  
- Employee_ID (Foreign Key)  
- Attendance_Date  
- Status (Present / Absent / Leave)  

This table helps monitor daily attendance and analyze work patterns.

---

## Relationship Structure  

- Each employee belongs to one department.  
- Each employee is assigned one job role.  
- Each employee can have multiple salary records.  
- Each employee can have multiple attendance records.  

Primary and Foreign Key constraints ensure:

- Data consistency  
- Referential integrity  
- Elimination of redundancy  
- Efficient relational querying  

---

## Features  

- Structured employee data management  
- Department and role classification  
- Salary record maintenance  
- Attendance tracking system  
- Relational database integrity using constraints  

---

## Future Scope  

- Integration with payroll automation  
- Web-based interface for HR access  
- Employee self-service module  
- Extended reporting and analytics features  

---

## Learning Outcomes  

- Practical implementation of relational database design  
- Use of primary and foreign key constraints  
- Schema normalization techniques  
- Writing SQL queries using joins  
- Managing databases using MariaDB  

---

## Authors  

- **Devraj Sangharajka (AU2420181)**  
- **Dvij Desai (AU2420139)**  
