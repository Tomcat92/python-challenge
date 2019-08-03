-- Create tables and import data
-- Drop table if exists
DROP TABLE IF EXISTS department;

-- Create department table
CREATE TABLE department (
  dept_no VARCHAR NOT NULL PRIMARY KEY,
  dept_name VARCHAR NOT NULL
);

-- Verify successful data import
SELECT * FROM department;

-- Drop if exists
DROP TABLE IF EXISTS employees;

-- Create employee table
CREATE TABLE employees (
  emp_no INT NOT NULL PRIMARY KEY,
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  gender VARCHAR NOT NULL,
  hire_date DATE NOT NULL
);

SELECT * FROM employees;

DROP TABLE IF EXISTS salaries;

-- Create new salaries table
CREATE TABLE salaries (
  emp_no INT  NOT NULL PRIMARY KEY,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
SELECT * FROM salaries;

DROP TABLE IF EXISTS titles;

-- Create new titles table
CREATE TABLE titles (
  emp_no INT NOT NULL PRIMARY KEY,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE
);
SELECT * FROM titles;

DROP TABLE IF EXISTS dept_emp;

-- Create new dept_emp table
CREATE TABLE dept_emp (
  emp_no INT NOT NULL PRIMARY KEY,
  dept_no VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE,
  Foreign Key (dept_no) REFERENCES department(dept_no)
);
SELECT * FROM dept_emp;

DROP TABLE IF EXISTS dept_manager;

-- Create dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL PRIMARY KEY,
  emp_no INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
-- Verify successful data import
SELECT * FROM dept_manager;
-----------Questions------------