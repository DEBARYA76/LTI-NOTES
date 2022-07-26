 CREATE TABLE tbl_student
(
rollno number(10) primary key,
name varchar2(50),
dateofbirth date,
qualification varchar2(50),
phoneno varchar2(15),
email    varchar2(20),
address   varchar2(50)
);
create sequence seq_stud start with 1001 increment by 1;
select * from tbl_student;




CREATE TABLE tbl_courses (

courseid number(10) primary key,
coursename varchar2(20),
duration number(2),
fee number (10,2),
eligibility varchar2(30)
)



create sequence seq_crs start with 2001 increment by 1;
select * from tbl_courses;




 CREATE TABLE tbl_registrations (
 regno number(20) primary key,
 regdate date,
 rollno number(10) references tbl_student(rollno),
 courseid number(10) references tbl_courses(courseid)
 );
 
 create sequence seq_req start with 10001 increment by 1;