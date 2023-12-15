-- change date settings
ALTER DATABASE employees_db SET datestyle TO "ISO, MDY";

-- create 'departments' table
CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(30) NOT NULL
);

-- create 'titles' table
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY NOT NULL,
    title VARCHAR(30) NOT NULL
);

-- create 'employees' table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,	
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- create 'salaries' table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary INT  NOT NULL
);

-- create 'dept_emp' table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	-- create composite PK, as emp_no and dept_no are not unique
    PRIMARY KEY(emp_no,dept_no)
);


-- create 'dept_manager' table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
