CREATE DATABASE companyy_db;
use companyy_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    dept_id INT NULL,
    manager_id INT NULL,
    salary INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);


CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    dept_id INT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);



CREATE TABLE sizes (size_id INT PRIMARY KEY, size_name VARCHAR(30));
CREATE TABLE colors (color_id INT PRIMARY KEY, color_name VARCHAR(30));


INSERT INTO departments VALUES
(10, 'IT', 'Ahmedabad'),
(20, 'HR', 'Surat'),
(30, 'Finance', 'Rajkot'),
(40, 'Marketing', 'Pune'),
(50, 'Operations', 'Mumbai');

INSERT INTO employees VALUES
(1, 'Alice', 10, NULL, 90000),
(2, 'Bob', 10, 1, 75000),
(3, 'Charlie', 20, NULL, 65000),
(4, 'Diana', 20, 3, 55000),
(5, 'Ethan', 30, NULL, 80000),
(6, 'Fiona', 10, 2, 70000),
(7, 'George', NULL, NULL, 60000),
(8, 'Hiral', 40, 5, 58000),
(9, 'Imran', 30, 5, 72000),
(10, 'Jaya', 10, 2, 68000);

INSERT INTO projects VALUES
(101, 'Alpha', 10),
(102, 'Beta', 20),
(103, 'Gamma', 30),
(104, 'Delta', NULL),
(105, 'Epsilon', 40);

INSERT INTO employee_projects VALUES
(1, 101),
(2, 101),
(3, 102),
(6, 101),
(1, 103),
(8, 105),
(9, 103),
(10, 101);

INSERT INTO sizes VALUES
(1, 'S'),
(2, 'M'),
(3, 'L');

INSERT INTO colors VALUES
(1, 'Red'),
(2, 'Blue');


# Q1 :
select 'departments'as table_name,count(*) as total_rows from departments
union all 
select 'employees',count(*) from employees
UNION ALL
SELECT 'projects', COUNT(*)
FROM projects
UNION ALL
SELECT 'employee_projects', COUNT(*)
FROM employee_projects
UNION ALL
SELECT 'sizes', COUNT(*)
FROM sizes
UNION ALL
SELECT 'colors', COUNT(*)
FROM colors;

# Q-2 Inner Join
SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
INNER JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.salary > 65000
ORDER BY e.emp_id;

# Q3 Inner Join for Multiple Table
SELECT
    e.emp_name,
    p.project_name,
    d.dept_name
FROM employees e
INNER JOIN employee_projects ep
    ON e.emp_id = ep.emp_id
INNER JOIN projects p
    ON ep.project_id = p.project_id
INNER JOIN departments d
    ON e.dept_id = d.dept_id
ORDER BY e.emp_id, p.project_id;

# Q4 : Inner Join With Group By
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_emps,
    SUM(e.salary) AS total_pay
FROM departments d
INNER JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY total_pay DESC;

# Q5 : Left Join With Coalesce

SELECT
    e.emp_id,
    e.emp_name,
    COALESCE(d.dept_name, 'No Department') AS department
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
ORDER BY e.emp_id;

# Q6-Finding Unmatched rows
# 6(A) Employees who do not belong to any department
SELECT
    e.emp_id,
    e.emp_name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

# 6(B) : Projects that have no employee assigned

SELECT
    p.project_id,
    p.project_name
FROM projects p
LEFT JOIN employee_projects ep
    ON p.project_id = ep.project_id
WHERE ep.project_id IS NULL
ORDER BY p.project_id;

# Q 7: Right Join
# 7(A) Every department with its number of employees

SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_emps
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_id;

# 7(B) Departments that have no employees
SELECT
    d.dept_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

# Q8 : Full outer Join
# Q8 (a) FULL OUTER JOIN – Employees and Departments
SELECT
    e.emp_name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id

UNION

SELECT
    e.emp_name,
    d.dept_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id

ORDER BY emp_name, dept_name;

# Q8 (b) Display only mismatches
SELECT
    'No department' AS issue,
    e.emp_name AS name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL

UNION

SELECT
    'No employee' AS issue,
    d.dept_name AS name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL

ORDER BY issue;

# Q-9 : Cross Join
# Q9 (a) Every possible combination of sizes and colors
SELECT
    s.size_name,
    c.color_name
FROM sizes s
CROSS JOIN colors c
ORDER BY s.size_id, c.color_id;

# Q9 (b) Count the total number of combinations
SELECT
    COUNT(*) AS total_combinations
FROM sizes s
CROSS JOIN colors c;

# Q10. SELF JOIN – Manager Relationship
SELECT
    e.emp_name AS employee,
    COALESCE(m.emp_name, 'No Manager') AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.emp_id
ORDER BY e.emp_id;

# Q11 : SELF JOIN – Pairs in the Same Department
SELECT
    e1.emp_name AS first_employee,
    e2.emp_name AS second_employee,
    e1.dept_id
FROM employees e1
INNER JOIN employees e2
    ON e1.dept_id = e2.dept_id
    AND e1.emp_id < e2.emp_id
ORDER BY e1.emp_id, e2.emp_id;

# Q12 - SELF JOIN - direct and indirect manager.
SELECT
    e.emp_name AS employee,
    m1.emp_name AS direct_manager,
    m2.emp_name AS indirect_manager
FROM employees e
LEFT JOIN employees m1
    ON e.manager_id = m1.emp_id
LEFT JOIN employees m2
    ON m1.manager_id = m2.emp_id
WHERE e.manager_id IS NOT NULL
ORDER BY e.emp_id;

# Q13-Scalar Subqueries in WHERE
# Q13 (a) Employees earning more than the average salary
SELECT
    emp_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY emp_id;

# Q13 (b) Employee with the highest salary
SELECT
    emp_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

# Q13 (c) Employee with the second highest salary
SELECT
    emp_name,
    salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

# Q14 : Subqueries with in and Not in
# Q14 (a) Employees working in a department that has at least one project
SELECT
    emp_name
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM projects
    WHERE dept_id IS NOT NULL
)
ORDER BY emp_id;

#  Q14 (b) Departments that have no project
SELECT
    dept_name
FROM departments
WHERE dept_id NOT IN (
    SELECT dept_id
    FROM projects
    WHERE dept_id IS NOT NULL
);

# Q14 (c) Repeat without IS NOT NULL
 SELECT
    dept_name
FROM departments
WHERE dept_id NOT IN (
    SELECT dept_id
    FROM projects
);

# Q15. Subquery in the FROM Clause (Derived Table)
SELECT
    dept_summary.dept_name,
    dept_summary.avg_pay
FROM (
    SELECT
        d.dept_name,
        ROUND(AVG(e.salary), 1) AS avg_pay
    FROM employees e
    INNER JOIN departments d
        ON e.dept_id = d.dept_id
    GROUP BY d.dept_id, d.dept_name
) AS dept_summary
WHERE dept_summary.avg_pay > 70000
ORDER BY dept_summary.avg_pay DESC;

# Q16. Subquery in the SELECT Clause

SELECT
    emp_name,
    salary,
    (SELECT ROUND(AVG(salary), 1)
     FROM employees) AS company_avg,
    CASE
        WHEN salary > (SELECT AVG(salary) FROM employees)
        THEN 'Above'
        ELSE 'Below'
    END AS status
FROM employees
ORDER BY emp_id;

# Q17. Correlated Subquery
SELECT
    e.emp_name,
    e.salary,
    e.dept_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.dept_id = e.dept_id
)
ORDER BY e.emp_id;

# Q18. EXISTS and NOT EXISTS
# (a) Employees assigned to at least one project (EXISTS)
SELECT e.emp_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employee_projects a
    WHERE a.emp_id = e.emp_id
)
ORDER BY e.emp_id;

# (b) Employees not assigned to any project (NOT EXISTS)
SELECT e.emp_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM employee_projects a
    WHERE a.emp_id = e.emp_id
)
ORDER BY e.emp_id;