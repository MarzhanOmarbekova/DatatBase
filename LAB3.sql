CREATE DATABASE lab3;

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM customers;

SELECT lastname FROM employees;

SELECT DISTINCT lastname FROM employees;

SELECT * FROM employees
WHERE lastname='Smith';

SELECT * FROM employees
WHERE lastname='Smith' OR lastname='Doe';

SELECT * FROM employees
WHERE department = 14;

SELECT * FROM employees
WHERE department = 37 OR department = 77;

SELECT sum(budget) FROM departments;

SELECT department, count(*) FROM employees
GROUP BY department ;

SELECT department FROM employees
GROUP BY department
HAVING count(*)>2;

SELECT name FROM departments
ORDER BY budget DESC NULLS LAST
LIMIT 1
OFFSET 1;

SELECT name, lastname FROM employees
WHERE department = (SELECT code FROM departments WHERE budget = (SELECT min(budget) FROM departments));

SELECT name FROM employees WHERE city = 'Almaty'
UNION ALL
SELECT name FROM customers WHERE city = 'Almaty';

SELECT * FROM departments
WHERE budget > 60000
ORDER BY budget,code DESC ;

UPDATE departments
SET budget = budget*0.9
WHERE budget = (SELECT min(budget) FROM departments);

UPDATE employees
SET department = 14
WHERE department = 77;

DELETE FROM employees
WHERE department = (SELECT code FROM departments WHERE name = 'IT');

DELETE FROM employees;