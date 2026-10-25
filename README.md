# 💾 Relational Database Engineering, SQL & CRUD Masterclass

[![SQL](https://img.shields.io/badge/SQL-ANSI%20Standard-blue?style=for-the-badge&logo=postgresql&logoColor=white)](https://postgresql.org)
[![SQLite](https://img.shields.io/badge/SQLite-3.x-003B57?style=for-the-badge&logo=sqlite&logoColor=white)](https://sqlite.org)
[![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-2.0%20ORM-red?style=for-the-badge)](https://sqlalchemy.org)
[![Python](https://img.shields.io/badge/Python-3.12%2B-blue?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

> Complete zero-to-hero curriculum in Relational Database Management Systems (RDBMS), database normalization (1NF-BCNF), schema design (DDL), comprehensive CRUD operations (DML), complex JOINs, Window Functions, Common Table Expressions (CTEs), B-Tree indexing, ACID transactions, and Python SQLAlchemy ORM integrations.

---

## 📑 Curriculum & Architecture Roadmap

```
DDL Schema & Constraints ──► DML CRUD Operations ──► Multi-Table JOINs & Aggregations
                                                                │
SQLAlchemy 2.0 ORM CRUD ◄── ACID Transactions & Indexes ◄── Window Functions & CTEs
```

| Chapter | Topic | Highlights | Document |
|---|---|---|---|
| **DDL Schema** | **Table Design & Constraints** | Primary keys, Foreign keys, `ON DELETE CASCADE`, Check constraints | [`01_ddl_tables.sql`](schema/01_ddl_tables.sql) |
| **DML Seeding** | **Data Insertion & Upserts** | `INSERT INTO`, batch insertion, `ON CONFLICT DO NOTHING` | [`02_dml_seed.sql`](schema/02_dml_seed.sql) |
| **JOINs & Aggs** | **Relational Queries** | `INNER JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, aggregations | [`03_joins_and_aggregations.sql`](schema/03_joins_and_aggregations.sql) |
| **Advanced SQL** | **Window Functions & CTEs** | `ROW_NUMBER()`, `DENSE_RANK()`, `OVER (PARTITION BY)`, CTE expressions | [`04_window_functions_and_ctes.sql`](schema/04_window_functions_and_ctes.sql) |
| **ACID & Locking** | **Transactions & Atomicity** | `BEGIN`, `COMMIT`, `ROLLBACK`, isolation levels, transfer atomicity | [`05_transactions_and_acid.sql`](schema/05_transactions_and_acid.sql) |
| **Theory** | **Normalization Guide** | 1NF, 2NF, 3NF, BCNF refactoring tables | [`01_RELATIONAL_THEORY_AND_NORMALIZATION.md`](docs/01_RELATIONAL_THEORY_AND_NORMALIZATION.md) |
| **Python CRUD** | **14 Python SQLite Scripts** | Database connection, queries, parameterized inputs, update, delete | [`python_crud/`](python_crud/) |
| **Modern ORM** | **SQLAlchemy 2.0 ORM** | Declarative Base, Mapped attributes, automated test suite | [`sqlalchemy_crud.py`](python_crud/sqlalchemy_crud.py) |
| **Exam** | **Masterclass Examination** | 24 Multiple-choice questions with deep technical rationale | [`QUIZ.md`](QUIZ.md) |

---

## 🛠️ Complete Suite of 14 Python CRUD Scripts Included

Located in [`python_crud/`](python_crud/):
1. `01_connect_db.py`: Database connection and cursor lifecycle.
2. `02_create_table.py`: Table schema creation with DDL statements.
3. `03_insert_static_data.py`: Batch insertions with `cursor.executemany()`.
4. `04_insert_dynamic_data.py`: Parameterized SQL injection defense.
5. `05_read_all_data.py`: Cursor iteration over result sets.
6. `06_read_filtered_data.py`: Conditional queries using WHERE clauses.
7. `07_read_by_user_input.py`: Interactive search queries.
8. `08_read_by_multiple_inputs.py`: Multi-criteria filtering.
9. `09_read_with_limit.py`: Pagination queries with `LIMIT` and `OFFSET`.
10. `10_update_data.py`: Safe record updates.
11. `11_delete_data.py`: Record deletion syntax.
12. `12_delete_data_with_commit.py`: Transactional persistence and rollback.
13. `13_email_counter_crud.py`: Aggregation counter patterns.
14. `14_beginner_starter.py`: Complete beginner end-to-end tutorial script.

---

## 🧪 Masterclass Examination

Complete your RDBMS mastery evaluation in [`QUIZ.md`](QUIZ.md) covering B-Tree index traversal, transaction isolation levels (Dirty Read vs Phantom Read), and Window Function semantics.
