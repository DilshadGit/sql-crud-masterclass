-- =============================================================================
-- 04_window_functions_and_ctes.sql - Window Functions and Recursive CTEs
-- =============================================================================

-- 1. Salary ranking within each department using DENSE_RANK()
SELECT
    id,
    first_name,
    salary,
    department_id,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dept_salary_rank,
    ROUND(AVG(salary) OVER (PARTITION BY department_id), 2) AS dept_avg_salary
FROM employees;

-- 2. Common Table Expression (CTE) filtering high earners
WITH DeptStats AS (
    SELECT
        department_id,
        AVG(salary) AS avg_sal
    FROM employees
    GROUP BY department_id
)
SELECT e.first_name, e.last_name, e.salary, ds.avg_sal
FROM employees e
JOIN DeptStats ds ON e.department_id = ds.department_id
WHERE e.salary > ds.avg_sal;
