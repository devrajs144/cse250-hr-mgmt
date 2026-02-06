# HR Management System 

## Project Description

The HR Management System is a database-driven project developed using MariaDB within IntelliJ IDEA. It is designed to manage and organize employee-related information such as personal details, department allocation, job roles, salary records, attendance data, leave records, and performance information.

This project demonstrates practical implementation of relational database concepts including schema design, normalization, constraints, and SQL querying.

The topic was chosen because Human Resource management is a core function in every organization, regardless of size or industry. Companies deal with large volumes of employee data daily, and managing this information manually or through unstructured systems often leads to inefficiencies, errors, and data redundancy. A structured database system helps centralize this information, making it easier to access, update, and analyze.

In real-world scenarios, HR databases are critical for maintaining organizational structure, monitoring employee performance, managing payroll, tracking attendance, and supporting decision-making processes. They enable HR departments to operate efficiently, ensure data consistency, and generate meaningful insights such as workforce distribution, salary trends, and performance evaluations.

------------------------------------------------------------------------

## Objectives

-   To design a structured HR database system
-   To store and manage employee records efficiently
-   To track departments, job roles, and salaries
-   To maintain attendance and employment history
-   To perform analytical HR queries for decision-making

------------------------------------------------------------------------

## Technologies Used

-   **Database:** MariaDB
-   **IDE:** IntelliJ IDEA
-   **Language:** SQL
-   **Version Control:** Git & GitHub

------------------------------------------------------------------------

## Database Design (Tables & Purpose)

The HR Management System is structured using multiple interconnected
tables linked through primary and foreign keys to maintain relational
integrity and avoid redundancy.

### Employees

Stores core employee information such as name, contact details,
department, and hiring date.\
This table acts as the central entity connecting most HR operations.

### Departments

Contains details about different departments within the organization.\
It helps categorize employees and supports organizational structure and
reporting.

### Job_Roles

Maintains standardized job positions and designations.\
This allows role-based classification of employees and workforce
analysis.

### Salaries

Stores employee salary details and payment records.\
This supports payroll tracking, compensation analysis, and HR financial
reporting.

### Attendance

Maintains daily attendance records of employees.\
It helps monitor presence, productivity, and attendance patterns.

### Leave_Records

Tracks employee leave applications and approvals.\
This ensures proper leave management and availability tracking.

### Performance_Records

Stores performance evaluations and appraisal data.\
This supports employee development, promotions, and HR decision-making.

These tables are connected through foreign keys to ensure: 
- Data consistency
- Reduced redundancy
- Accurate relationship mapping
- Efficient query performance

------------------------------------------------------------------------

## Features

-   Centralized employee database
-   Department and role mapping
-   Salary tracking system
-   Attendance and leave management
-   Performance monitoring
-   HR analytical queries

------------------------------------------------------------------------

## Future Scope Of Improvements

-   Payroll automation
-   Web-based HR dashboard
-   Employee self-service portal
-   Recruitment module
-   Advanced HR analytics

------------------------------------------------------------------------

## Learning Outcomes

-   Understanding relational database design
-   Implementing SQL queries and joins
-   Applying normalization techniques
-   Using constraints and foreign keys
-   Working with MariaDB in IntelliJ IDEA

------------------------------------------------------------------------

## Author

**Name:** Devraj Sangharajka (AU2420181)\
**Name:** Dvij DesaI (AU2420139)
