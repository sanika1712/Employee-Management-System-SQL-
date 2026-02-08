create database Project;
use project;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE,
    location VARCHAR(50)
);
mysql> desc Department;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| dept_id  | int         | NO   | PRI | NULL    |       |
| det_name | varchar(50) | YES  | UNI | NULL    |       |
| location | varchar(50) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
insert into Department values(01,"IT","Pune");
insert into Department values(02,"Finace","Solapur");
insert into Department values(03,"HR","Mumbai");
insert into Department values(04,"Devloper","Delhi");
insert into Department values(05,"Tester","Pune");

mysql> select * from Department;
+---------+----------+----------+
| dept_id | det_name | location |
+---------+----------+----------+
|       1 | Finace   | Solapur  |
|       2 | IT       | Pune     |
|       3 | HR       | Mumbai   |
|       4 | Devloper | Delhi    |
|       5 | Tester   | Pune     |
+---------+----------+----------+

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
mysql> desc Employee;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| Emp_id     | int           | NO   | PRI | NULL    |       |
| Emp_name   | varchar(50)   | YES  |     | NULL    |       |
| Emp_salary | decimal(10,2) | YES  |     | NULL    |       |
| dept_id    | int           | YES  | MUL | NULL    |       |
+------------+---------------+------+-----+---------+-------+

insert into Employee values(01,"Sanika",30000,01);
insert into Employee values(02,"Usha",50000,02);
insert into Employee values(03,"Mahesh",60000,03);
insert into Employee values(04,"Komal",70000,04);
insert into Employee values(05,"Sanika",80000,05);
insert into Employee values(06,"Avdi",80000,Null);

mysql> select * from Employee;
+--------+----------+------------+---------+
| Emp_id | Emp_name | Emp_salary | dept_id |
+--------+----------+------------+---------+
|      1 | Sanika   |   30000.00 |       1 |
|      2 | Usha     |   50000.00 |       2 |
|      3 | Mahesh   |   65000.00 |       3 |
|      4 | Komal    |   70000.00 |       4 |
|      5 | Sanika   |   80000.00 |       5 |
|      6 | Avdi     |   80000.00 |    NULL |
+--------+----------+------------+---------+

 update Employee set Emp_salary = 65000 where Emp_id = 3;
 +--------+----------+------------+---------+
| Emp_id | Emp_name | Emp_salary | dept_id |
+--------+----------+------------+---------+
|      1 | Sanika   |   30000.00 |       1 |
|      2 | Usha     |   50000.00 |       2 |
|      3 | Mahesh   |   65000.00 |       3 |
|      4 | Komal    |   70000.00 |       4 |
|      5 | Sanika   |   80000.00 |       5 |
+--------+----------+------------+---------+

select e.Emp_name,d.det_name from Employee e inner join Department d on d.dept_id = e.Emp_id;
+----------+----------+
| Emp_name | det_name |
+----------+----------+
| Sanika   | Finace   |
| Usha     | IT       |
| Mahesh   | HR       |
| Komal    | Devloper |
| Sanika   | Tester   |
+----------+----------+

 select e.Emp_name,d.det_name from Employee e left join Department d on d.dept_id = e.Emp_id;
+----------+----------+
| Emp_name | det_name |
+----------+----------+
| Sanika   | Finace   |
| Usha     | IT       |
| Mahesh   | HR       |
| Komal    | Devloper |
| Sanika   | Tester   |
+----------+----------+

mysql> select e.Emp_name,d.det_name from Employee e left join Department d on d.dept_id = e.Emp_id;
+----------+----------+
| Emp_name | det_name |
+----------+----------+
| Sanika   | Finace   |
| Usha     | IT       |
| Mahesh   | HR       |
| Komal    | Devloper |
| Sanika   | Tester   |
| Avdi     | NULL     |
+----------+----------+

mysql> select e.Emp_name,d.det_name from Employee e right join Department d on d.dept_id = e.Emp_id;
+----------+----------+
| Emp_name | det_name |
+----------+----------+
| Komal    | Devloper |
| Sanika   | Finace   |
| Mahesh   | HR       |
| Usha     | IT       |
| Sanika   | Tester   |
+----------+----------+



