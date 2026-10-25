-- =============================================================================
-- 03_joins_and_aggregations.sql - Multi-Table JOINs and Statistical Grouping
-- =============================================================================

-- 1. INNER JOIN: List employees with department names
SELECT e.id, e.first_name || ' ' || e.last_name AS full_name, e.salary, d.name AS department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
ORDER BY e.salary DESC;

-- 2. Aggregation with GROUP BY and HAVING
SELECT
    d.name AS department_name,
    COUNT(e.id) AS total_employees,
    ROUND(AVG(e.salary), 2) AS avg_salary,
    MAX(e.salary) AS peak_salary,
    SUM(e.salary) AS total_payroll
FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
GROUP BY d.name
HAVING COUNT(e.id) > 0
ORDER BY total_payroll DESC;
