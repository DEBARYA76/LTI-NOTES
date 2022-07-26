----------Day 2
select * from employees

select count(*) from employees where salary>any(select salary from employees);

select employee_id,first_name,salary from employees  -- column selection: Project operation
select * from employees where salary>5000 -- where is used for filtering the rows: Select operation
select employee_id,first_name,salary from employees where salary>5000 -- Project+Select

-- customizing the column names
select employee_id "Employee ID",first_name "Employee Name",salary "Employee Salary" from employees
where salary>5000

select employee_id,salary*12 "Annual CTC" from employees   -- select the return a resultset(set of row)
desc employees

-- aggregate function: it gives you summarized data

-- find out the total salary paid to all employees in the organization
select sum(salary) "Total Salary Paid" from employees
-- find out the average salary paid to each employees in the organization
select avg(salary) "Average Salary Paid" from employees
-- find out the highest salary paid in the organization
select max(salary) "Highest Salary Paid" from employees
-- find out the lowestest salary paid in the organization
select min(salary) "Lowest Salary Paid" from employees
-- extract total number of employees working in the organization
select count(*) "Total Employees" from employees

select * from employees
-- fetch number of employees getting commission
select count(*) "Emp With Commission" from employees where commission_pct is not null --35
-- fetch number of employees not getting commission
select count(*) "Emp With Commission" from employees where commission_pct is null   -- 72

select count(commission_pct) from employees  -- count only takes not null values

-- find out the total salary paid to IT programmers
select sum(salary) from employees where job_id='IT_PROG'
-- find out the total salary paid to IT prgammers and ST_CLERK
select * from employees where job_id='IT_PROG' or job_id='ST_CLERK'
select sum(salary) from employees where job_id='IT_PROG' or job_id='ST_CLERK'
-- find out total saalry paid to all job IDs
select job_id,sum(salary) from employees group by job_id
-- the list of columns which you want to display must either be into an aggregate function 
-- or it is part of grup by clause

-- find out the sum of salary of job IDs : IT_PROG,PU_MAN,FI_ACCOUNT
select job_id,sum(salary) from employees where job_id in('IT_PROG','PU_MAN','FI_ACCOUNT') group by job_id

--select salary,count(salary) from employees group by salary

-- find out sum of salary of each job_id which are greater than 20000
select job_id,sum(salary) from employees group by job_id having sum(salary)>20000

select job_id, sum(salary) from employees where job_id in('IT_PROG','PU_MAN','FI_ACCOUNT') group by job_id
-- from-->where-->group by--> having-->

--select job_id, sum(salary) from employees having job_id in('IT_PROG','PU_MAN','FI_ACCOUNT') group by job_id

select job_id, sum(salary) from employees where job_id in('IT_PROG','PU_MAN','FI_ACCOUNT') group by job_id
order by sum(salary) desc

select job_id, sum(salary) from employees group by job_id having job_id in('IT_PROG','PU_MAN','FI_ACCOUNT') 
order by sum(salary) desc

-- find out sum of salary of these department 'IT_PROG','PU_MAN','FI_ACCOUNT' 
--where sum of salary is greater the 20000
select job_id, sum(salary) from employees where job_id in('IT_PROG','PU_MAN','FI_ACCOUNT') group by job_id
having sum(salary)>20000 order by sum(salary) desc

--1.Display average salary of employees in each department who have commission percentage.
select department_id,avg(salary) "Average of salary" from employees where commission_pct is not null
 group by department_id having department_id is not null;
 
--2.Display job ID, number of employees, sum of salary, and difference between highest salary 
  --and lowest salary of the employees of the job.
  SELECT job_id, COUNT(*), SUM(salary),
    MAX(salary)-MIN(salary) AS salary_difference
        FROM employees
            GROUP BY job_id;

select job_id,count(employee_id) "Number of employees",sum(salary) "Sum of salary",
max(salary)-min(salary) "Difference of salary" from employees group by job_id

--3.Display job ID for jobs with average salary more than 10000.
select job_id from employees group by job_id having avg(salary)>10000
select job_id,avg(salary) from employees group by job_id having avg(salary)>10000

--4.Display departments in which more than five employees have commission percentage.
select department_id,count(commission_pct) from employees group by department_id having count(commission_pct)>5
select  department_id from employees where commission_pct is not null group by department_id 
   having count(commission_pct)>5
select  department_id from employees group by department_id having count(commission_pct)>5
select department_id from employees where commission_pct is not null group by department_id having count(*)>5

--5.Display employee ID for employees who did more than one job in the past. (job_history)
select * from job_history
select employee_id from job_history group by employee_id having count(employee_id) > 1;

select job_id, sum(salary) from employees where salary > 20000 group by job_id;

select job_id, sum(salary) from hr.employees group by job_id having sum(salary) >20000;

--------------------Oracle Built-in functions------------------------------------------------
--1. numeric functions
-- dual table: It is a single row- single column table. It is basically used to store calculated result/temporary
-- data without using a table. It is also called a dummy table

select 10+5 from dual

select sysdate from dual

select abs(-120) from dual
select abs(120) from dual

select ceil(2.3) from dual
select ceil(2.8) from dual

select floor(2.3) from dual
select floor(2.8) from dual

select round(2.452) from dual
select round(2.452,1) from dual
select round(2.422,1) from dual
select round(2.422,2) from dual
select round(2.427,2) from dual

select trunc(230.576) from dual
select trunc(230.576,1) from dual
select trunc(230.576,2) from dual
select trunc(230.576,0) from dual
select trunc(230.576,-1) from dual
select trunc(456.576,-1) from dual
select trunc(456.576,-2) from dual
select trunc(456847.576,-2) from dual


select department_id,round(avg(salary),2) from employees group by department_id



--2. Character functions

select length('Simant Setu') from dual
--lower(),upper(),initcap()
select '    Simant Setu       ' from dual
select ltrim('    Simant Setu       ') from dual
select rtrim('    Simant Setu       ') from dual
select trim('    Simant Setu       ') from dual

select instr('Hi, Hello, how are you doing','are') from dual
select instr('Hi, Hello, how are you doing? We are here to learn built-in functions','are') from dual
select instr('Hi, Hello, how are you doing? We are here to learn built-in functions','are',19) from dual

select substr('Hi, Hello, how are you doing? We are here to learn built-in functions',5,26) from dual
--a. Display first name and last name after converting the first letter of each name to upper case and 
   --the rest to lower case.
   select initcap(first_name),initcap(last_name) from employees;
   
--b. Display the length of first name for employees where last name contain character ‘b’ after 3rd position.
    
    select length(FIRST_NAME),LAST_NAME from employees where instr(last_name,'b') > 3
    
    select instr(last_name,'b',4),last_name from employees where instr(last_name,'b')>3
    select length(first_name) "First Name",last_name from employees where instr(last_name,'b',4)!=0;
    select length(first_name),last_name,length(first_name) from employees where last_name like '___%b%';
                                                                                
--c. Display first name in upper case and email address in lower case for employees where the first name 
--   and email address are same irrespective of the case.
    select first_name,last_name,email from employees
    select upper(first_name),lower(email)from employees where instr(email,first_name)>0;
    select upper(first_name),lower(email) from employees where lower(first_name)=lower(email);
--d. Display the first word in job title.
    select * from jobs
    select substr(job_title, 1, instr(concat(job_title,' ') , ' ')-1) from jobs
    
    --select nvl(trim(substr(job_title, 1, instr(job_title, ' ') - 1)), job_title) "job title" from jobs;
    
    select substr('Simant Setu',1,instr('Simant Setu',' ')-1) from dual
    select instr('Simant Setu',' ')-1 from dual
    President 
    Administration Vice President 
    
    desc employees
     
--3. Date functions
    select sysdate from dual
    select add_months(sysdate,2) from dual
    select round(months_between(sysdate,'01-01-2021')) from dual
    select last_day(sysdate) from dual
    -- rounding a date
    select round(sysdate) from dual
    select round(to_date('05-10-2021','DD-MM-YYYY'),'MONTH') from dual
    select round(to_date('16-10-2021'),'MONTH') from dual
    
    select round(to_date('20-01-2021','DD-MM-YYYY'),'MONTH') from dual
    
    select round(to_date('10-02-2021','DD-MM-YYYY'),'DAY') from dual  -- start day of the week
    
    select round(to_date('20-01-2021','DD-MM-YYYY'),'YEAR') from dual
    
    select round(to_date('20-07-2021','DD-MM-YYYY'),'YEAR') from dual
    
    select round(2.6) from dual
    
    select trunc(to_date('20-07-2021','DD-MM-YYYY'),'MM') from dual   -- first day of the current month
    
    select trunc(to_date('20-07-2021','DD-MM-YYYY'),'YYYY') from dual --first month of the year
    
    select trunc(to_date('03-02-2021','DD-MM-YYYY'),'DAY') from dual
    
    select trunc(to_date('20-02-2021','DD-MM-YYYY'),'DAY') from dual  --start day of the week
    
    select trunc(to_date('16-02-2021','DD-MM-YYYY'),'DAY') from dual  --start day of the week
    
--4. Conversion functions
--to_char() : converts numeric or date values to a character string
 select to_char(sysdate) from dual
 select to_char( sysdate,'MONTH') from dual
 select to_char( sysdate,'MM') from dual
select to_char( sysdate,'MON') from dual

select to_char( sysdate,'YY') from dual
select to_char( sysdate,'YYYY') from dual

select to_char( sysdate,'DD') from dual
select to_char( sysdate,'DAY') from dual
select to_char( to_date('01-10-2021','DD-MM-YYYY'),'DAY') from dual

-- list all employees who have joined in year 2007
select * from employees where to_char(hire_date,'YYYY')=2007
-- Display the number of days between system date and 1st January 2019.
SELECT round(SYSDATE - to_date('01-jan-2019')) FROM DUAL
SELECT trunc(SYSDATE - to_date('01-jan-2019')) FROM DUAL

-- display employees who have joined after 15th of any month in year 2007.
select employee_id, hire_date from employees where to_char(hire_date, 'DD') > 15 
                            and to_char(hire_date, 'YYYY') = '2007';

-- nvl(): is used to replace null values with any specified value
select * from employees
select salary,nvl(commission_pct,0),salary+salary*nvl(commission_pct,0) "Total Earning" from employees
-- display employee id and CTC of each employees
select employee_id, salary, nvl(commission_pct,0)"Commission", 
      (salary+salary*nvl(commission_pct,0))*12 "Total Salary" from employees

--nvl2(): if(x!=null) do something  
        --else do another something

select nvl2(40,'not null','null') from dual

-- display employee id ,current salary,current commission, incremented commmission,incremented salary
   --as per below condition
  -- if no commission then increment it to 0.02 or increment it to 0.01 

select employee_id,salary "Current Salary",nvl(commission_pct,0) "current commission",
                   nvl(commission_pct,0)+nvl2(commission_pct,0.01,0.02) "increment commission",
                   salary+(nvl(commission_pct,0)+nvl2(commission_pct,0.01,0.02))*salary "Incremented Salary"
                   from employees

select employee_id,salary  "Current Salary",nvl(commission_pct,0)"Current Commission",
nvl2(commission_pct,commission_pct+0.01,0.02)"Incremented Commission",
salary+(nvl2(commission_pct,commission_pct+0.01,0.02)*salary) "Incremented Salary"from employees


decode():
if (true) then X1
else if(true) then X2
else if(true) then X3
else X4

select decode(500,
              100,'100 rupees',
              200,'200 rupees',
              300,'300 rupees',
              'No money') from dual
select * from departments
select department_id,decode(department_id,10,'Admin',20,'Market',40,'HR','Generic') "Short Names" from departments
--Calculate revised salary of employees based on their job_id.
 IT_PROG : 0.05%
 ST_CLERK: 0.03%
 AC_ACCOUNT: 0.01%
 employee_id, job_id,current_salary,incremented salary

select employee_id, job_id, salary,salary+ decode(job_id, 
                                            'IT_PROG', salary*0.05,
                                            'ST_CLERK',salary*0.03, 
                                            'AC_ACCOUNT',salary*0.01,
                                            0) 
                                            "Incremented Salary" from employees
                                    where job_id in ('IT_PROG', 'ST_CLERK', 'AC_ACCOUNT');

select employee_id,job_id, Salary "Regular Salary",
       salary+salary*decode(job_id,'IT_PROG',0.05,'ST_CLERK',0.03,'AC_ACCOUNT',0.01,0) "Incremented Salary"
       from employees

---------------------------Joins-----------------------------------------------
--Joins: are used to display information from one or more than one table based on some condition or no condition.
--Types of Joins: Equi and Non-Equi 

--inner join: to be used when want to display only matching rows from both tables.
select employee_id,first_name,e.department_id,department_name 
from employees e
join
departments d
on e.department_id=d.department_id  -- column names can be different but same type. It can be equi or non-equi
                                    -- must use a qualifier(alias)
select employee_id,first_name,e.department_id,department_name 
from employees e,departments d
where e.department_id=d.department_id

select employee_id,first_name,department_id,department_name 
from employees e
join
departments d
using(department_id)  -- column names must be same. and it is always an equi join. cannot user any qualifier(alias)
-- list employee and department details of those employees whose manager and department are same.
select employee_id,first_name,department_id,department_name 
from employees e
natural join
departments d
--using(department_id)   -- natural join and using are mutually excluisive

select employee_id,first_name,e.department_id,department_name 
from employees e
join
departments d
on e.department_id=d.department_id and e.manager_id=d.manager_id

select employee_id,first_name,department_id,department_name 
from employees e
join
departments d
using(department_id,manager_id)

select * from employees
select * from departments

select employee_id,first_name,e.department_id,department_name 
from employees e
join
departments d
on e.department_id!=d.department_id

select employee_id,first_name,department_id,department_name 
from employees e
join
departments d
on e.department_id>d.department_id

-- Outer join: display data either from one table or both table
-- left outer: displays all rows(matching/non-matching) from left table and only matching records from right table.
-- right outer: displays all rows(matching/non-matching) from right table and only matching records from leftt table.
-- full outer: displays all rows(matching/non-matching) from both table.

--Display department name and number of employees in the department.
SELECT employees.department_id,department_name "Dept Name",
COUNT(*) "Total Emp"
FROM departments
INNER JOIN employees 
ON employees.department_id = departments.department_id
GROUP BY employees.department_id, department_name
ORDER BY department_name asc;

SELECT department_name "Dept Name",
COUNT(*) "Total Emp"
FROM departments
INNER JOIN employees
ON employees.department_id = departments.department_id
GROUP BY department_name
ORDER BY department_name asc;


select department_name, count(*)
from departments d
inner join employees e
on e.department_id=d.department_id
group by e.department_id,department_name

select department_name,count(employee_id) "total emp" from departments d,employees e
where d.department_id=e.department_id group by department_name


--Display department name and manager first name.
select department_name, first_name from employees join departments 
on employees.employee_id = departments.manager_id;

select * from departments
select * from employees

select * from employees
natural join
departments 

select * from employees
join
departments using(department_id)

--Self Join

select e1.employee_id,e1.first_name "Employee Name",e2.employee_id "Manager Id",e2.first_name "Manager Name"
from employees e1 join employees e2
on e1.manager_id=e2.employee_id

--1.
-- list all employees(id,first_name) and their manager(manager_id,first_name) 
-- where employee has joined the organization on the same date as his/her manager.

select e1.employee_id,e1.first_name "Employee Name",e2.employee_id "Manager Id",e2.first_name "Manager Name"
from employees e1 join employees e2
on e1.manager_id=e2.employee_id and e1.hire_date=e2.hire_date

select e1.employee_id,e1.first_name "Employee Name",e2.employee_id "Manager Id",e2.first_name "Manager Name"
from employees e1,employees e2
where e1.manager_id=e2.employee_id and e1.hire_date=e2.hire_date

-- list employees who are in the same role.
select e1.employee_id "Employee1",e1.first_name  "Employee1 Name",
       e2.employee_id "Employee2",e2.first_name "Employee2 Name",
       e1.job_id
    from employees e1,employees e2
    where e1.job_id=e2.job_id and e1.employee_id<>e2.employee_id
    --and e1.job_id='IT_PROG' order by e1.first_name
    
select e1.employee_id "Employee1",e1.first_name  "Employee1 Name",
       e2.employee_id "Employee2",e2.first_name "Employee2 Name",
       e1.job_id
    from employees e1 join employees e2
    on e1.job_id=e2.job_id and e1.employee_id!=e2.employee_id
    --and e1.job_id='IT_PROG' order by e1.first_name
    
select employee_id,job_id from employees

select e1.employee_id,e1.first_name"Emp 1 Name",e1.job_id "Job Role",e2.first_name "Emp 2 Name"
from employees e1
left join employees e2
on e1.job_id=e2.job_id and e1.employee_id<>e2.employee_id
order by e1.job_id 

select distinct e1.employee_id, e1.first_name "EMPLOYEE NAME", e2.employee_id, e2.first_name "EMPLOYEE NAME",
e1.job_id, e2.job_id
from hr.employees e1
join hr.employees e2
on e1.employee_id!=e2.employee_id and e2.job_id = e1.job_id 

----------Day 4-----------------

--cross join (cartesian product): combination of each row with all the rows of another table.

select * from departments --27
select * from locations  -- 23
-- total no. of rows - 621
select * from departments,locations

select * from departments
cross join
locations

trainees
PSNo Name 
 101 Jinal
 102 Rukhsar
 
java_course
moduleId moduleName duration
 1        Oracle       5
 2        Core Java    6
 3         Codility    7

customers


Offers
1   rrr  
2   ttt

size

L
XL
XXL
XXL

Garments
  101  Shirt 
  102  T-Shirt

101 Shirt L 50
102 Shirt XL 40

-- union 
select employee_id,first_name,manager_id from employees    --107
union
select department_id,department_name,manager_id from departments --27

A={1,2,3}
B{5,6}
A U B={1,2,3,5,6}

desc departments

Batch1
BatchCode PS No Name Technology 
  919     111   Dhruv  Java     
  
Batch2
BatchCode PS No Name    Technology 
  912     222  Yugandhra  Java     
  select * from Batch1
  union
select * from Batch2

----------------------------Sub Queries-----------------------------------------
--Query within another Query

retreive data1 from (which is yet to be retrieved)
-- display all employees whose salary is higher than average salary of all employees.
select * from employees where salary>(select avg(salary) from employees)

-- display all employees whose salary is higher than highest salaried employee of department 30.
select * from employees where salary > ( select max(salary) from employees where department_id =30)

-- display full names of employees whose salary is less than or equal to Lisa's salary
SELECT employee_id, first_name||' '||last_name "Name", salary
FROM employees
WHERE salary <= ( SELECT salary
FROM employees
WHERE first_name='Lisa' )

--display all employees whose salary is higher than max salary of
-- all these department_id 10,20,30,40,50
select * from employees where salary>(select max(salary) from employees where department_id in (10,20,30,40,50));

--display first_name,salary of employee who work in the Lex's department
select first_name||' '||last_name "Full Name", salary from employees 
where department_id = (select department_id from employees where first_name='Lex')

select first_name||' '||last_name "Full Name", salary from employees 
where department_id = (select department_id from employees where first_name='Lex') and first_name!='Lex'

select e1.first_name || e1.last_name from employees e1 
join employees e2 on e1.department_id=e2.department_id where e2.first_name='Lex'

-- display employees who work in purchasing department.
select employee_id,first_name,deparment_id from employees
where department_id=(select department_id from departments where department_name='Purchasing')

-- display employees who work in 'Seattle'.
select *
from employees
where department_id in
(
  Select department_id from departments where location_id in
  (
    select location_id from locations where city = 'Seattle'
  )
)

-- display employees who salary is higher than highest salaries of department 30,40 and 50.

select * from employees where salary>
        (select max(salary) from employees where department_id in(30,40,50))
        

-- display employees who salary is higher than highest salaries of any of these department 30,40 and 50.

select * from employees where salary>any
                (select max(salary) from employees where department_id in(30,40,50) group by department_id)
                order by salary desc
11000,8200,6500

--Display jobs into which employees joined in the year 2007.
select job_title from jobs where job_id in(select job_id from employees where to_char(hire_date,'YYYY')=2007)

-- any and all : works for multiple values in the inner query.
select * from employees where salary=any(10000,11500,20000)   -- similar to in operator
select * from employees where salary<any(10000,11500,20000)
select * from employees where salary>any(10000,11500,20000)
select * from employees where salary<>any(10000,11500,20000)

select * from employees where salary=all(10000,11500,20000)   -- invalid
select * from employees where salary<all(10000,11500,20000)
select * from employees where salary>all(10000,11500,20000)
select * from employees where salary<>all(10000,11500,20000)

---------------------- Co-related subqueries-------------
--while in subqueries, outer query depends on inner query, 
--in correlated subquery, inner query depends on outer query

--display employee details(id,firstname) whose salary is greater than average salary of his/her department
select employee_id,first_name,salary,department_id from employees emp where salary>
                    (select avg(salary) from employees where department_id=emp.department_id);

select avg(salary) from employees where department_id=90

-- display 2nd highest salary.
select * from employees order by salary desc

select max(salary) from employees where salary <>(select max(salary) from employees)

select salary from employees
where salary = (select max(salary) from employees
where salary < (select max(salary) from employees)) and rownum=1

select first_name,salary from employees
where salary = (select max(salary) from employees
where salary < (select max(salary) from employees))

select max(salary)"2nd Highest Salary" from employees where salary<(select max(salary)from employees)

select distinct salary from employees emp where  1 =
            (select count( distinct salary ) from employees where  salary>emp.salary)
-- find the third highest salary
select distinct salary from employees emp where  2 =
            (select count( distinct salary ) from employees where  salary>emp.salary)
            
select count(distinct salary ) from employees where  salary>14000
select * from employees order by salary desc

------------------------------------------*************------------------------------------------------
-- 	 command : 
--is used to apply on the sturcture of the database objects(tables,views,cursor,triggers,procedure,
                                                            --functions,sequences)
                                                                               
-- DDL commands are create, alter , drop, truncate
-- LTI Bank: Customer(customer_id,name,mobile,city,email)
            --Account(account_no,account_type,balance,password)
            --Transaction(transaction_id,transaction_date,trnsaction_type,amount)
drop table customer
create table lti_customer
(
    customer_id number(5) primary key,   -- entity integrity constraint
    name varchar2(50) not null,          -- not null constraint
    mobile_no varchar2(10) unique,       -- unique key constraint
    city varchar2(30),
    email varchar2(20)
    --customer_age number check(customer_age between 18 and 25) : will add this column using alter
) --difference between primary key and unique key: A unique key can be null once.
create table lti_account
(
    account_no number(10),
    account_type varchar2(10) check(account_type in('savings','current')), --domain integrity
    balance number(10,2) not null,                   --99999999.99
    cust_id number(5) references lti_customer(customer_id) -- referential integrity constraints   
)

desc lti_customer
desc lti_account
-- adding column in the existing table
alter table lti_customer add customer_age number
-- modify column in the existing table
alter table lti_customer modify customer_age number(3)
-- apply constraint on existing column
alter table lti_customer add constraint chkAge check(customer_age between 18 and 25)

select * from user_constraints where constraint_name='CHKAGE'
select * from user_constraints where table_name='LTI_CUSTOMER'
select * from user_constraints where table_name='LTI_ACCOUNT'
-- adding primary key constraints for account no
alter table lti_account add constraint pk_acc primary key(account_no)

create table lti_transaction
(
    transaction_id number(10),
    transaction_date date default sysdate,      -- default constraint
    transaction_type varchar2(10) check(transaction_type in('credit','debit')),
    amount number(10,2) check(amount>0 and amount<=25000),
    account_no number(10),
    primary key(transaction_id),
    foreign key(account_no) references lti_account(account_no)
)

select * from user_constraintS where table_name='LTI_ACCOUNT'

alter table lti_account drop constraint SYS_C007642

alter table lti_account add constraint fk_acc foreign key(cust_id)   
                          references lti_customer(customer_id) on delete cascade

desc lti_account
desc lti_customer

create sequence seq_customer start with 1000 increment by 1

insert into lti_customer values(seq_customer.nextval,'Mark','9869695','London','mark@lti.com',21)
insert into lti_customer values(seq_customer.nextval,'James','45639695','Paris','james@lti.com',22)
select * from lti_customer

create sequence seq_lti_acc start with 50000 increment by 1
insert into lti_account values(seq_lti_acc.nextval,'savings',3500,1001)
insert into lti_account values(seq_lti_acc.nextval,'savings',7500,1002)
insert into lti_account values(seq_lti_acc.nextval,'savings',8500,1002)
desc lti_account
select * from lti_account
select * from lti_customer
delete from lti_customer where city='London'
--truncate: also deletes the rows but it will delete all the rows of the table(you cannot user where clause)
-- Why truncate is a DDL command?? : truncate drops the table and recreate it.
-- when use delete, it deletes records one by one, while truncate removes records all at once.
-- truncate does not work in case of triggers
-- delete operation can be rolled back, but truncated data cannot be rolledback.
 -- Hence, truncate is not explicit transaction
-- When should we use truncate? when we want to reset the table
-- when use delete, it returns you number of rows deleted, but truncate does not return anything.

truncate table lti_customer
drop table lti_customer

-- update is a DML command
select * from lti_customer
update lti_customer set city='Venice' where customer_id=1001
--alter: is a DDL command which is used to change the structure of the table and not the records(data)
alter table lti_customer drop column customer_age
desc lti_customer

select e.department_id,department_name,count(employee_id) from employees e
join
departments d
on e.department_id=d.department_id
group by e.department_id,department_name
select count(*) from employees group by department_id
select * from employees
select * from departments

----------------------- PL/SQL---------------------------------------------------

--PL(Procedural Language)

--procedure: is a block of statements(instruction) which we write once, 
--get it compiled(execution plan is already created),and execute many times.
-- declaring variable, if else, for while 
-- intermediate values
-- customized outputs or messages

-- In PL/SQL, there can be two tpyes of blocks: Anonymous block and named block

declare  -- optional

begin

exception  -- optional
end;

set serveroutput on
begin
dbms_output.put_line('First anonymous block');
end;

declare 
    num1 number(10);
    num2 number(10);
begin
    num1:=10;        --assign value to a variable  :=
    num2:=30;
    dbms_output.put_line('Sum= '||(num1+num2));
end;

declare 
    radius number(10) default 10;
    pi constant number:=3.14;
begin
    dbms_output.put_line('Area of circle= '||(pi*radius*radius));
end;

declare 
    radius number(10):=&r;
    pi constant number:=3.14;
begin
    dbms_output.put_line('Area of circle= '||(pi*radius*radius));
end;

declare 
    emp_id number(10):=&employeeid; 
    emp_fname varchar2(50);
    emp_lname varchar2(50);
begin
        select first_name,last_name into emp_fname,emp_lname from employees where employee_id=emp_id;
        dbms_output.put_line('Hello '||emp_fname||' '||emp_lname);
end;

declare 
    emp_id number(10):=&employeeid; 
    emp_fname employees.first_name%type;     --anchor types
    emp_lname employees.last_name%type;
begin
        select first_name,last_name into emp_fname,emp_lname from employees where employee_id=emp_id;
        dbms_output.put_line('Hello '||emp_fname||' '||emp_lname);
end;

    
declare 
    emp_id number(10):=&employeeid; 
    emp_row employees%rowtype;
begin
        select * into emp_row from employees where employee_id=emp_id;
        dbms_output.put_line(emp_row.employee_id||''||emp_row.first_name||' '||emp_row.last_name||' '||emp_row.salary);
end;

-- if then else

declare
    num1 number(10):=&num1;
    num2 number(10):=&num2;
begin
    if num1>num2 then
        dbms_output.put_line(num1||' is greater');
    else
        dbms_output.put_line(num2||' is greater');
    end if;
end;

declare
    num1 number(10):=&num1;
    num2 number(10):=&num2;
begin
    if num1=num2 then
        dbms_output.put_line('both are equal');
    elsif num1>num2 then
        dbms_output.put_line(num1||' is greater');
    else
        dbms_output.put_line(num2||' is greater');
    end if;
end;

-- write a pl/sql block to check whether the employee recieves commission or not and display appropriate meesage
-- and display their salary based on commission

declare
  emp_id number(10) :=&id;
  emp_row employees%rowtype;
begin
   select * into emp_row from employees where employee_id = emp_id;
   if emp_row.commission_pct is null then
      dbms_output.put_line('Employee has no commission pct');
   else
     dbms_output.put_line('Employee has commission pct of '||emp_row.commission_pct);
   end if;
   dbms_output.put_line('Total Salary : '||(emp_row.salary + emp_row.salary * nvl(emp_row.commission_pct,0)));
end;


-- write pl/sql block to determine the category of employee based on salary
-- salary>=15000 'High salary', salary>=8000 'Average salary'. else 'Low salary'

declare
    emp_id number(10):=&empid;
    emp_salary employees.salary%type;
begin
    select salary into emp_salary from employees where employee_id = emp_id; -- exception occurred here
    dbms_output.put_line('Salary is: '||emp_salary);
    if emp_salary >= 15000 then
        dbms_output.put_line('Employee category is High ' || emp_salary);
    elsif emp_salary >= 8000 and emp_salary < 15000 then
        dbms_output.put_line('Employee category is Average ' || emp_salary);
    else
        dbms_output.put_line('Employee category is Low ' || emp_salary);
    end if;
    exception when NO_DATA_FOUND then dbms_output.put_line('No employee present with id '||emp_id);
    dbms_output.put_line('End of Block');
end;

declare
salary number(10):=&enteryoursalary;
amount constant number:=15000;
am constant number:=8000;
begin
if salary>=amount then
dbms_output.put_line('high salary');
elsif salary>am then
dbms_output.put_line('average salary');
else
dbms_output.put_line('low salary');
end if;
end;

--case statement: simple case, searched case

--searched case

100  24000 High Salary
101  17000 High Salary
select employee_id,salary,
                        (case 
                            when salary>=15000 then 'High Salary' 
                            when salary>=8000 then 'Average Salary'
                            else 'Low Salary'
                         end
                        ) "Comments"
from employees

declare 
    emp_id number(10):=&empid;
    emp_salary employees.salary%type;
    salgrade varchar2(50);
begin
    select salary into emp_salary from employees where employee_id=emp_id;
    salgrade:=case 
            when emp_salary>=15000 then 'High Salary' 
            when emp_salary>=8000 then 'Average Salary'
            else 'Low Salary'
        end;
    dbms_output.put_line('Your salary '||emp_salary||' falls under '|| salgrade||' category');
end;


--Simple case

select * from departments
select department_id,department_name,(case department_id when 10 then 'Admin'
                                                         when 20 then 'Mktng'
                                                         when 30 then 'Purchse'
                                                         when 40 then 'HR'
                                                         else 'Unknown'
                                      end) "Short Name"
                            from departments where department_id in(10,20,30,40,50,60,70)

--Write a PL/SQL program to accept a date from user
-- and check whether a date falls on weekend i.e. SATURDAY or SUNDAY or not.
-- Hurray!!! It's a weekend. else Sorry!! You have to work today.

declare
dt date := to_date('&new_date', 'DD-MM-YYYY');
get_day varchar2(15);
begin
get_day := TO_CHAR(dt, 'DAY');
if get_day in ('MONDAY', 'FRIDAY') then                  -- 'MONDAY   ' != 'MONDAY'
dbms_output.put_line('hooray! weekend');
else
dbms_output.put_line ('sorry! kaam karna padega');
end if;
end;

--[MONDAY   ]
--[TUESDAY  ] 

begin
    for i in 1..10 loop
        dbms_output.put_line(i);        
    end loop;
end;

declare
    i number:=11;
begin
    while i<=20 
    loop
        dbms_output.put_line(i);
        i:=i+1;
    end loop;
end;


-- loop ...end loop
-- calculate the sum upto n natural numbers.
declare
    n number(5):=&last_term;
    res number(10) default 0;
    i number(10):=1;
begin
    loop 
        res:=res+i;
        i:=i+1;
        if i>n then 
            exit;
        end if;
    end loop;
    dbms_output.put_line('Sum= '||res);
end;


declare
    n number(5):=&last_term;
    res number(10) default 0;
    i number(10):=1;
begin
    loop 
        res:=res+i;
        i:=i+1;
        if i>n then 
            goto afterloop;
        end if;
    end loop;
    <<afterloop>>
    dbms_output.put_line('Sum= '||res);
end;

declare
    n number(5):=&last_term;
    res number(10) default 0;
    i number(10):=1;
begin
        <<firstline>>
        res:=res+i;
        i:=i+1;
        if i>n then 
            goto afterloop;
        end if;
        goto firstline;
        
    <<afterloop>>
    dbms_output.put_line('Sum= '||res);
end;
---------------------------------------------------------------------------------
--Named blocks(procedure,functions,triggers,packages.....)
create or replace procedure sayHello
is
begin
    dbms_output.put_line('Hello Procedure. How are you??');
end;

exec sayHello

--procedure: are generally used to perform DML operations in the table(e.g: update salary,modify employee details)
--functions: calculation, conversion and must return value
create or replace function addNum(num1 in number,num2 in number)
return number
is
begin
    return num1+num2;
end;

select addNum(10,30) from dual

declare
    res number(6);
begin
    res:=addNum(&num1,&num2);
    dbms_output.put_line('Sum ='||res);
end;

create table emp as select * from employees
select * from emp
-- create a procudre to accept employeeid and increment percentage to increment the salary of an employee.
-- increment only if the salary is less than or equal to 5000.
create or replace procedure incrSal(emp_id in number,incr in number)
is
empsal emp.salary%type;
begin
    select salary into empsal from emp where employee_id=emp_id;
    if empsal<=5000 then
        empsal:=empsal+empsal*incr;
        update emp set salary=empsal where employee_id=emp_id;
        dbms_output.put_line('Congratulation!! Your new salary is: '||empsal);
    else
        dbms_output.put_line('Sorry!! No increment this year.');
    end if;
    exception when NO_DATA_FOUND then dbms_output.put_line('Invalid employee id');
end;
select * from emp where salary<=5000   -- david 4800 

exec incrSal(105,0.10)


create or replace procedure incrSal(emp_id in number,incr in number,newSal out number)
is
empsal emp.salary%type;
begin
    select salary into empsal from emp where employee_id=emp_id;
    if empsal<=5000 then
        empsal:=empsal+empsal*incr;
        update emp set salary=empsal where employee_id=emp_id;
    end if;
    --select salary into newSal from emp where employee_id=emp_id;
    newSal:=empsal;
    exception when NO_DATA_FOUND then dbms_output.put_line('Invalid employee id');
end;

select * from emp where salary<=5000   -- 106 4800 
select * from emp where employee_id=107
set serveroutput on
declare
    mySal emp.salary%type;
begin
    incrSal(107,0.05,mySal);
    dbms_output.put_line('New salary: '||mySal);
end;

--exec incrSal(106,0.05,mySal);

-- write a function which will return the total salary of a particular department.
create or replace function totalSal(dept_id in number)
return number --declare the return type
is
total number; 
begin
select sum(salary) into total from employees
where department_id = dept_id;
return total;      -- returning data
end;

select totalSal(500) from dual

----------------Cursors---------------------------------------
--Cursor is a special type of variable which is used to navigate through records and acts as a pointer to a row.
select * from employees where department_id=10 -- implicit cursor
update employee set salary=10000 where employee_id=101

-- explicit cursor 

declare 
    cursor emp_cur is select * from emp where department_id=&deptid;    --declare cursor
    emp_rec emp%rowtype;
begin
    open emp_cur;             -- open the cursor
    loop
    fetch emp_cur into emp_rec;    -- fetch the cursor to get record.
    exit when emp_cur%notfound;   --cursor status
    dbms_output.put_line(emp_rec.first_name||' '||emp_rec.last_name);
    end loop;
    dbms_output.put_line('No. of employees : '||emp_cur%rowcount);
    close emp_cur;               -- close the cursor    
end;

-- write a cursor to update the commission based of below condition
-- if no commission and salary is less than 5000, then allocate 3% commission.
-- if no commission and salary is less than 10000, then allocate 2% commission
-- if commission is there and salary is less than 5000, then increment commission by 1%.
-- if commssion is there and salary greater than and equals to 5000, no record updation.
--update cursor
declare 
    cursor emp_cur is select * from emp for update;
    emp_rec emp%rowtype;
    new_comm emp.commission_pct%type;
begin
    open emp_cur;
    loop
        fetch emp_cur into emp_rec;
        exit when emp_cur%notfound;
        if emp_rec.commission_pct is null and emp_rec.salary<5000 then
            new_comm:=0.03;
        elsif emp_rec.commission_pct is null and emp_rec.salary<10000 then
            new_comm:=0.02;
        elsif emp_rec.commission_pct is not null and emp_rec.salary<5000 then
            new_comm:=0.01;    
        else
            new_comm:=emp_rec.commission_pct;
        end if;
        update emp set commission_pct=new_comm where current of emp_cur;
    end loop;
    close emp_cur;
end;

-- parameterized cursor
create or replace procedure showEmployeeByDepartmentId(dep_id in number)
is
    cursor emp_cur(dept_id in emp.department_id%type)is select * from emp where department_id=dept_id;
    emp_rec emp%rowtype;
begin
    open emp_cur(dep_id);
    if emp_cur%isopen then
        dbms_output.put_line('Cursor is open');
    end if;
    loop
        fetch emp_cur into emp_rec;
        exit when emp_cur%notfound;
        dbms_output.put_line(emp_rec.employee_id||' '||emp_rec.first_name);
    end loop;
    close emp_cur;
    if emp_cur%isopen then
        dbms_output.put_line('Cursor is open');
    else
        dbms_output.put_line('Cursor is closed');
    end if;
end;
exec showEmployeeByDepartmentId(30)

select * from emp where department_id=30

create or replace procedure showEmployeeByDepartmentId(dep_id in number)
is
    cursor emp_cur is select * from emp where department_id=dep_id;
    emp_rec emp%rowtype;
begin
    open emp_cur;
    if emp_cur%isopen then
        dbms_output.put_line('Cursor is open');
    end if;
    loop
        fetch emp_cur into emp_rec;
        exit when emp_cur%notfound;
        dbms_output.put_line(emp_rec.employee_id||' '||emp_rec.first_name);
    end loop;
    close emp_cur;
    if emp_cur%isopen then
        dbms_output.put_line('Cursor is open');
    else
        dbms_output.put_line('Cursor is closed');
    end if;
end;




-- cursor for loop
begin
    for emp_cur in (select * from emp where salary>=10000)
    loop
        dbms_output.put_line(emp_cur.employee_id||' '||emp_cur.salary);
    end loop;
end;

--- implicit cursor

declare 
    emp_rec emp%rowtype;
begin
    --select * into emp_rec from emp where employee_id=101;
    select * into emp_rec from emp where department_id=30;
    if sql%found then
        dbms_output.put_line('Record found');
    else
        dbms_output.put_line('Record not found');
    end if;
    DBMS_OUTPUT.PUT_LINE(sql%rowcount);
    exception when NO_DATA_FOUND THEN dbms_output.put_line('Record not found');
              when TOO_MANY_ROWS THEN dbms_output.put_line('too many rows found.'||sql%rowcount);
              when others then dbms_output.put_line('unkown exception')
end;

----------------------------Triggers-------------------------------------
-- is also a named block

create or replace procedure p1
is
begin
    dbms_output.put_line('Procedure called');
end;

exec p1  -- explicitly calling the procedure

create or replace trigger t1 after update on emp for each row
begin
    dbms_output.put_line('Trigger1 is called');
end;

create or replace trigger t2 after update on emp for each row
begin
    dbms_output.put_line('Trigger2 is called');
end;

create or replace trigger t3 after insert or delete on dept for each row
begin
    dbms_output.put_line('Insert/delete Trigger is called');
end;
drop trigger t3
--exec t1 -- trigger cannot be called explicitly. A trigger is called automatically 
--on execution of any DDL or DML statement on the specified table.
update emp set salary=salary+1000 where employee_id=105
create table dept as select * from departments
select * from dept
delete from dept where department_id=270
insert into dept values(301,'Payroll',200,1700)

create table emp_backup as select * from emp
select * from emp_backup
delete emp_backup

-- write a trigger which will store the previous data of an employee after the record is updated with new data.
create or replace trigger trgUpdateEmp after update on emp for each row
begin
    insert into emp_backup 
    values(:old.employee_id,:old.first_name,:old.last_name,:old.email,:old.phone_number,:old.hire_date,
            :old.job_id,:old.salary,:old.commission_pct,:old.manager_id,:old.department_id);
    DBMS_OUTPUT.PUT_LINE('Salary updated from '||:old.salary||' to '||:new.salary);
    DBMS_OUTPUT.PUT_LINE('Old data is saved in emp_backup table.');        
end;
update emp set salary=salary+1000 where employee_id=105
select * from emp where employee_id=105
select * from emp_backup
105	David	Austin	DAUSTIN	590.423.4569	25-06-05	IT_PROG	8140.8		103	60  old
105	David	Austin	DAUSTIN	590.423.4569	25-06-05	IT_PROG	9140.8		103	60  new 

create table ex_emp as select * from emp
delete ex_emp;
select * from ex_emp
drop trigger trgUpdateEmp

create or replace trigger trgDeleteEmp after delete on emp for each row
begin
    insert into ex_emp
    values(:old.employee_id,:old.first_name,:old.last_name,:old.email,:old.phone_number,:old.hire_date,
            :old.job_id,:old.salary,:old.commission_pct,:old.manager_id,:old.department_id);
    DBMS_OUTPUT.PUT_LINE('Old data is saved in ex_emp table.');        
end;
delete from emp where employee_id=104

select * from ex_emp
select * from emp where employee_id=104

alter trigger t1 disable
alter trigger t1 enable
alter table emp disable all triggers
alter table emp enable all triggers
-- you can write a trigger for update on specific column also
-- write a trigger to get fired only when salary is updated
-- and check if the increment amount is more than 50% of current salary then
-- we do not allow to update the salary.

create or replace trigger trgUpdateCommission 
before update of salary on emp
for each row
declare 
    cur_sal emp.salary%type;
    new_sal emp.salary%type;
begin
    cur_sal:=:old.salary;
    new_sal:=:new.salary;
    if new_sal>=(cur_sal+cur_sal*0.5) then
        raise_application_error('-20100','cannot increment the salary');  -- will prevent update query to run
    else
        dbms_output.put_line('Salary updated successfully');
    end if;
end;
select * from emp
update emp set salary=30000 where employee_id=100


create trigger trgDelEmpBackUp before delete on emp_backup for each row
begin
    raise_application_error('-20100','cannot delete emp_backup table.');
end;

delete from emp_backup
select * from emp_backup


select substr('123456789',instr('abcabcabc','b'),4) from dual
select instr('abcabcabc','b') from dual
select substr('123456789',2,4) from dual


drop table UserInfo
drop table Address

create table UserInfo
(
    user_id number(6) primary key,
    user_name varchar2(50),
    user_password varchar2(50),
    user_email varchar2(50),
    user_city varchar2(50),
    user_mobile varchar2(50)
)
desc userinfo
create sequence user_seq start with 1001 increment by 1

insert into userinfo values(user_seq.nextval,?,?,?,?,?)

select * from userinfo
select * from userinfo where user_id=1001

create or replace procedure updatePhoneNo(phone_no in varchar2,u_id in number)
is
begin
    update userinfo set user_mobile=phone_no where user_id=u_id;
end;

create or replace procedure updateEmail(u_email in varchar2,u_id in number,new_email out varchar2)
is
begin
    update userinfo set user_email=u_email where user_id=u_id;
    select user_email into new_email from userinfo where user_id=u_id;
end;

declare
email varchar2(50);
begin
    updateEmail('john@gmail.com',1001,email);
    dbms_output.put_line(email);
end;

select * from userinfo where user_id=1001














