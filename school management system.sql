create database collegedb;
use collegedb;
create table student
(
   s_id int primary key,
   name varchar (20),
   gender varchar(10),
   age int
   );
   insert into student
   values(101,'fatima','female',23),
   (102,'noor','female',24),
   (103,'shiza','female',25),
   (104,'ali','male',26),
   (105,'ahmad','male',29);
   select * from student;
create table course
(
     c_id int,
     c_name varchar(20),
     s_id int
     );
     insert into course
     values(201,'maths',101),
     (202,'english',102),
     (203,'urdu',103),
     (204,'quran',104),
     (205,'physics',105);
     select * from course;
     
     create table enrollment
     (
        e_id int,
        s_id int
        );
        insert into enrollment
        values(34,101),
        (35,102),
        (36,103),
        (39,104),
        (33,105);
        select * from enrollment;
        select *from student
        where s_id='101';
        select * from student
          where  age  between 20 and 24 ;
          select age
          from student
          order by age=18 asc;
          select sum(s_id) from student;
          select avg(s_id) from student;
          select age,name,gender,c_name
          from student
          inner join course
          on student.s_id=course.s_id;
          select age,gender,name,e_id
          from student
          left join enrollment
          on student.s_id=enrollment.s_id;
          select age,name,gender,c_name
          from student
          cross join course
          on student.s_id=course.s_id
          where c_id='203';
          create view student_1 as
          select age,name,gender
          from student;
          select * from student_1;
          
        drop database if exists collegedb;
   drop table  if exists student;
      drop table  if exists course;
         drop table  if exists enrollment;