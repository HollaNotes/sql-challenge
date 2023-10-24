-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM 
	employees
INNER JOIN 
	salaries 
	ON employees.emp_no=salaries.emp_no
ORDER BY 
	emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT	
	dept_manager.dept_no AS "Department Number",
	departments.dept_name AS "Department Name",	
	employees.emp_no AS "Employee ID",
	employees.last_name AS "Last Name",
	employees.first_name AS " First Name"
FROM dept_manager
LEFT JOIN departments ON 
	dept_manager.dept_no = departments.dept_no
LEFT JOIN employees ON 
	dept_manager.emp_no = employees.emp_no
 ORDER BY "Department Number";
	

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW ee_by_dept AS
SELECT
	employees.emp_no AS "Employee ID",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	dept_emp.dept_no AS "Department Number",
	departments.dept_name AS "Department Name"
FROM
	dept_emp
INNER JOIN employees ON
	employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
	dept_emp.dept_no=departments.dept_no
ORDER BY "Last Name", "First Name"	;
	
	
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
	first_name AS "First Name",
	last_name AS "Last Name",
	sex 
FROM 
	employees
WHERE
	first_name = 'Hercules'
	AND 
	last_name LIKE 'B%'
ORDER BY "last_name";


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
	"Department Name",	
	"Employee ID",
	"Last Name",
	"First Name"
FROM 	
	ee_by_dept
WHERE
	"Department Name" = 'Sales';
	
	
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	"Employee ID",
	"Last Name",
	"First Name",
	"Department Name"
FROM 	
	ee_by_dept
WHERE
	"Department Name" = 'Sales'
	OR
	"Department Name" = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT DISTINCT
	last_name,
	COUNT(last_name) AS "count of last name"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;
