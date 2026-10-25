# 🎯 TeachCloud Current Active Assessment — SQL & Databases

> **Current Active 7-Day Cycle**: Edition #42 (2026-10-15 → 2026-10-22 UTC)
> **Automatic Rotation Policy**: New random questions reload every 7 days.
> **Top-Reloading Architecture**: Newly generated questions are appended on the top with date tags. Older questions are permanently preserved below without duplicates.
> **Historical Storage Vault**: Archived weekly snapshots reside in [`docs/Quiz/Store/`](Store/).

---

## 🔄 Weekly Update: 2026-10-24 (Edition #43)
> **Active Dates**: 2026-10-22 to 2026-10-29 UTC
> **New Unique Questions Reloaded**: 4

### Question 1: How does UNION differ from UNION ALL in SQL query execution?

- [x] **UNION removes duplicate rows from combined result sets; UNION ALL retains all returned duplicate rows** *(Correct Answer)*
- [ ] UNION ALL is slower because it sorts rows
- [ ] UNION only works on single tables
- [ ] UNION ALL converts text columns to uppercase

> **💡 Engineering Context & Rationale**:
> <strong>UNION</strong> performs a distinct deduplication pass on combined records; <strong>UNION ALL</strong> appends records directly, providing faster performance.

---

### Question 2: What does the LIKE operator with wildcard `%` perform in SQL string queries?

- [x] **Matches any sequence of zero or more characters** *(Correct Answer)*
- [ ] Matches exactly one single character
- [ ] Performs regular expression substitution
- [ ] Converts text to uppercase

> **💡 Engineering Context & Rationale**:
> In SQL <code>LIKE</code> queries, <code>%</code> matches arbitrary length substrings, while <code>_</code> matches a single character.

---

### Question 3: How does DELETE differ from TRUNCATE in relational database management?

- [x] **DELETE is a DML command removing specific rows with logging; TRUNCATE is a DDL command deallocating table data pages rapidly** *(Correct Answer)*
- [ ] TRUNCATE can be filtered with a WHERE clause
- [ ] DELETE resets auto-increment counters to 1
- [ ] TRUNCATE triggers row-level triggers

> **💡 Engineering Context & Rationale**:
> <strong>DELETE</strong> removes rows individually with transaction log overhead; <strong>TRUNCATE</strong> resets data pages instantly without row triggers.

---

### Question 4: What is a Correlated Subquery in SQL?

- [x] **A subquery that depends on values from the outer query, executing once for every candidate row evaluated by the outer query** *(Correct Answer)*
- [ ] A subquery that runs in a background thread
- [ ] A subquery containing no WHERE clause
- [ ] A subquery stored in a view file

> **💡 Engineering Context & Rationale**:
> <strong>Correlated subqueries</strong> reference parent query columns, re-evaluating for every outer row processed.

---
## 🔄 Weekly Update: 2026-10-20 (Edition #42)
> **Active Dates**: 2026-10-15 to 2026-10-22 UTC
> **Active Questions Count**: 16

### Question 1: How does RANK() differ from DENSE_RANK() in SQL window functions when duplicate values occur?

- [x] **RANK() leaves gaps in sequence rank numbers after ties; DENSE_RANK() assigns consecutive rank numbers without gaps** *(Correct Answer)*
- [ ] DENSE_RANK() only works on integer columns
- [ ] RANK() returns random order
- [ ] They behave identically

> **💡 Engineering Context & Rationale**:
> If two rows tie for rank 1, <strong>RANK()</strong> assigns the next row rank 3, whereas <strong>DENSE_RANK()</strong> assigns rank 2.

---
### Question 2: What is the purpose of a Database Index (e.g. B-Tree)?

- [x] **Accelerates data retrieval speed by providing fast lookup structures at the cost of additional storage and write overhead** *(Correct Answer)*
- [ ] Encrypts table columns on disk
- [ ] Automatically backs up tables to cloud storage
- [ ] Enforces unique primary key generation

> **💡 Engineering Context & Rationale**:
> <strong>Database Indexes</strong> dramatically reduce full table scans by creating sorted pointer trees for quick search execution.

---
### Question 3: What is the difference between WHERE and HAVING clauses in SQL?

- [x] **WHERE filters records prior to GROUP BY aggregation; HAVING filters aggregated group metrics post-aggregation** *(Correct Answer)*
- [ ] WHERE is for strings; HAVING is for numbers
- [ ] HAVING runs before WHERE
- [ ] WHERE requires an INDEX

> **💡 Engineering Context & Rationale**:
> <strong>WHERE</strong> operates on individual rows before grouping; <strong>HAVING</strong> operates on aggregated summary rows.

---
### Question 4: What is the primary difference between INNER JOIN and LEFT JOIN in SQL?

- [x] **INNER JOIN returns matching rows in both tables; LEFT JOIN returns all rows from the left table and matched rows from the right** *(Correct Answer)*
- [ ] INNER JOIN is faster than LEFT JOIN in all databases
- [ ] LEFT JOIN deletes non-matching rows from disk
- [ ] INNER JOIN only works on primary key columns

> **💡 Engineering Context & Rationale**:
> <strong>INNER JOIN</strong> excludes unmatched records; <strong>LEFT JOIN</strong> retains all records from the left table, populating NULLs for unmatched right table columns.

---
### Question 5: What is the outcome of a SQL ROLLBACK statement during a transaction?

- [x] **Cancels all modifications made within the current uncommitted transaction and restores previous state** *(Correct Answer)*
- [ ] Deletes the database schema definition
- [ ] Reboots the database server process
- [ ] Commits pending transactions immediately

> **💡 Engineering Context & Rationale**:
> <code>ROLLBACK</code> reverts database modifications made since the last <code>BEGIN TRANSACTION</code> point.

---
### Question 6: Which database isolation level prevents Dirty Reads but allows Non-Repeatable Reads?

- [x] **Read Committed** *(Correct Answer)*
- [ ] Read Uncommitted
- [ ] Repeatable Read
- [ ] Serializable

> **💡 Engineering Context & Rationale**:
> Under <strong>Read Committed</strong> isolation, transactions can only view committed data, preventing uncommitted dirty reads.

---
### Question 7: What is the purpose of a Database Connection Pool?

- [x] **Maintains a cache of reusable database connections to reduce the overhead of repeatedly opening and closing connections** *(Correct Answer)*
- [ ] Encrypts user passwords in transit
- [ ] Executes automatic night backups
- [ ] Parses complex SQL syntax strings

> **💡 Engineering Context & Rationale**:
> <strong>Connection Pooling</strong> reuses established database TCP handles, eliminating latency caused by constant handshake negotiations.

---
### Question 8: What is Database Normalization (e.g. Third Normal Form - 3NF)?

- [x] **The process of structuring schema attributes to reduce data redundancy and eliminate update anomalies** *(Correct Answer)*
- [ ] Converting SQL queries into JSON documents
- [ ] Distributing database instances across multiple cloud regions
- [ ] Merging all application tables into a single master sheet

> **💡 Engineering Context & Rationale**:
> <strong>Normalization</strong> organizes tables into logical entities to ensure data dependencies are properly maintained without redundant duplication.

---
### Question 9: What is the purpose of the SQL EXPLAIN command?

- [x] **Displays the execution plan chosen by the database query planner for query optimization** *(Correct Answer)*
- [ ] Executes a query in background mode
- [ ] Translates SQL syntax into Python code
- [ ] Generates mock test rows for benchmarking

> **💡 Engineering Context & Rationale**:
> <code>EXPLAIN</code> (or <code>EXPLAIN ANALYZE</code>) shows how database engines execute queries, highlighting index usage and scan costs.

---
### Question 10: What is a Composite Primary Key?

- [x] **A primary key consisting of two or more table columns that together uniquely identify each row** *(Correct Answer)*
- [ ] A primary key shared across multiple databases
- [ ] An auto-incrementing integer key
- [ ] A primary key stored in an external file

> **💡 Engineering Context & Rationale**:
> <strong>Composite Primary Keys</strong> use multiple attribute combinations (e.g. <code>user_id, role_id</code>) to ensure uniqueness.

---
### Question 11: How does a SQL CASE statement function inside a SELECT query?

- [x] **Provides conditional evaluation logic returning specific values based on IF-THEN-ELSE branch checks** *(Correct Answer)*
- [ ] Loops through rows like a WHILE loop
- [ ] Deletes invalid rows automatically
- [ ] Creates temporary views on disk

> **💡 Engineering Context & Rationale**:
> <code>CASE WHEN condition THEN val ELSE fallback END</code> enables inline conditional projection within query results.

---
### Question 12: Which SQL window function assigns a unique sequential integer to rows within a partition starting at 1?

- [x] **ROW_NUMBER()** *(Correct Answer)*
- [ ] RANK()
- [ ] DENSE_RANK()
- [ ] COUNT()

> **💡 Engineering Context & Rationale**:
> <code>ROW_NUMBER()</code> generates a strictly incremental sequence number for each row inside a window partition.

---
### Question 13: What does a COALESCE() function return in SQL queries?

- [x] **The first non-NULL expression from its argument list** *(Correct Answer)*
- [ ] The average sum of numeric columns
- [ ] The character length of a string
- [ ] The database transaction timestamp

> **💡 Engineering Context & Rationale**:
> <code>COALESCE(val1, val2, fallback)</code> evaluates arguments sequentially and returns the first non-null value encountered.

---
### Question 14: What is a SQL Deadlock?

- [x] **A situation where two or more transactions hold locks on resources that the other transactions require, blocking each other indefinitely** *(Correct Answer)*
- [ ] A corrupted database file on disk
- [ ] A network socket timeout error
- [ ] An unindexed full table scan query

> **💡 Engineering Context & Rationale**:
> <strong>Deadlocks</strong> occur when concurrent transactions acquire circular locks; database engines detect deadlocks and abort one of the transactions.

---
### Question 15: What is Database Sharding?

- [x] **Horizontal partitioning of a database across multiple independent server instances to scale storage and throughput** *(Correct Answer)*
- [ ] Creating read-only database backups
- [ ] Compressing SQL log files
- [ ] Adding composite indexes to a table

> **💡 Engineering Context & Rationale**:
> <strong>Database Sharding</strong> splits dataset rows across distinct database nodes based on a shard key to overcome single-node resource limits.

---
### Question 16: What does the "A" in SQL ACID properties stand for?

- [x] **Atomicity** *(Correct Answer)*
- [ ] Availability
- [ ] Authentication
- [ ] Asynchrony

> **💡 Engineering Context & Rationale**:
> <strong>Atomicity</strong> guarantees that all operations within a database transaction execute successfully, or the entire transaction is rolled back completely.

---
