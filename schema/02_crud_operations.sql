-- 1. CREATE (Insert Records)
INSERT INTO departments (id, name, budget) VALUES (1, 'Engineering', 500000.00);
INSERT INTO departments (id, name, budget) VALUES (2, 'DevOps & SRE', 350000.00);

INSERT INTO employees (id, name, email, department_id, salary) 
VALUES (101, 'Dilshad Abdulla', 'dilshad@example.com', 2, 95000.00);

-- 2. READ (Select with Joins & Aggregations)
SELECT e.name, e.email, d.name AS department, e.salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
WHERE e.salary >= 80000;

-- 3. UPDATE (Atomic update)
UPDATE employees 
SET salary = salary * 1.10 
WHERE department_id = 2;

-- 4. DELETE (Safe deletion)
DELETE FROM employees WHERE id = 999;
