# Employee Database SQL Queries
It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s.

This repository contains SQL queries for managing an employee database with tables for departments, titles, employees, salaries, and more.

## Table Definitions
### Departments
---List each employee in the Sales department, including their employee number, last name, and first name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name = 'Sales';

### Titles
### Employees
### Department Employees 
### Department Managers
### Salaries 

## tech used 
PostgreSQL
SQLAlchemy
QuckDBD

