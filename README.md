# Employee Database SQL Queries
It’s been two weeks since you were hired as a new data engineer at Pewlett Hackard (a fictional company). Your first major task is to do a research project about people whom the company employed during the 1980s and 1990s.

This repository contains SQL queries for managing an employee database with tables for departments, titles, employees, salaries, and more.

## Table Definitions
### Departments

```
---List each employee in the Sales department, including their employee number, last name, and first name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name = 'Sales';

```
### Titles
### Employees
```
---List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/01/1986' AND '12/31/1986'
ORDER BY hire_date;
```
### Department Employees 
```
---List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name 
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;
```
### Department Managers
```
---List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_name, departments.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees 
ON dept_manager.emp_no = employees.emp_no;
```
### Salaries
 ```
---List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
```

## tech used 
PostgreSQL
SQLAlchemy
QuckDBD

