DBMS Project Learning Management System


mysql> create database LMS;
Query OK, 1 row affected (0.02 sec)

mysql> use LMS;
Database changed
mysql> create table Department (
    -> Department_ID int primary key,
    -> Department_Name varchar(100) not null unique,
    -> Location varchar(100));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into Department (Department_ID, Department_Name, Location) values
    -> (1, 'Computer Science', 'Block A'),
    -> (2, 'Data Science', 'Block B'),
    -> (3, 'Information Technology', 'Block C'),
    -> (4, 'Artificial Intelligence', 'Block D');
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from Department;
+---------------+-------------------------+----------+
| Department_ID | Department_Name         | Location |
+---------------+-------------------------+----------+
|             1 | Computer Science        | Block A  |
|             2 | Data Science            | Block B  |
|             3 | Information Technology  | Block C  |
|             4 | Artificial Intelligence | Block D  |
+---------------+-------------------------+----------+
4 rows in set (0.00 sec)

mysql> create table Student (
    -> Student_ID int primary key,
    -> Student_Name varchar(100) not null,
    -> Email varchar(100) unique,
    -> Phone varchar(15),
    -> Department_ID int,
    -> Join_Date date,
    -> foreign key (Department_ID) references Department(Department_ID));
Query OK, 0 rows affected (0.09 sec)

mysql> insert into Student (Student_ID, Student_Name, Email, Phone, Department_ID, Join_Date) values
    -> (101, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', 1, '2026-01-10'),
    -> (102, 'Priya Singh', 'priya@gmail.com', '9876543211', 2, '2026-01-12'),
    -> (103, 'Aman Kumar', 'aman@gmail.com', '9876543212', 1, '2026-01-15'),
    -> (104, 'Neha Verma', 'neha@gmail.com', '9876543213', 3, '2026-01-18'),
    -> (105, 'Arjun Mehta', 'arjun@gmail.com', '9876543214', 4, '2026-01-20'),
    -> (106, 'Simran Kaur', 'simran@gmail.com', '9876543215', 2, '2026-01-22'),
    -> (107, 'Rohan Gupta', 'rohan@gmail.com', '9876543216', 1, '2026-01-25'),
    -> (108, 'Anjali Sharma', 'anjali@gmail.com', '9876543217', 3, '2026-01-27');
Query OK, 8 rows affected (0.02 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from Student;
+------------+---------------+------------------+------------+---------------+------------+
| Student_ID | Student_Name  | Email            | Phone      | Department_ID | Join_Date  |
+------------+---------------+------------------+------------+---------------+------------+
|        101 | Rahul Sharma  | rahul@gmail.com  | 9876543210 |             1 | 2026-01-10 |
|        102 | Priya Singh   | priya@gmail.com  | 9876543211 |             2 | 2026-01-12 |
|        103 | Aman Kumar    | aman@gmail.com   | 9876543212 |             1 | 2026-01-15 |
|        104 | Neha Verma    | neha@gmail.com   | 9876543213 |             3 | 2026-01-18 |
|        105 | Arjun Mehta   | arjun@gmail.com  | 9876543214 |             4 | 2026-01-20 |
|        106 | Simran Kaur   | simran@gmail.com | 9876543215 |             2 | 2026-01-22 |
|        107 | Rohan Gupta   | rohan@gmail.com  | 9876543216 |             1 | 2026-01-25 |
|        108 | Anjali Sharma | anjali@gmail.com | 9876543217 |             3 | 2026-01-27 |
+------------+---------------+------------------+------------+---------------+------------+
8 rows in set (0.00 sec)

mysql> create table Instructor (
    -> Instructor_ID int primary key,
    -> Instructor_Name varchar(100) not null,
    -> Email varchar(100) unique,
    -> Specialization varchar(100),
    -> Department_ID int,
    -> foreign key (Department_ID) references Department(Department_ID));
Query OK, 0 rows affected (0.07 sec)

mysql> insert into Instructor (Instructor_ID, Instructor_Name, Email, Specialization, Department_ID) values
    -> (201, 'Dr. Rajesh Kumar', 'rajesh@lms.com', 'Database Management', 1),
    -> (202, 'Dr. Neha Sharma', 'neha@lms.com', 'Data Analytics', 2),
    -> (203, 'Prof. Amit Verma', 'amit@lms.com', 'Web Development', 3),
    -> (204, 'Dr. Priya Mehta', 'priya@lms.com', 'Machine Learning', 4),
    -> (205, 'Prof. Karan Singh', 'karan@lms.com', 'Python Programming', 1);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Instructor;
+---------------+-------------------+----------------+---------------------+---------------+
| Instructor_ID | Instructor_Name   | Email          | Specialization      | Department_ID |
+---------------+-------------------+----------------+---------------------+---------------+
|           201 | Dr. Rajesh Kumar  | rajesh@lms.com | Database Management |             1 |
|           202 | Dr. Neha Sharma   | neha@lms.com   | Data Analytics      |             2 |
|           203 | Prof. Amit Verma  | amit@lms.com   | Web Development     |             3 |
|           204 | Dr. Priya Mehta   | priya@lms.com  | Machine Learning    |             4 |
|           205 | Prof. Karan Singh | karan@lms.com  | Python Programming  |             1 |
+---------------+-------------------+----------------+---------------------+---------------+
5 rows in set (0.00 sec)

mysql> create table Course (
    -> Course_ID int primary key,
    -> Course_Name varchar(100) not null,
    -> Course_Description varchar(255),
    -> Credits int,
    -> Instructor_ID int,
    -> Department_ID int,
    -> foreign key (Instructor_ID) references Instructor(Instructor_ID),
    -> foreign key (Department_ID) references Department(Department_ID));
Query OK, 0 rows affected (0.09 sec)

mysql> insert into Course (Course_ID, Course_Name, Course_Description, Credits, Instructor_ID, Department_ID) values
    -> (301, 'Database Management Systems', 'Introduction to DBMS and SQL', 4, 201, 1),
    -> (302, 'Data Analytics', 'Data analysis and visualization', 4, 202, 2),
    -> (303, 'Web Development', 'HTML CSS and JavaScript', 3, 203, 3),
    -> (304, 'Machine Learning', 'Machine learning algorithms and applications', 4, 204, 4),
    -> (305, 'Python Programming', 'Python programming fundamentals', 3, 205, 1),
    -> (306, 'Advanced SQL', 'Advanced database queries and optimization', 3, 201, 1);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from Course;
+-----------+-----------------------------+----------------------------------------------+---------+---------------+---------------+
| Course_ID | Course_Name                 | Course_Description                           | Credits | Instructor_ID | Department_ID |
+-----------+-----------------------------+----------------------------------------------+---------+---------------+---------------+
|       301 | Database Management Systems | Introduction to DBMS and SQL                 |       4 |           201 |             1 |
|       302 | Data Analytics              | Data analysis and visualization              |       4 |           202 |             2 |
|       303 | Web Development             | HTML CSS and JavaScript                      |       3 |           203 |             3 |
|       304 | Machine Learning            | Machine learning algorithms and applications |       4 |           204 |             4 |
|       305 | Python Programming          | Python programming fundamentals              |       3 |           205 |             1 |
|       306 | Advanced SQL                | Advanced database queries and optimization   |       3 |           201 |             1 |
+-----------+-----------------------------+----------------------------------------------+---------+---------------+---------------+
6 rows in set (0.00 sec)

mysql> create table Enrollment (
    -> Enrollment_ID int primary key,
    -> Student_ID int,
    -> Course_ID int,
    -> Enrollment_Date date,
    -> Status varchar(20),
    -> foreign key (Student_ID) references Student(Student_ID),
    -> foreign key (Course_ID) references Course(Course_ID),
    -> unique (Student_ID, Course_ID));
Query OK, 0 rows affected (0.07 sec)

mysql> insert into Enrollment (Enrollment_ID, Student_ID, Course_ID, Enrollment_Date, Status) values
    -> (401, 101, 301, '2026-02-01', 'Active'),
    -> (402, 101, 305, '2026-02-02', 'Active'),
    -> (403, 102, 302, '2026-02-01', 'Active'),
    -> (404, 102, 304, '2026-02-03', 'Active'),
    -> (405, 103, 301, '2026-02-02', 'Active'),
    -> (406, 103, 306, '2026-02-04', 'Active'),
    -> (407, 104, 303, '2026-02-01', 'Active'),
    -> (408, 105, 304, '2026-02-05', 'Active'),
    -> (409, 106, 302, '2026-02-03', 'Active'),
    -> (410, 107, 305, '2026-02-04', 'Active'),
    -> (411, 108, 303, '2026-02-05', 'Active'),
    -> (412, 107, 301, '2026-02-06', 'Active'),
    -> (413, 108, 305, '2026-02-07', 'Completed');
Query OK, 13 rows affected (0.02 sec)
Records: 13  Duplicates: 0  Warnings: 0

mysql> select * from Enrollment;
+---------------+------------+-----------+-----------------+-----------+
| Enrollment_ID | Student_ID | Course_ID | Enrollment_Date | Status    |
+---------------+------------+-----------+-----------------+-----------+
|           401 |        101 |       301 | 2026-02-01      | Active    |
|           402 |        101 |       305 | 2026-02-02      | Active    |
|           403 |        102 |       302 | 2026-02-01      | Active    |
|           404 |        102 |       304 | 2026-02-03      | Active    |
|           405 |        103 |       301 | 2026-02-02      | Active    |
|           406 |        103 |       306 | 2026-02-04      | Active    |
|           407 |        104 |       303 | 2026-02-01      | Active    |
|           408 |        105 |       304 | 2026-02-05      | Active    |
|           409 |        106 |       302 | 2026-02-03      | Active    |
|           410 |        107 |       305 | 2026-02-04      | Active    |
|           411 |        108 |       303 | 2026-02-05      | Active    |
|           412 |        107 |       301 | 2026-02-06      | Active    |
|           413 |        108 |       305 | 2026-02-07      | Completed |
+---------------+------------+-----------+-----------------+-----------+
13 rows in set (0.00 sec)

mysql> create table Module (
    -> Module_ID int primary key,
    -> Course_ID int,
    -> Module_Name varchar(100) not null,
    -> Module_Description varchar(255),
    -> Module_Order int,
    -> foreign key (Course_ID) references Course(Course_ID));
Query OK, 0 rows affected (0.06 sec)

mysql> insert into Module (Module_ID, Course_ID, Module_Name, Module_Description, Module_Order) values
    -> (501, 301, 'Introduction to DBMS', 'Basic database concepts', 1),
    -> (502, 301, 'SQL Fundamentals', 'Introduction to SQL commands', 2),
    -> (503, 302, 'Introduction to Data Analytics', 'Basics of data analysis', 1),
    -> (504, 302, 'Data Visualization', 'Charts and visualization techniques', 2),
    -> (505, 303, 'HTML Basics', 'Introduction to HTML', 1),
    -> (506, 303, 'CSS Fundamentals', 'Styling web pages using CSS', 2),
    -> (507, 304, 'Introduction to Machine Learning', 'Basic machine learning concepts', 1),
    -> (508, 304, 'Supervised Learning', 'Classification and regression', 2),
    -> (509, 305, 'Python Basics', 'Variables and data types', 1),
    -> (510, 305, 'Control Statements', 'Loops and conditional statements', 2),
    -> (511, 306, 'Advanced Joins', 'Complex SQL joins', 1),
    -> (512, 306, 'Query Optimization', 'Improving SQL query performance', 2);
Query OK, 12 rows affected (0.01 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> select * from Module;
+-----------+-----------+----------------------------------+-------------------------------------+--------------+
| Module_ID | Course_ID | Module_Name                      | Module_Description                  | Module_Order |
+-----------+-----------+----------------------------------+-------------------------------------+--------------+
|       501 |       301 | Introduction to DBMS             | Basic database concepts             |            1 |
|       502 |       301 | SQL Fundamentals                 | Introduction to SQL commands        |            2 |
|       503 |       302 | Introduction to Data Analytics   | Basics of data analysis             |            1 |
|       504 |       302 | Data Visualization               | Charts and visualization techniques |            2 |
|       505 |       303 | HTML Basics                      | Introduction to HTML                |            1 |
|       506 |       303 | CSS Fundamentals                 | Styling web pages using CSS         |            2 |
|       507 |       304 | Introduction to Machine Learning | Basic machine learning concepts     |            1 |
|       508 |       304 | Supervised Learning              | Classification and regression       |            2 |
|       509 |       305 | Python Basics                    | Variables and data types            |            1 |
|       510 |       305 | Control Statements               | Loops and conditional statements    |            2 |
|       511 |       306 | Advanced Joins                   | Complex SQL joins                   |            1 |
|       512 |       306 | Query Optimization               | Improving SQL query performance     |            2 |
+-----------+-----------+----------------------------------+-------------------------------------+--------------+
12 rows in set (0.00 sec)

mysql> create table Learning_Resource (
    -> Resource_ID int primary key,
    -> Module_ID int,
    -> Resource_Name varchar(150) not null,
    -> Resource_Type varchar(30),
    -> Resource_URL varchar(255),
    -> foreign key (Module_ID) references Module(Module_ID)
    -> );
Query OK, 0 rows affected (0.08 sec)

mysql> insert into Learning_Resource (Resource_ID, Module_ID, Resource_Name, Resource_Type, Resource_URL) values
    -> (601, 501, 'DBMS Introduction Notes', 'PDF', 'https://example.com/dbms-notes'),
    -> (602, 502, 'SQL Basics Tutorial', 'Video', 'https://example.com/sql-basics'),
    -> (603, 503, 'Data Analytics Guide', 'PDF', 'https://example.com/analytics-guide'),
    -> (604, 504, 'Data Visualization Tutorial', 'Video', 'https://example.com/visualization'),
    -> (605, 505, 'HTML Learning Guide', 'PDF', 'https://example.com/html-guide'),
    -> (606, 506, 'CSS Tutorial', 'Video', 'https://example.com/css-tutorial'),
    -> (607, 507, 'Machine Learning Introduction', 'Article', 'https://example.com/ml-intro'),
    -> (608, 508, 'Supervised Learning Notes', 'PDF', 'https://example.com/supervised-learning'),
    -> (609, 509, 'Python Basics Tutorial', 'Video', 'https://example.com/python-basics'),
    -> (610, 510, 'Control Statements Guide', 'PDF', 'https://example.com/control-statements'),
    -> (611, 511, 'Advanced Joins Tutorial', 'Video', 'https://example.com/advanced-joins'),
    -> (612, 512, 'Query Optimization Guide', 'PDF', 'https://example.com/query-optimization');
Query OK, 12 rows affected (0.02 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> create table Assessment (
    -> Assessment_ID int primary key,
    -> Course_ID int,
    -> Assessment_Name varchar(100) not null,
    -> Assessment_Type varchar(30),
    -> Max_Marks int,
    -> Assessment_Date date,
    -> foreign key (Course_ID) references Course(Course_ID));
Query OK, 0 rows affected (0.07 sec)

mysql> insert into Assessment (Assessment_ID, Course_ID, Assessment_Name, Assessment_Type, Max_Marks, Assessment_Date) values
    -> (701, 301, 'DBMS Quiz', 'Quiz', 20, '2026-03-01'),
    -> (702, 301, 'SQL Assignment', 'Assignment', 50, '2026-03-05'),
    -> (703, 302, 'Analytics Quiz', 'Quiz', 20, '2026-03-02'),
    -> (704, 302, 'Data Analysis Project', 'Assignment', 50, '2026-03-08'),
    -> (705, 303, 'HTML CSS Test', 'Quiz', 25, '2026-03-03'),
    -> (706, 304, 'ML Midterm Exam', 'Exam', 100, '2026-03-10'),
    -> (707, 305, 'Python Programming Assignment', 'Assignment', 50, '2026-03-06'),
    -> (708, 306, 'Advanced SQL Test', 'Exam', 100, '2026-03-12');
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> create table Submission (
    -> Submission_ID int primary key,
    -> Assessment_ID int,
    -> Student_ID int,
    -> Submission_Date date,
    -> Submission_Status varchar(20),
    -> foreign key (Assessment_ID) references Assessment(Assessment_ID),
    -> foreign key (Student_ID) references Student(Student_ID),
    -> unique (Assessment_ID, Student_ID));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into Submission (Submission_ID, Assessment_ID, Student_ID, Submission_Date, Submission_Status) values
    -> (801, 701, 101, '2026-03-01', 'Submitted'),
    -> (802, 702, 101, '2026-03-05', 'Submitted'),
    -> (803, 701, 103, '2026-03-01', 'Submitted'),
    -> (804, 703, 102, '2026-03-02', 'Submitted'),
    -> (805, 704, 106, '2026-03-08', 'Submitted'),
    -> (806, 705, 104, '2026-03-03', 'Submitted'),
    -> (807, 706, 105, '2026-03-10', 'Submitted'),
    -> (808, 707, 107, '2026-03-06', 'Submitted'),
    -> (809, 707, 108, '2026-03-06', 'Submitted'),
    -> (810, 708, 103, '2026-03-12', 'Submitted'),
    -> (811, 703, 106, '2026-03-02', 'Submitted'),
    -> (812, 706, 102, '2026-03-10', 'Submitted');
Query OK, 12 rows affected (0.01 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> create table Grade (
    -> Grade_ID int primary key,
    -> Submission_ID int unique,
    -> Marks_Obtained decimal(5,2),
    -> Grade varchar(5),
    -> Feedback varchar(255),
    -> foreign key (Submission_ID) references Submission(Submission_ID));
Query OK, 0 rows affected (0.07 sec)

mysql> insert into Grade (Grade_ID, Submission_ID, Marks_Obtained, Grade, Feedback)
    -> values
    -> (901, 801, 18, 'A', 'Excellent performance'),
    -> (902, 802, 44, 'A', 'Very good SQL skills'),
    -> (903, 803, 15, 'B', 'Good understanding'),
    -> (904, 804, 17, 'A', 'Well done'),
    -> (905, 805, 42, 'A', 'Good analytical work'),
    -> (906, 806, 21, 'B', 'Good effort'),
    -> (907, 807, 85, 'A', 'Excellent understanding'),
    -> (908, 808, 46, 'A', 'Very good Python skills'),
    -> (909, 809, 39, 'B', 'Good work'),
    -> (910, 810, 88, 'A', 'Excellent SQL knowledge'),
    -> (911, 811, 14, 'B', 'Satisfactory performance'),
    -> (912, 812, 76, 'B', 'Good understanding');
Query OK, 12 rows affected (0.02 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> show tables;
+-------------------+
| Tables_in_lms     |
+-------------------+
| assessment        |
| course            |
| department        |
| enrollment        |
| grade             |
| instructor        |
| learning_resource |
| module            |
| student           |
| submission        |
+-------------------+
10 rows in set (0.03 sec)

mysql> select * from Learning_Resource;
+-------------+-----------+-------------------------------+---------------+-----------------------------------------+
| Resource_ID | Module_ID | Resource_Name                 | Resource_Type | Resource_URL                            |
+-------------+-----------+-------------------------------+---------------+-----------------------------------------+
|         601 |       501 | DBMS Introduction Notes       | PDF           | https://example.com/dbms-notes          |
|         602 |       502 | SQL Basics Tutorial           | Video         | https://example.com/sql-basics          |
|         603 |       503 | Data Analytics Guide          | PDF           | https://example.com/analytics-guide     |
|         604 |       504 | Data Visualization Tutorial   | Video         | https://example.com/visualization       |
|         605 |       505 | HTML Learning Guide           | PDF           | https://example.com/html-guide          |
|         606 |       506 | CSS Tutorial                  | Video         | https://example.com/css-tutorial        |
|         607 |       507 | Machine Learning Introduction | Article       | https://example.com/ml-intro            |
|         608 |       508 | Supervised Learning Notes     | PDF           | https://example.com/supervised-learning |
|         609 |       509 | Python Basics Tutorial        | Video         | https://example.com/python-basics       |
|         610 |       510 | Control Statements Guide      | PDF           | https://example.com/control-statements  |
|         611 |       511 | Advanced Joins Tutorial       | Video         | https://example.com/advanced-joins      |
|         612 |       512 | Query Optimization Guide      | PDF           | https://example.com/query-optimization  |
+-------------+-----------+-------------------------------+---------------+-----------------------------------------+
12 rows in set (0.00 sec)

mysql> select * from Assessment;
+---------------+-----------+-------------------------------+-----------------+-----------+-----------------+
| Assessment_ID | Course_ID | Assessment_Name               | Assessment_Type | Max_Marks | Assessment_Date |
+---------------+-----------+-------------------------------+-----------------+-----------+-----------------+
|           701 |       301 | DBMS Quiz                     | Quiz            |        20 | 2026-03-01      |
|           702 |       301 | SQL Assignment                | Assignment      |        50 | 2026-03-05      |
|           703 |       302 | Analytics Quiz                | Quiz            |        20 | 2026-03-02      |
|           704 |       302 | Data Analysis Project         | Assignment      |        50 | 2026-03-08      |
|           705 |       303 | HTML CSS Test                 | Quiz            |        25 | 2026-03-03      |
|           706 |       304 | ML Midterm Exam               | Exam            |       100 | 2026-03-10      |
|           707 |       305 | Python Programming Assignment | Assignment      |        50 | 2026-03-06      |
|           708 |       306 | Advanced SQL Test             | Exam            |       100 | 2026-03-12      |
+---------------+-----------+-------------------------------+-----------------+-----------+-----------------+
8 rows in set (0.00 sec)

mysql> select * from Submission;
+---------------+---------------+------------+-----------------+-------------------+
| Submission_ID | Assessment_ID | Student_ID | Submission_Date | Submission_Status |
+---------------+---------------+------------+-----------------+-------------------+
|           801 |           701 |        101 | 2026-03-01      | Submitted         |
|           802 |           702 |        101 | 2026-03-05      | Submitted         |
|           803 |           701 |        103 | 2026-03-01      | Submitted         |
|           804 |           703 |        102 | 2026-03-02      | Submitted         |
|           805 |           704 |        106 | 2026-03-08      | Submitted         |
|           806 |           705 |        104 | 2026-03-03      | Submitted         |
|           807 |           706 |        105 | 2026-03-10      | Submitted         |
|           808 |           707 |        107 | 2026-03-06      | Submitted         |
|           809 |           707 |        108 | 2026-03-06      | Submitted         |
|           810 |           708 |        103 | 2026-03-12      | Submitted         |
|           811 |           703 |        106 | 2026-03-02      | Submitted         |
|           812 |           706 |        102 | 2026-03-10      | Submitted         |
+---------------+---------------+------------+-----------------+-------------------+
12 rows in set (0.00 sec)

mysql> select * from Grade;
+----------+---------------+----------------+-------+--------------------------+
| Grade_ID | Submission_ID | Marks_Obtained | Grade | Feedback                 |
+----------+---------------+----------------+-------+--------------------------+
|      901 |           801 |          18.00 | A     | Excellent performance    |
|      902 |           802 |          44.00 | A     | Very good SQL skills     |
|      903 |           803 |          15.00 | B     | Good understanding       |
|      904 |           804 |          17.00 | A     | Well done                |
|      905 |           805 |          42.00 | A     | Good analytical work     |
|      906 |           806 |          21.00 | B     | Good effort              |
|      907 |           807 |          85.00 | A     | Excellent understanding  |
|      908 |           808 |          46.00 | A     | Very good Python skills  |
|      909 |           809 |          39.00 | B     | Good work                |
|      910 |           810 |          88.00 | A     | Excellent SQL knowledge  |
|      911 |           811 |          14.00 | B     | Satisfactory performance |
|      912 |           812 |          76.00 | B     | Good understanding       |
+----------+---------------+----------------+-------+--------------------------+
12 rows in set (0.00 sec)

mysql> select * from Student;
+------------+---------------+------------------+------------+---------------+------------+
| Student_ID | Student_Name  | Email            | Phone      | Department_ID | Join_Date  |
+------------+---------------+------------------+------------+---------------+------------+
|        101 | Rahul Sharma  | rahul@gmail.com  | 9876543210 |             1 | 2026-01-10 |
|        102 | Priya Singh   | priya@gmail.com  | 9876543211 |             2 | 2026-01-12 |
|        103 | Aman Kumar    | aman@gmail.com   | 9876543212 |             1 | 2026-01-15 |
|        104 | Neha Verma    | neha@gmail.com   | 9876543213 |             3 | 2026-01-18 |
|        105 | Arjun Mehta   | arjun@gmail.com  | 9876543214 |             4 | 2026-01-20 |
|        106 | Simran Kaur   | simran@gmail.com | 9876543215 |             2 | 2026-01-22 |
|        107 | Rohan Gupta   | rohan@gmail.com  | 9876543216 |             1 | 2026-01-25 |
|        108 | Anjali Sharma | anjali@gmail.com | 9876543217 |             3 | 2026-01-27 |
+------------+---------------+------------------+------------+---------------+------------+
8 rows in set (0.00 sec)

mysql> select * from Course;
+-----------+-----------------------------+----------------------------------------------+---------+---------------+---------------+
| Course_ID | Course_Name                 | Course_Description                           | Credits | Instructor_ID | Department_ID |
+-----------+-----------------------------+----------------------------------------------+---------+---------------+---------------+
|       301 | Database Management Systems | Introduction to DBMS and SQL                 |       4 |           201 |             1 |
|       302 | Data Analytics              | Data analysis and visualization              |       4 |           202 |             2 |
|       303 | Web Development             | HTML CSS and JavaScript                      |       3 |           203 |             3 |
|       304 | Machine Learning            | Machine learning algorithms and applications |       4 |           204 |             4 |
|       305 | Python Programming          | Python programming fundamentals              |       3 |           205 |             1 |
|       306 | Advanced SQL                | Advanced database queries and optimization   |       3 |           201 |             1 |
+-----------+-----------------------------+----------------------------------------------+---------+---------------+---------------+
6 rows in set (0.00 sec)

mysql> select Student_ID, Student_Name, Join_Date
    -> from Student
    -> where Join_Date > '2026-01-15';
+------------+---------------+------------+
| Student_ID | Student_Name  | Join_Date  |
+------------+---------------+------------+
|        104 | Neha Verma    | 2026-01-18 |
|        105 | Arjun Mehta   | 2026-01-20 |
|        106 | Simran Kaur   | 2026-01-22 |
|        107 | Rohan Gupta   | 2026-01-25 |
|        108 | Anjali Sharma | 2026-01-27 |
+------------+---------------+------------+
5 rows in set (0.00 sec)

mysql> select Course_Name, Credits
    -> from Course
    -> where Credits = 4;
+-----------------------------+---------+
| Course_Name                 | Credits |
+-----------------------------+---------+
| Database Management Systems |       4 |
| Data Analytics              |       4 |
| Machine Learning            |       4 |
+-----------------------------+---------+
3 rows in set (0.00 sec)

mysql> select Assessment_Name, Assessment_Type, Max_Marks
    -> from Assessment
    -> where Max_Marks >= 50;
+-------------------------------+-----------------+-----------+
| Assessment_Name               | Assessment_Type | Max_Marks |
+-------------------------------+-----------------+-----------+
| SQL Assignment                | Assignment      |        50 |
| Data Analysis Project         | Assignment      |        50 |
| ML Midterm Exam               | Exam            |       100 |
| Python Programming Assignment | Assignment      |        50 |
| Advanced SQL Test             | Exam            |       100 |
+-------------------------------+-----------------+-----------+
5 rows in set (0.00 sec)

mysql> select Student.Student_Name, Department.Department_Name
    -> from Student
    -> join Department
    -> on Student.Department_ID = Department.Department_ID;
+---------------+-------------------------+
| Student_Name  | Department_Name         |
+---------------+-------------------------+
| Arjun Mehta   | Artificial Intelligence |
| Rahul Sharma  | Computer Science        |
| Aman Kumar    | Computer Science        |
| Rohan Gupta   | Computer Science        |
| Priya Singh   | Data Science            |
| Simran Kaur   | Data Science            |
| Neha Verma    | Information Technology  |
| Anjali Sharma | Information Technology  |
+---------------+-------------------------+
8 rows in set (0.00 sec)

mysql> select Course.Course_Name, Instructor.Instructor_Name
    -> from Course
    -> join Instructor
    -> on Course.Instructor_ID = Instructor.Instructor_ID;
+-----------------------------+-------------------+
| Course_Name                 | Instructor_Name   |
+-----------------------------+-------------------+
| Database Management Systems | Dr. Rajesh Kumar  |
| Advanced SQL                | Dr. Rajesh Kumar  |
| Data Analytics              | Dr. Neha Sharma   |
| Web Development             | Prof. Amit Verma  |
| Machine Learning            | Dr. Priya Mehta   |
| Python Programming          | Prof. Karan Singh |
+-----------------------------+-------------------+
6 rows in set (0.01 sec)

mysql> select Student.Student_Name, Course.Course_Name, Enrollment.Status
    -> from Enrollment
    -> join Student
    -> on Enrollment.Student_ID = Student.Student_ID
    -> join Course
    -> on Enrollment.Course_ID = Course.Course_ID;
+---------------+-----------------------------+-----------+
| Student_Name  | Course_Name                 | Status    |
+---------------+-----------------------------+-----------+
| Rahul Sharma  | Database Management Systems | Active    |
| Aman Kumar    | Database Management Systems | Active    |
| Rohan Gupta   | Database Management Systems | Active    |
| Priya Singh   | Data Analytics              | Active    |
| Simran Kaur   | Data Analytics              | Active    |
| Neha Verma    | Web Development             | Active    |
| Anjali Sharma | Web Development             | Active    |
| Priya Singh   | Machine Learning            | Active    |
| Arjun Mehta   | Machine Learning            | Active    |
| Rahul Sharma  | Python Programming          | Active    |
| Rohan Gupta   | Python Programming          | Active    |
| Anjali Sharma | Python Programming          | Completed |
| Aman Kumar    | Advanced SQL                | Active    |
+---------------+-----------------------------+-----------+
13 rows in set (0.00 sec)

mysql> select Module.Module_Name, Course.Course_Name
    -> from Module
    -> join Course
    -> on Module.Course_ID = Course.Course_ID;
+----------------------------------+-----------------------------+
| Module_Name                      | Course_Name                 |
+----------------------------------+-----------------------------+
| Introduction to DBMS             | Database Management Systems |
| SQL Fundamentals                 | Database Management Systems |
| Introduction to Data Analytics   | Data Analytics              |
| Data Visualization               | Data Analytics              |
| HTML Basics                      | Web Development             |
| CSS Fundamentals                 | Web Development             |
| Introduction to Machine Learning | Machine Learning            |
| Supervised Learning              | Machine Learning            |
| Python Basics                    | Python Programming          |
| Control Statements               | Python Programming          |
| Advanced Joins                   | Advanced SQL                |
| Query Optimization               | Advanced SQL                |
+----------------------------------+-----------------------------+
12 rows in set (0.00 sec)

mysql> select Student.Student_Name, Assessment.Assessment_Name, Grade.Marks_Obtained
    -> from Grade
    -> join Submission
    -> on Grade.Submission_ID = Submission.Submission_ID
    -> join Student
    -> on Submission.Student_ID = Student.Student_ID
    -> join Assessment
    -> on Submission.Assessment_ID = Assessment.Assessment_ID;
+---------------+-------------------------------+----------------+
| Student_Name  | Assessment_Name               | Marks_Obtained |
+---------------+-------------------------------+----------------+
| Rahul Sharma  | DBMS Quiz                     |          18.00 |
| Aman Kumar    | DBMS Quiz                     |          15.00 |
| Rahul Sharma  | SQL Assignment                |          44.00 |
| Priya Singh   | Analytics Quiz                |          17.00 |
| Simran Kaur   | Analytics Quiz                |          14.00 |
| Simran Kaur   | Data Analysis Project         |          42.00 |
| Neha Verma    | HTML CSS Test                 |          21.00 |
| Priya Singh   | ML Midterm Exam               |          76.00 |
| Arjun Mehta   | ML Midterm Exam               |          85.00 |
| Rohan Gupta   | Python Programming Assignment |          46.00 |
| Anjali Sharma | Python Programming Assignment |          39.00 |
| Aman Kumar    | Advanced SQL Test             |          88.00 |
+---------------+-------------------------------+----------------+
12 rows in set (0.00 sec)

mysql> select count(*) as Total_Students
    -> from Student;
+----------------+
| Total_Students |
+----------------+
|              8 |
+----------------+
1 row in set (0.01 sec)

mysql> select avg(Marks_Obtained) as Average_Marks
    -> from Grade;
+---------------+
| Average_Marks |
+---------------+
|     42.083333 |
+---------------+
1 row in set (0.01 sec)

mysql> select max(Marks_Obtained) as Highest_Marks,
    -> min(Marks_Obtained) as Lowest_Marks
    -> from Grade;
+---------------+--------------+
| Highest_Marks | Lowest_Marks |
+---------------+--------------+
|         88.00 |        14.00 |
+---------------+--------------+
1 row in set (0.01 sec)

mysql> select Course.Course_Name, count(Enrollment.Student_ID) as Total_Students
    -> from Course
    -> left join Enrollment
    -> on Course.Course_ID = Enrollment.Course_ID
    -> group by Course.Course_ID, Course.Course_Name;
+-----------------------------+----------------+
| Course_Name                 | Total_Students |
+-----------------------------+----------------+
| Database Management Systems |              3 |
| Data Analytics              |              2 |
| Web Development             |              2 |
| Machine Learning            |              2 |
| Python Programming          |              3 |
| Advanced SQL                |              1 |
+-----------------------------+----------------+
6 rows in set (0.00 sec)

mysql> select Course.Course_Name, count(Enrollment.Student_ID) as Total_Students
    -> from Course
    -> join Enrollment
    -> on Course.Course_ID = Enrollment.Course_ID
    -> group by Course.Course_ID, Course.Course_Name
    -> having count(Enrollment.Student_ID) > 1;
+-----------------------------+----------------+
| Course_Name                 | Total_Students |
+-----------------------------+----------------+
| Database Management Systems |              3 |
| Data Analytics              |              2 |
| Web Development             |              2 |
| Machine Learning            |              2 |
| Python Programming          |              3 |
+-----------------------------+----------------+
5 rows in set (0.00 sec)

mysql> select Assessment.Assessment_Name,
    ->  avg(Grade.Marks_Obtained) as Average_Marks
    -> from Assessment
    -> join Submission
    -> on Assessment.Assessment_ID = Submission.Assessment_ID
    -> join Grade
    -> on Submission.Submission_ID = Grade.Submission_ID
    -> group by Assessment.Assessment_ID, Assessment.Assessment_Name;
+-------------------------------+---------------+
| Assessment_Name               | Average_Marks |
+-------------------------------+---------------+
| DBMS Quiz                     |     16.500000 |
| SQL Assignment                |     44.000000 |
| Analytics Quiz                |     15.500000 |
| Data Analysis Project         |     42.000000 |
| HTML CSS Test                 |     21.000000 |
| ML Midterm Exam               |     80.500000 |
| Python Programming Assignment |     42.500000 |
| Advanced SQL Test             |     88.000000 |
+-------------------------------+---------------+
8 rows in set (0.01 sec)

mysql> select Student.Student_Name, Grade.Marks_Obtained
    -> from Student
    -> join Submission
    -> on Student.Student_ID = Submission.Student_ID
    -> join Grade
    -> on Submission.Submission_ID = Grade.Submission_ID
    -> where Grade.Marks_Obtained > (
    ->  select avg(Marks_Obtained)
    -> from Grade);
+--------------+----------------+
| Student_Name | Marks_Obtained |
+--------------+----------------+
| Rahul Sharma |          44.00 |
| Arjun Mehta  |          85.00 |
| Rohan Gupta  |          46.00 |
| Aman Kumar   |          88.00 |
| Priya Singh  |          76.00 |
+--------------+----------------+
5 rows in set (0.00 sec)

mysql> select Course_Name, Credits
    -> from Course
    -> where Credits > (
    -> select avg(Credits)
    -> from Course);
+-----------------------------+---------+
| Course_Name                 | Credits |
+-----------------------------+---------+
| Database Management Systems |       4 |
| Data Analytics              |       4 |
| Machine Learning            |       4 |
+-----------------------------+---------+
3 rows in set (0.00 sec)

mysql> select Student_Name
    -> from Student
    -> where Department_ID in (
    -> select Department_ID
    ->  from Department
    ->  where Department_Name = 'Data Science');
+--------------+
| Student_Name |
+--------------+
| Priya Singh  |
| Simran Kaur  |
+--------------+
2 rows in set (0.00 sec)

mysql> select Student_Name
    -> from Student
    -> where Student_ID in (
    -> select Student_ID
    -> from Submission);
+---------------+
| Student_Name  |
+---------------+
| Rahul Sharma  |
| Priya Singh   |
| Aman Kumar    |
| Neha Verma    |
| Arjun Mehta   |
| Simran Kaur   |
| Rohan Gupta   |
| Anjali Sharma |
+---------------+
8 rows in set (0.00 sec)

mysql> select Instructor_Name
    -> from Instructor i
    -> where exists (
    -> select * from Course c
    -> where c.Instructor_ID = i.Instructor_ID);
+-------------------+
| Instructor_Name   |
+-------------------+
| Dr. Rajesh Kumar  |
| Dr. Neha Sharma   |
| Prof. Amit Verma  |
| Dr. Priya Mehta   |
| Prof. Karan Singh |
+-------------------+
5 rows in set (0.00 sec)

mysql> select Student_Name
    -> from Student s
    -> where not exists (
    -> select * from Submission sub
    -> where sub.Student_ID = s.Student_ID);
Empty set (0.00 sec)

mysql> select Course_Name, Credits
    -> from Course
    -> where Credits > any (
    -> select Credits
    ->  from Course
    -> where Department_ID = 2);
Empty set (0.00 sec)

mysql> select Course_Name, Credits
    -> from Course
    -> where Credits > all (
    -> select Credits
    -> from Course
    -> where Department_ID = 2);
Empty set (0.01 sec)

mysql> create view Student_Course_View as
    -> select Student.Student_ID,
    -> Student.Student_Name,
    -> Course.Course_Name,
    -> Enrollment.Enrollment_Date,
    -> Enrollment.Status
    -> from Student
    -> join Enrollment
    -> on Student.Student_ID = Enrollment.Student_ID
    -> join Course
    -> on Enrollment.Course_ID = Course.Course_ID;
Query OK, 0 rows affected (0.02 sec)

mysql> select * from Student_Course_View;
+------------+---------------+-----------------------------+-----------------+-----------+
| Student_ID | Student_Name  | Course_Name                 | Enrollment_Date | Status    |
+------------+---------------+-----------------------------+-----------------+-----------+
|        101 | Rahul Sharma  | Database Management Systems | 2026-02-01      | Active    |
|        103 | Aman Kumar    | Database Management Systems | 2026-02-02      | Active    |
|        107 | Rohan Gupta   | Database Management Systems | 2026-02-06      | Active    |
|        102 | Priya Singh   | Data Analytics              | 2026-02-01      | Active    |
|        106 | Simran Kaur   | Data Analytics              | 2026-02-03      | Active    |
|        104 | Neha Verma    | Web Development             | 2026-02-01      | Active    |
|        108 | Anjali Sharma | Web Development             | 2026-02-05      | Active    |
|        102 | Priya Singh   | Machine Learning            | 2026-02-03      | Active    |
|        105 | Arjun Mehta   | Machine Learning            | 2026-02-05      | Active    |
|        101 | Rahul Sharma  | Python Programming          | 2026-02-02      | Active    |
|        107 | Rohan Gupta   | Python Programming          | 2026-02-04      | Active    |
|        108 | Anjali Sharma | Python Programming          | 2026-02-07      | Completed |
|        103 | Aman Kumar    | Advanced SQL                | 2026-02-04      | Active    |
+------------+---------------+-----------------------------+-----------------+-----------+
13 rows in set (0.01 sec)

mysql> create index Idx_Course_Name
    -> on Course(Course_Name);
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select *
    -> from Course
    -> where Course_Name = 'Python Programming';
+-----------+--------------------+---------------------------------+---------+---------------+---------------+
| Course_ID | Course_Name        | Course_Description              | Credits | Instructor_ID | Department_ID |
+-----------+--------------------+---------------------------------+---------+---------------+---------------+
|       305 | Python Programming | Python programming fundamentals |       3 |           205 |             1 |
+-----------+--------------------+---------------------------------+---------+---------------+---------------+
1 row in set (0.00 sec)

mysql> show tables;
+---------------------+
| Tables_in_lms       |
+---------------------+
| assessment          |
| course              |
| department          |
| enrollment          |
| grade               |
| instructor          |
| learning_resource   |
| module              |
| student             |
| student_course_view |
| submission          |
+---------------------+
11 rows in set (0.00 sec)

mysql> select * from Student_Course_View;
+------------+---------------+-----------------------------+-----------------+-----------+
| Student_ID | Student_Name  | Course_Name                 | Enrollment_Date | Status    |
+------------+---------------+-----------------------------+-----------------+-----------+
|        103 | Aman Kumar    | Advanced SQL                | 2026-02-04      | Active    |
|        102 | Priya Singh   | Data Analytics              | 2026-02-01      | Active    |
|        106 | Simran Kaur   | Data Analytics              | 2026-02-03      | Active    |
|        101 | Rahul Sharma  | Database Management Systems | 2026-02-01      | Active    |
|        103 | Aman Kumar    | Database Management Systems | 2026-02-02      | Active    |
|        107 | Rohan Gupta   | Database Management Systems | 2026-02-06      | Active    |
|        102 | Priya Singh   | Machine Learning            | 2026-02-03      | Active    |
|        105 | Arjun Mehta   | Machine Learning            | 2026-02-05      | Active    |
|        101 | Rahul Sharma  | Python Programming          | 2026-02-02      | Active    |
|        107 | Rohan Gupta   | Python Programming          | 2026-02-04      | Active    |
|        108 | Anjali Sharma | Python Programming          | 2026-02-07      | Completed |
|        104 | Neha Verma    | Web Development             | 2026-02-01      | Active    |
|        108 | Anjali Sharma | Web Development             | 2026-02-05      | Active    |
+------------+---------------+-----------------------------+-----------------+-----------+
13 rows in set (0.00 sec)

mysql> select * from Course;
+-----------+-----------------------------+----------------------------------------------+---------+---------------+---------------+
| Course_ID | Course_Name                 | Course_Description                           | Credits | Instructor_ID | Department_ID |
+-----------+-----------------------------+----------------------------------------------+---------+---------------+---------------+
|       301 | Database Management Systems | Introduction to DBMS and SQL                 |       4 |           201 |             1 |
|       302 | Data Analytics              | Data analysis and visualization              |       4 |           202 |             2 |
|       303 | Web Development             | HTML CSS and JavaScript                      |       3 |           203 |             3 |
|       304 | Machine Learning            | Machine learning algorithms and applications |       4 |           204 |             4 |
|       305 | Python Programming          | Python programming fundamentals              |       3 |           205 |             1 |
|       306 | Advanced SQL                | Advanced database queries and optimization   |       3 |           201 |             1 |
+-----------+-----------------------------+----------------------------------------------+---------+---------------+---------------+
6 rows in set (0.00 sec)

mysql> select * from Grade;
+----------+---------------+----------------+-------+--------------------------+
| Grade_ID | Submission_ID | Marks_Obtained | Grade | Feedback                 |
+----------+---------------+----------------+-------+--------------------------+
|      901 |           801 |          18.00 | A     | Excellent performance    |
|      902 |           802 |          44.00 | A     | Very good SQL skills     |
|      903 |           803 |          15.00 | B     | Good understanding       |
|      904 |           804 |          17.00 | A     | Well done                |
|      905 |           805 |          42.00 | A     | Good analytical work     |
|      906 |           806 |          21.00 | B     | Good effort              |
|      907 |           807 |          85.00 | A     | Excellent understanding  |
|      908 |           808 |          46.00 | A     | Very good Python skills  |
|      909 |           809 |          39.00 | B     | Good work                |
|      910 |           810 |          88.00 | A     | Excellent SQL knowledge  |
|      911 |           811 |          14.00 | B     | Satisfactory performance |
|      912 |           812 |          76.00 | B     | Good understanding       |
+----------+---------------+----------------+-------+--------------------------+
12 rows in set (0.00 sec)

mysql>
