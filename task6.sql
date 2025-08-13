use customer;
#Scalar Subquery 
SELECT 
    e.name, 
    e.salary,
    (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees e;

 #Subquery in WHERE with IN
SELECT name, department_id
FROM employees
WHERE department_id IN (
    SELECT department_id 
    FROM departments 
    WHERE location = 'New York'
);

#Subquery in WHERE with EXISTS

SELECT customer_id, customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
 #Correlated Subquery
SELECT name, department_id, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);
# Subquery in FROM Clause (Derived Table)

SELECT dept_avg.department_id, dept_avg.avg_salary
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg
WHERE dept_avg.avg_salary > 60000;
# Nested Subquery
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT MIN(salary)
    FROM (
        SELECT DISTINCT salary
        FROM employees
        ORDER BY salary DESC
        LIMIT 3
    )
);
