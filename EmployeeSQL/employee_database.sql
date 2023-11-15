DROP TABLE "departments";
DROP TABLE IF EXISTS "dept_emp";
DROP TABLE IF EXISTS "dept_manager";
DROP TABLE IF EXISTS "employees";
DROP TABLE IF EXISTS "salaries";
DROP TABLE IF EXISTS "titles";

CREATE TABLE "departments"(
	"dept_no" VARCHAR(10) PRIMARY KEY NOT NULL,
	"dept_name" VARCHAR(30) NOT NULL
							
);

CREATE TABLE "titles" (
	"title_id" VARCHAR(10) NOT NULL,
	"title" VARCHAR(30) NOT NULL
	
);

CREATE TABLE "employees" (
"emp_no" INTEGER PRIMARY KEY NOT NULL,
"emp_title_id" VARCHAR(10) NOT NULL,
"birth_date"  VARCHAR(10) NOT NULL,
"first_name"  VARCHAR(50) NOT NULL,
"last_name"   VARCHAR(50) NOT NULL,
"sex"        VARCHAR(1) NOT NULL,
"hire_date"  VARCHAR(500) NOT NULL
	
);

CREATE TABLE "dept_emp" (
	"emp_no" INTEGER  NOT NULL,
	"dept_no" VARCHAR(10) NOT NULL,
	CONSTRAINT "fk_dept_emp_emp" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
	CONSTRAINT "fk_dept_emp_dept" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
	
);

CREATE TABLE "dept_manager" (
	"dept_no" VARCHAR(10) NOT NULL,
	"emp_no" INTEGER NOT NULL,
	CONSTRAINT "fk_dept_manager_dept" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
	CONSTRAINT "fk_dept_manager_emp" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
	
);



CREATE TABLE "salaries" (
	"emp_no" INTEGER NOT NULL,
	"salary" INTEGER NOT NULL,
	CONSTRAINT "fk_salaries_emp" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

---List the employee number, last name, first name, sex, and salary of each employee.
	
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
	
---List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1/01/1986' AND '12/31/1986'
ORDER BY hire_date;

---List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT departments.dept_name, departments.dept_no, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees 
ON dept_manager.emp_no = employees.emp_no;
	
---List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name 
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;
	
---List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';
	
---List each employee in the Sales department, including their employee number, last name, and first name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name = 'Sales';

---List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT departments.dept_name, employees.emp_no, employees.last_name, employees.first_name 
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no 
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

---List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;