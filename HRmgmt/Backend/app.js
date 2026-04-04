const express = require('express');
const mysql   = require('mysql2/promise');
const cors    = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// ── DATABASE CONNECTION ───────────────────────────────────────────────────────
const pool = mysql.createPool({
    host:     'localhost',
    user:     'root',
    password: 'admin123',
    database: 'cse250_hr'
});

// ── ALLOWED TABLES (security whitelist) ───────────────────────────────────────
const ALLOWED = ['employees', 'departments', 'projects', 'payroll'];

// ── RICH JOINED QUERIES ───────────────────────────────────────────────────────
const QUERIES = {
    employees: `
        SELECT
            e.id                                        AS 'ID',
            e.full_name                                 AS 'Full Name',
            e.role                                      AS 'Role',
            d.dept_name                                 AS 'Department',
            CONCAT('₹ ', FORMAT(e.salary, 0))           AS 'Salary'
        FROM employees e
        LEFT JOIN departments d ON e.dept_id = d.dept_id
        ORDER BY e.id
    `,
    departments: `
        SELECT
            d.dept_id                                               AS 'ID',
            d.dept_name                                             AS 'Department',
            COUNT(e.id)                                             AS 'Headcount',
            CONCAT('₹ ', FORMAT(COALESCE(SUM(e.salary),0), 0))     AS 'Total Payroll'
        FROM departments d
        LEFT JOIN employees e ON d.dept_id = e.dept_id
        GROUP BY d.dept_id, d.dept_name
        ORDER BY d.dept_id
    `,
    projects: `
        SELECT
            project_id                                  AS 'ID',
            project_name                                AS 'Project Name',
            CONCAT('₹ ', FORMAT(budget, 0))             AS 'Budget'
        FROM projects
        ORDER BY project_id
    `,
    payroll: `
        SELECT
            p.transaction_id                            AS 'Txn ID',
            e.full_name                                 AS 'Employee',
            DATE_FORMAT(p.payment_date, '%d %b %Y')     AS 'Payment Date',
            CONCAT('₹ ', FORMAT(p.amount, 0))           AS 'Amount'
        FROM payroll p
        LEFT JOIN employees e ON p.emp_id = e.id
        ORDER BY p.payment_date DESC
    `
};

// ── STATS ENDPOINT ────────────────────────────────────────────────────────────
app.get('/api/stats', async (req, res) => {
    try {
        const [[emp]]  = await pool.query('SELECT COUNT(*) AS c FROM employees');
        const [[dept]] = await pool.query('SELECT COUNT(*) AS c FROM departments');
        const [[proj]] = await pool.query('SELECT COUNT(*) AS c FROM projects');
        const [[pay]]  = await pool.query('SELECT COALESCE(SUM(amount),0) AS t FROM payroll');
        res.json({
            employees:   emp.c,
            departments: dept.c,
            projects:    proj.c,
            payroll:     Number(pay.t)
        });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// ── TABLE DATA ENDPOINT ───────────────────────────────────────────────────────
app.get('/api/:table', async (req, res) => {
    const table = req.params.table;
    if (!ALLOWED.includes(table)) {
        return res.status(400).json({ error: 'Invalid table.' });
    }
    try {
        const [rows] = await pool.query(QUERIES[table]);
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// ── START ─────────────────────────────────────────────────────────────────────
app.listen(3000, () => {
    console.log('');
    console.log('  ╔══════════════════════════════════════════╗');
    console.log('  ║   MyHR Global  –  API is live 🚀         ║');
    console.log('  ║   http://localhost:3000                  ║');
    console.log('  ╚══════════════════════════════════════════╝');
    console.log('');
    console.log('  Open index.html via Apache to use the app.');
    console.log('');
});