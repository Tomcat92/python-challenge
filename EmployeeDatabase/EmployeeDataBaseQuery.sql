--#1 employee details:employee #, name, gender and 
--salary

SELECT 
  employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.gender,
  salaries.salary
  
FROM salaries
INNER JOIN employees ON
employees.emp_no = salaries.emp_no
ORDER BY last_name;

-----#2 List employees hired in 1986
SELECT *
FROM
employees 
WHERE hire_date >= '1986-01-01 00:00:00'
	AND  hire_date < '1987-01-01 00:00:00';
	
--#3 List manager of ea dept with: dept #, dept #, 
--manager emp_no, name, start and end date

SELECT 
  department.dept_no,
  department.dept_name,
  dept_manager.emp_no,
  employees.first_name,
  employees.last_name,
  dept_manager.from_date,
  dept_manager.to_date
  
FROM department
INNER JOIN dept_emp ON
department.dept_no = dept_emp.dept_no
INNER JOIN dept_manager ON
dept_emp.emp_no = dept_manager.emp_no
INNER JOIN employees ON
dept_manager.emp_no =employees.emp_no
ORDER BY department.dept_name;

--#4 List dept of each employee
SELECT 
  employees.emp_no,
  employees.last_name,
  employees.first_name,
  department.dept_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
INNER JOIN department ON
dept_emp.dept_no=department.dept_no

ORDER BY dept_name;

--#5 List all employees with first name "Hercules" & last name "B"

SELECT *
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--#6 List employees in Sales Deprt, emp_no, last_name, first_name,
-- dept_name
SELECT 
  employees.emp_no,
  employees.last_name,
  employees.first_name,
  department.dept_name
  
  
FROM dept_emp
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
INNER JOIN department ON
department.dept_no= dept_emp.dept_no
WHERE department.dept_name IN ('Sales')
ORDER BY last_name;

--#7 all employees in the Sales and Development Dept, emp_no,
--last & first name & depart_name

SELECT 
  employees.emp_no,
  employees.last_name,
  employees.first_name,
  department.dept_name
  
  
FROM dept_emp
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
INNER JOIN department ON
department.dept_no= dept_emp.dept_no
WHERE department.dept_name IN ('Sales', 'Development')
ORDER BY  last_name;

--#8 In desc order, list :frequency count of emp last name
SELECT last_name, COUNT(last_name) as Clast 
FROM employees
GROUP BY last_name
ORDER BY Clast DESC