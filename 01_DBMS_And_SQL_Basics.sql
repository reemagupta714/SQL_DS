# =========================================================
# DBMS & SQL BASICS - SESSION 1 & 2 CORE CONCEPTS
# =========================================================

# -------------------------
# DATABASE OPERATIONS
# -------------------------
create database example1;
use example1;

drop database example1;

create database pes_university;
use pes_university;


# -------------------------
# TABLE CREATION
# -------------------------
create table students(student_id int, student_name char(20));

desc students;

create table student2(
student_id int,
student_name char(20),
c1 float,
c2 decimal,
c3 double
);


# -------------------------
# INSERT OPERATIONS
# -------------------------
insert into students(student_id, student_name)
value(255, 'Mahesh');

insert into students(student_id, student_name)
value(240, 'Mukesh'), (102, 'Ram'), (103, 'Prakash');


# -------------------------
# DATA TYPES DEMO
# -------------------------
select curdate();

create table student3(
student_id int,
student_name char(5),
dob date,
birth_time time,
birth_year year
);


insert into student3(student_id , student_name, dob, birth_time, birth_year)
values (101, 'john', '1996-07-07', '11:34:00', '1996');


# -------------------------
# ALTER OPERATIONS
# -------------------------
alter table student2 drop column c2;
alter table student2 add c4 int;

select * from student2;


# -------------------------
# UPDATE DEMO
# -------------------------
set SQL_SAFE_UPDATES=0;

update student2 
set c4=10;