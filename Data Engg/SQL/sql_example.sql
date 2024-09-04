insert into employee values
(1,'Amit','Sharma','Software Engineer','IT','2022-01-15'),
(2,'Priya','Mehta','Project Manager','Operations','2023-02-20'),
(3,'Raj','Patel','Business Analyst','Finance','2021-06-30'),
(4,'Sunita','Verma','HR Specialist','HR','2019-08-12'),
(5,'Vikram','Rao','Software Engineer',' IT','2021-03-18'),
(6,'Anjali','Nair','HR Manager','HR','2020-05-14'),
(7,'Rohan','Desai','Finance Manager','Finance','2022-11-25'),
(8,'Sneha','Kumar','Operations Coordinator','Operations','2023-07-02'),
(9,'Deepak','Singh','Data Scientist','IT','2022-08-05'),
(10,'Neha','Gupta','Business Analyst','Finance','2020-10-10')

select * from employee where department='it'

select firstname,lastname,department from employee

select * from employee where hiredate > '2022-01-01'

select distinct department from employee

select * from employee where department='It' and hiredate > '2022-01-01'

select * from employee where department='It' or hiredate > '2022-01-01'

select * from employee where department in ('it',"operations")

select * from employee where hiredate between '20220-01-01' and '2022-12-31'

select * from employee where lastname like 's%'

select concat(firstname,' ',lastname)  as Fullname from employee

select e.employeeid,e.firstname,e.lastname,e.department from employee as e where e.employeeid>5

select department ,count(*) from employee group by department

update employee set department='IT' where employeeid=5

create table Department(
DepartmentID int primary key,
demartName varchar(30))

insert into department values(1,'IT'),(2,'HR'),(3,'Finance'),(4,'Operations')

select * from employee

select e.firstname,e.lastname,e.position,d.departmentname,d.departmentid from employee as e join department as d where e.department=d.departmentname

alter table department rename column demartname to departmentname

select firstname,lastname,department from employee where Department in (select department  from  employee group by department  having count(*) >2) 

select count(department)  from  employee group by department