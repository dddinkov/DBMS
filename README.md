# Database Management System

A lightweight SQL interpreter and storage engine implemented from scratch in C++.

Designed and built as a personal deep-dive into how database systems work internally — from query parsing to binary storage.

---

## Overview

The system implements a full query execution pipeline based on a formal grammar defined in BNF notation:

- **Lexer** — hand-written tokenizer with peek/lookahead support
- **Parser** — AST-based, validates input against the formal grammar
- **Execution Engine** — processes queries and interacts with the storage layer

Data is persisted in a custom binary format using `streampos` pointers for direct record access. Query performance is improved through B-Tree indexing with serialization support.

---

## Features

- SQL-like query interpreter:
  - `CREATE TABLE`, `CREATE INDEX`
  - `SELECT`, `INSERT INTO`, `UPDATE`
- Custom binary storage engine with persistent data management
- B-Tree indexing for O(log n) query execution
- Aggregate functions: `COUNT`, `MIN`, `MAX`, `AVG`, `SUM`
- `WHERE` clauses and `ORDER BY` support
- Unit tests with ~80% line coverage using the doctest framework

---

## Example Usage

```
> CREATE TABLE employees (id int, name string, salary double, active bool) PRIMARY KEY id;
Table "employees" created.

> INSERT INTO employees (1, "Alice", 3500.00, TRUE);
Record inserted.
> INSERT INTO employees (2, "Bob", 4200.00, TRUE);
Record inserted.
> INSERT INTO employees (3, "Carol", 2800.00, FALSE);
Record inserted.
> INSERT INTO employees (4, "David", 5100.00, TRUE);
Record inserted.
> INSERT INTO employees (5, "Eve", 3900.00, TRUE);
Record inserted.

> SELECT * FROM employees WHERE active = TRUE ORDER BY salary ASC;
1, "Alice", 3500.00, TRUE
5, "Eve", 3900.00, TRUE
2, "Bob", 4200.00, TRUE
4, "David", 5100.00, TRUE
4 rows selected.

> SELECT AVG(salary) FROM employees WHERE active = TRUE;
4175
1 row selected.

> UPDATE employees SET salary = 4000.00 WHERE id = 3;
1 row updated.

> CREATE INDEX ON employees (salary);
Index created.

> SELECT * FROM employees WHERE salary >= 4000.00 ORDER BY salary ASC;
3, "Carol", 4000.00, FALSE
2, "Bob", 4200.00, TRUE
4, "David", 5100.00, TRUE
3 rows selected.
```