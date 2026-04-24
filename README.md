# Database Management System

A minimalistic Database Management System (DBMS) implemented in C++ as part of the Data Structures and Algorithms course at Sofia University (FMI).

This project provides a lightweight SQL-like engine capable of handling basic database operations, with persistent storage and a modular architecture designed for clarity and extensibility.

---

## Overview

The system supports core database functionality such as creating tables, inserting records, and executing queries. Data is stored in binary files, and query execution is optimized using B-Tree indexing.

The architecture is split into three main layers:
- **Tokenizer** – Converts raw input into tokens
- **Parser** – Validates and builds query structures based on a formal grammar
- **Execution Engine** – Processes queries and interacts with storage

---

## Features

- SQL-like query interpreter:
  - `CREATE TABLE`, `CREATE INDEX`
  - `SELECT`, `INSERT INTO`, `UPDATE`
- Persistent storage using custom binary file format
- B-Tree indexing for efficient data retrieval
- Modular layered architecture
- Unit tests covering core functionality (~80% coverage)
- Doxygen documentation

---
## Example Usage
CREATE TABLE students (name string, fn int, group int, grade double) PRIMARY KEY fn;
Table "students" created.

INSERT INTO students ("Иван Петров", 1000, 1, 4.00);
Record inserted.

INSERT INTO students ("Мария Иванова", 1000, 2, 5.00);
ERROR: Duplicate primary key value.
Record not inserted.

SELECT * FROM students;
"Иван Петров", 1000, 1, 4.00
"Мария Иванова", 1001, 2, 5.00
5 rows selected.

SELECT COUNT(grade) FROM students WHERE grade = 6.00;
3
1 row selected.

---