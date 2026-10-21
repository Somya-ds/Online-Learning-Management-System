# 🎓 Online Learning Management System (LMS)

A database management system project developed using **MySQL 8.0** to manage students, instructors, courses, enrollments, learning resources, assessments, submissions, and grades.

## 📌 Project Overview

The Online Learning Management System (LMS) is a relational database designed to organize and manage the core activities of an online educational platform.

The project demonstrates the practical implementation of SQL concepts, including table creation, primary and foreign keys, data insertion, joins, aggregate functions, subqueries, views, and indexes.

## 🎯 Objectives

- Design a relational database for an online learning platform.
- Manage student, instructor, department, and course information.
- Maintain student enrollment records.
- Organize course modules and learning resources.
- Store assessment, submission, and grading information.
- Retrieve related information using SQL queries.
- Apply database concepts to a real-world educational scenario.

## 🛠️ Technologies Used

- **Database:** MySQL 8.0
- **Query Language:** SQL
- **Interface:** MySQL 8.0 Command Client
- **Documentation:** Microsoft Word / PDF
- **Version Control:** GitHub

## 🗄️ Database Tables

The project contains 10 relational tables:

| Table | Description |
|---|---|
| `Department` | Stores academic department details. |
| `Student` | Stores student information. |
| `Instructor` | Stores instructor details and specializations. |
| `Course` | Stores course information, credits, and assignments. |
| `Enrollment` | Records students enrolled in courses. |
| `Module` | Organizes course content into modules. |
| `Learning_Resource` | Stores educational resource details and URLs. |
| `Assessment` | Stores quizzes, assignments, and examinations. |
| `Submission` | Records student assessment submissions. |
| `Grade` | Stores marks, grades, and feedback. |

## ✨ SQL Concepts Implemented

- Database and table creation using `create database` and `create table`
- Primary keys and foreign keys
- Constraints such as `not null`, `unique`, and referential integrity
- Multiple-row data insertion using `insert into`
- Data retrieval using `select` and `where`
- Joins to combine related tables
- Aggregate functions: `count()`, `avg()`, `max()`, and `min()`
- Grouping and filtering using `group by` and `having`
- Subqueries and nested queries
- `in` and `exists` operators
- `any` and `all` operators
- Views for simplified data retrieval
- Indexes for supporting searches

## 🏗️ Database Design

The database uses a relational model with primary and foreign keys to establish relationships between entities.

The `Enrollment` table resolves the many-to-many relationship between students and courses. The `Submission` table connects students with assessments, while the `Grade` table stores the results associated with submissions.

The Entity-Relationship (ER) diagram illustrates the database entities, attributes, keys, and relationships.

## 🚀 How to Run the Project

### Prerequisites

- MySQL 8.0 installed on your computer.
- Access to MySQL 8.0 Command Client.

### Steps

1. Clone or download this repository.
2. Open MySQL 8.0 Command Client.
3. Open the SQL script or copy its contents into the command client.
4. Execute the SQL statements in the order provided.
5. Use the following commands to verify the database:

```sql
show databases;
use LMS;
show tables;
select * from Student;
select * from Course;
select * from Student_Course_View;
```

**Important:** The SQL script recreates the `LMS` database from scratch and deletes any existing database with that name. Back up any existing data before running it.

## 📂 Project Files

- `LMS_Project.sql` — SQL script for database creation, sample data, and queries.
- `ER_Diagram.png` — Entity-Relationship diagram.
- `Project_Report.pdf` — Detailed project report.
- `README.md` — Project overview and execution instructions.

*The filenames above describe the intended repository structure. Update them if your uploaded filenames differ.*

## 🎓 Learning Outcomes

Through this project, I gained practical experience in:

- Designing relational databases.
- Creating tables and defining constraints.
- Establishing relationships using foreign keys.
- Writing basic and advanced SQL queries.
- Retrieving and analyzing related data.
- Creating views and indexes in MySQL.
- Applying DBMS concepts to an educational application.

## 👨‍💻 Author

**Somya Gupta**

BCA (Data Science) Student

## 📄 Project Information

- **Project Type:** DBMS Academic Project
- **Domain:** Education Technology
- **Database System:** MySQL 8.0
- **Status:** Academic project

---

If you find this project useful, feel free to explore the SQL implementation and database design.

