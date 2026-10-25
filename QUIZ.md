# 🎓 SQL & CRUD Masterclass Quiz (24 Questions & Complete Answer Key)

1. **What does CRUD stand for?**
   - Answer: Create, Read, Update, Delete.
2. **Which SQL command defines new database tables?**
   - Answer: `CREATE TABLE` (DDL).
3. **What is a Primary Key constraint?**
   - Answer: Uniquely identifies each record, enforcing NOT NULL and UNIQUE.
4. **What does a Foreign Key constraint enforce?**
   - Answer: Referential integrity between two related tables.
5. **Which JOIN returns only matching rows from both tables?**
   - Answer: `INNER JOIN`.
6. **Which JOIN returns all rows from the left table and matched rows from the right table?**
   - Answer: `LEFT OUTER JOIN`.
7. **What does the SQL 'HAVING' clause do?**
   - Answer: Filters grouped results after `GROUP BY` aggregations (unlike `WHERE` which filters before grouping).
8. **What does ACID stand for?**
   - Answer: Atomicity, Consistency, Isolation, Durability.
9. **What does Atomicity mean in database transactions?**
   - Answer: All operations succeed together, or all fail and are rolled back ("all or nothing").
10. **Which command permanently saves transaction changes to disk?**
    - Answer: `COMMIT`
11. **Which command reverses all uncommitted transaction changes?**
    - Answer: `ROLLBACK`
12. **What data structure is standardly used for SQL indexes?**
    - Answer: B-Tree (Balanced Tree).
13. **Which command displays the database query execution plan?**
    - Answer: `EXPLAIN ANALYZE`
14. **What does a Seq Scan (Sequential Scan) signify?**
    - Answer: The database reads every row in the table, often indicating a missing index on filtered columns.
15. **What is First Normal Form (1NF)?**
    - Answer: Atomic column values (no repeating groups or comma-separated lists).
16. **What is Second Normal Form (2NF)?**
    - Answer: Meets 1NF and eliminates partial key dependencies (all non-key attributes depend on entire primary key).
17. **What is Third Normal Form (3NF)?**
    - Answer: Meets 2NF and eliminates transitive dependencies (non-key attributes do not depend on other non-key attributes).
18. **Difference between DROP TABLE and TRUNCATE TABLE?**
    - Answer: `DROP` removes the entire table structure and schema; `TRUNCATE` rapidly deletes all rows preserving the table structure.
19. **Difference between DELETE and TRUNCATE?**
    - Answer: `DELETE` logs individual row deletions and supports `WHERE`; `TRUNCATE` deallocates pages and cannot be filtered with `WHERE`.
20. **What is a SQL injection vulnerability?**
    - Answer: Unsanitized user input concatenated into SQL query strings, allowing attackers to manipulate queries.
21. **How do you prevent SQL injection completely?**
    - Answer: Parameterized queries / Prepared statements.
22. **What does 'ON DELETE CASCADE' do on a Foreign Key?**
    - Answer: Automatically deletes child rows when the referenced parent row is deleted.
23. **What does 'COALESCE(val1, val2, ...)' return?**
    - Answer: The first non-null expression in the argument list.
24. **What is a database View?**
    - Answer: A stored SQL query presenting a virtual table that computes on demand.
