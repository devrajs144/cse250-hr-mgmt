const express = require('express');
const mariadb = require('mariadb');
const cors = require('cors');
const app = express();
app.use(cors());

const pool = mariadb.createPool({
    host: 'localhost', user: 'root', password: 'password123', database: 'cse250_hr'
});

const queries = {
    employees: "SELECT e.id, e.full_name as Name, e.role as Role, d.dept_name as Dept, e.salary FROM employees e JOIN departments d ON e.dept_id = d.dept_id",
    departments: "SELECT * FROM departments",
    projects: "SELECT * FROM projects",
    payroll: "SELECT p.transaction_id, e.full_name as Employee, p.payment_date, p.amount FROM payroll p JOIN employees e ON p.emp_id = e.id",
    assignments: "SELECT e.full_name as Employee, p.project_name as Project FROM employee_projects ep JOIN employees e ON ep.emp_id = e.id JOIN projects p ON ep.project_id = p.project_id"
};

app.get('/api/:table', async (req, res) => {
    let conn;
    try {
        conn = await pool.getConnection();
        const rows = await conn.query(queries[req.params.table] || "SELECT 1");
        res.json(rows);
    } catch (err) { res.status(500).json(err); }
    finally { if (conn) conn.end(); }
});

app.listen(3000, () => console.log('Server running on http://localhost:3000'));

app.get('/api/:table', async (req, res) => {
    let conn;
    try {
        conn = await pool.getConnection();
        const rows = await conn.query(queries[req.params.table] || "SELECT 1");
        res.json(rows);
    } catch (err) {
        res.status(500).send(err);
    } finally {
        if (conn) conn.end();
    }
});

app.listen(3000, () => console.log('Backend running on http://localhost:3000'));