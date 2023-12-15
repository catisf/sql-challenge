-- 1. List the employee number, last name, first name, 
-- sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, s.salary
FROM employees as emp
INNER JOIN salaries as s ON
emp.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees
-- who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE DATE_PART('year', hire_date) = '1986';

-- 3. List the manager of each department along with their department 
-- number, department name, employee number, last name, and first name.
SELECT mng.dept_no, dpt.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM departments as dpt
INNER JOIN dept_manager as mng ON
dpt.dept_no = mng.dept_no
INNER JOIN employees as emp ON
mng.emp_no = emp.emp_no
ORDER BY mng.dept_no;

-- 4. List the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name.
-- some employees work in more than one department, so this will have duplicate names/emp numbers
SELECT dpt.dept_no, emp.emp_no, emp.last_name, emp.first_name, dpt.dept_name
FROM employees as emp
INNER JOIN dept_emp ON
emp.emp_no = dept_emp.emp_no
INNER JOIN departments as dpt ON
dept_emp.dept_no = dpt.dept_no;

-- 5.List first name, last name, and sex of each employee whose 
-- first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including 
-- their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
  SELECT emp_no
  FROM dept_emp 
  WHERE dept_no IN
  (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Sales'
  )
);

-- 7. List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
INNER JOIN dept_emp ON
emp.emp_no = dept_emp.emp_no
INNER JOIN departments as dept ON
dept_emp.dept_no = dept.dept_no
WHERE dept.dept_name IN
(
	SELECT dept.dept_name
	FROM departments as dept
	WHERE dept.dept_name = 'Sales'
	OR dept_name = 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "freq_count"
FROM employees
GROUP BY last_name
ORDER BY "freq_count" DESC;