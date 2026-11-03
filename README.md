# SQL Unit 3 – Joins and Subqueries

## 📌 Project Overview

This project is based on **MySQL – Unit 3: Joins and Subqueries**. It demonstrates practical SQL queries for retrieving, combining, filtering, and analysing data from multiple related tables.

The project includes 18 practical questions covering different types of SQL joins, aggregate functions, and subqueries.

## 🎯 Objectives

- Understand different types of SQL Joins.
- Retrieve data from multiple related tables.
- Identify matching and unmatched records.
- Perform data analysis using aggregate functions.
- Understand Self Joins and Cross Joins.
- Practise different types of subqueries.
- Use `EXISTS` and `NOT EXISTS` to check related records.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Tool:** MySQL Workbench
- **Language:** SQL

## 🗄️ Database Information

**Database Name:** `companyy_db`

The project contains the following six tables:

| Table Name | Description |
|---|---|
| `departments` | Stores department details and locations. |
| `employees` | Stores employee details, salary, department, and manager information. |
| `projects` | Stores project information and department details. |
| `employee_projects` | Maintains the relationship between employees and projects. |
| `sizes` | Stores available sizes. |
| `colors` | Stores available colors. |

## 📚 Topics Covered

### 1. Basic SQL Operations
- Counting records in multiple tables.
- Using `UNION ALL` to combine query results.

### 2. INNER JOIN
- Retrieving employees with their department details.
- Joining multiple tables to retrieve employee, project, and department information.
- Using `GROUP BY` with aggregate functions.

### 3. LEFT JOIN
- Retrieving all employees, including those without a department.
- Using `COALESCE()` to replace NULL values.
- Finding unmatched records.

### 4. RIGHT JOIN
- Displaying all departments, including departments without employees.
- Finding departments that have no employees.

### 5. FULL OUTER JOIN
- Simulating FULL OUTER JOIN using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`.
- Displaying only unmatched records.

### 6. CROSS JOIN
- Generating every possible combination of sizes and colors.
- Counting total combinations.

### 7. SELF JOIN
- Displaying employee and manager relationships.
- Finding employees working in the same department.
- Identifying direct and indirect managers.

### 8. Subqueries
- Scalar subqueries using `AVG()` and `MAX()`.
- Finding employees earning above the average salary.
- Finding the highest and second-highest salaries.
- Using `IN` and `NOT IN`.
- Derived tables using subqueries in the `FROM` clause.
- Subqueries in the `SELECT` clause.
- Correlated subqueries.
- Using `EXISTS` and `NOT EXISTS`.

## 🔍 Key SQL Concepts Practised

| SQL Concept | Purpose |
|---|---|
| `INNER JOIN` | Returns matching records from tables. |
| `LEFT JOIN` | Returns all records from the left table and matching records from the right table. |
| `RIGHT JOIN` | Returns all records from the right table and matching records from the left table. |
| `UNION` | Combines results and removes duplicate rows. |
| `UNION ALL` | Combines results while keeping duplicate rows. |
| `CROSS JOIN` | Generates all possible combinations of rows. |
| `SELF JOIN` | Joins a table with itself. |
| `GROUP BY` | Groups rows based on common values. |
| `COALESCE()` | Returns the first non-NULL value. |
| `AVG()` | Calculates the average value. |
| `MAX()` | Returns the maximum value. |
| `IN` | Checks whether a value matches any value in a list or subquery. |
| `NOT IN` | Checks whether a value does not match values in a list or subquery. |
| `EXISTS` | Checks whether a subquery returns at least one row. |
| `NOT EXISTS` | Checks whether a subquery returns no rows. |

## ▶️ How to Run the Project

1. Download or clone this repository.
2. Open MySQL Workbench.
3. Open the `Sql_u3_Exam.sql` file.
4. Execute the SQL script.
5. The database `companyy_db` and its tables will be created.
6. Sample records will be inserted automatically.
7. Execute the queries from Q1 to Q18 to view the results.

## 📂 Project Structure

```text
SQL-Unit-3-Joins-and-Subqueries/
│
├── Sql_u3_Exam.sql
└── README.md
```

## 📈 Learning Outcomes

Through this project, I practised:

- Writing SQL queries using different types of joins.
- Understanding relationships between multiple tables.
- Handling NULL values and unmatched records.
- Performing calculations using aggregate functions.
- Writing nested and correlated subqueries.
- Understanding employee-manager relationships using Self Joins.
- Retrieving records using `EXISTS` and `NOT EXISTS`.

## 👨‍💻 Author

**Maahroof Munshi**

## 🏁 Conclusion

This project helped me strengthen my understanding of MySQL Joins and Subqueries through practical examples. It improved my ability to retrieve, combine, filter, and analyse relational database information using SQL.

