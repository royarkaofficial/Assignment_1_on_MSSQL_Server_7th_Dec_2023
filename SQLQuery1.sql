-- create database databaseName
create database FirstDb

-- using database
use FirstDb

-- create table <tableName> (ColumnName DataType [Constraint], 
-- ColumnName DataType [Constraint],
-- ColumnName DataType [Constraint].....)

create table Employee
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50),
Salary float)

Select * from Employee
insert into Employee values (1, 'Amit', 'Kumar', 98000.50)
insert into Employee(Id, Fname) values (2, 'Deep')
insert into Employee(Fname, Lname, Salary, Id) values ('Dhiraj', 'Kumar', 95000, 4)
Select * from Employee

-- Fetch Database
use FirstDb
select * from Employee
use Second12DecDb
Select * from Student
insert into Student values (12, 'Nidhi', 5, 4000)
select * from Student

create database CustomersDb 
on primary (name='Customer_Db', Filename='E:\Phase 3\Day-1\Customer_Db.mdf')
log on (name='Customer_Db_log', filename='E:\Phase 3\Day-1\Customer_Db_log.ldf')
COLLATE SQL_Latin1_General_CP1_CI_AS
use CustomersDb
create table Customer
(CId int primary key,
Cname nvarchar(50) not null,
CCity nvarchar(50) not null)
insert into Customer values (1, 'Soum','India')
insert into Customer values (2, 'Sam','Chennai')
insert into Customer values (3, 'Raj','Delhi')
select * from Customer
select Cname as 'Customer Name' from Customer
drop database CustomersDb

create database CustomersDb 
on primary (name='Customer_Db', Filename='E:\Phase 3\Day-1\Customer_Db.mdf',
size=24MB, MAXsize=48MB, filegrowth=4MB)
log on (name='Customer_Db_log', filename='E:\Phase 3\Day-1\Customer_Db_log.ldf',
size=12MB, MAXsize=24MB, filegrowth=4MB)
COLLATE SQL_Latin1_General_CP1_CI_AS

-- Primary Key 
-- not null
-- unique
-- clustred index on table
-- one primary key per table
use CustomersDb
create table Staff
(Id int primary key,
Name nvarchar(50) not null,
Salary float)
insert into Staff values(1, 'Nitesh', 55000.50)
insert into Staff values(1, 'Suresh', 45000.50)
-- Violation of PRIMARY KEY constraint 'PK__Staff_3214EC07FC76BA39'.
-- Cannot insert duplicate key in object 'dbo.Staff'. The duplicate key value is (1)
insert into Staff values(2, 'Suresh', 45000.50)
insert into Staff (Name, Salary) values ('Ravi', 45000)
-- Msg 515, Level 16, State 2, Line 47
-- Cannot insert the value NULL into column 'Id', table 'CustomersDb.dbo.Staff'
-- Column does not allow nulls. INSERT fails
-- The statement has been terminated
drop table Staff
--create table Staff
--(Id int primary key,
--Name nvarchar(50) not null,
--Salary float)
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

create table Fee
(SId int  not null,
FeeAmount float not null,
FeeMonth int not null,
FeeYear int not null,
constraint pk_fee primary key(SId, FeeMonth, FeeYear))

-- SId+FeeMonth+FeeYear is primary key

insert into Fee values (1, 5000, 1, 2023)
insert into Fee values (1, 5000, 2, 2023)
insert into Fee values (1, 5000, 3, 2023)
insert into Fee values (1, 5000, 4, 2023)

insert into Fee values (2, 5000, 1, 2023)
insert into Fee values (2, 5000, 2, 2023)
insert into Fee values (2, 5000, 3, 2023)
insert into Fee values (2, 5000, 4, 2023)

select * from Fee
insert into Fee values (1, 6000, 1, 2023)

--Msg 2627, Level 14, State 1, Line 102
--Violation of PRIMARY KEY constraint 'pk_fee'. Cannot insert duplicate key in object 'dbo.Fee'. The duplicate key value is (1, 1, 2023).
--The statement has been terminated.
-- primary key
--not null
--check
--default
--identity
--foreign key

create table Customer
(CId int primary key,
Cname nvarchar(50) not null,
Ccity nvarchar(50) default 'Delhi',
Codlimit float)
Insert into Customer values (1, 'Amit', 'Pune', 500000)
Insert into Customer values (2, 'Amit', 'Mumbai', 500000)
Insert into Customer (CId, Cname, Codlimit) values (3, 'Amit', 700000)
select * from Customer
insert into Customer (CId, Cname, Codlimit) values (5, 'Rahul', 700000)

use FirstDb
drop table Employee
-- primary key, not null, default
create table Employee
(id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Salary float check (Salary>=10000 and Salary<=150000))
insert into Employee values (1, 'Sam', 'Dicosta', 98000.50)
insert into Employee values (1, 'Rohit', 'Kiran', 98000.50)
--Msg 2627, Level 14, State 1, Line 134
--Violation of PRIMARY KEY constraint 'PK__Employee__3213E83FE735035D'. Cannot insert duplicate key in object 'dbo.Employee'. The duplicate key value is (1).
--The statement has been terminated.

-- unique: can not insert duplicate value, you can insert null but only once

create table Emp
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Mobile varchar(50) unique,
Email nvarchar(100) unique
)
insert into Emp values (1, 'Raj', 'Kumar', 9876543210, 'raj@yahoo.com')
insert into Emp values (1, 'Nitin', 'Kumar', 9876543210, 'raj12@yahoo.com')

--Msg 2627, Level 14, State 1, Line 149
--Violation of PRIMARY KEY constraint 'PK__Emp__3214EC07C8A4346D'. Cannot insert duplicate key in object 'dbo.Emp'. The duplicate key value is (1).
--The statement has been terminated.

insert into Emp (Id, Fname, Lname, Mobile) values (12, 'Raj', 'Mangal', 9876543210)
select * from Emp
insert into Emp (Id, Fname, Lname, Email) values (9, 'Gaurav', 'Sharma', 'gv_sharma@mail.com')
select * from Emp

-- Identity
-- Identity (seed, increment)
-- 1,1

drop table Emp
create table Emp
(Id int identity primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Mobile varchar(50) unique not null,
Email nvarchar(100) unique not null)
insert into Emp values ('Nitin', 'Kumar', 9876543210, 'niti@yahoo.com')
insert into Emp values ('Simi', 'Mahajan', 9876544210, 'simi@yahoomail.com')
insert into Emp values ('Naina', 'Verma', 9876543510, 'naina@gmail.com')
select * from Emp

drop table Emp
create table Emp
(Id int identity(100, 5) primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Mobile varchar(50) unique not null,
Email nvarchar(100) unique not null)
insert into Emp values ('Nitin', 'Kumar', 9876543210, 'niti@yahoo.com')
insert into Emp values ('Simi', 'Mahajan', 9876544210, 'simi@yahoomail.com')
insert into Emp values ('Naina', 'Verma', 9876543510, 'naina@gmail.com')
select * from Emp


--------------------------------------------------------------------------------------------------------------------------------------
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--------------------------------------------------------------------------------------------------------------------------------------



-- Today Assignment - 01:

-- Drop the database if it exists
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'OurExerciseDb')
    DROP DATABASE OurExerciseDb;

-- Create the database with specified file locations and sizes
CREATE DATABASE OurExerciseDb
ON PRIMARY
    (NAME = 'OurExerciseDb_data',
    FILENAME = 'E:\Phase 3\Day-1\OurExerciseDb_data.mdf',
    SIZE = 24MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 8MB)
LOG ON
    (NAME = 'OurExerciseDb_log',
    FILENAME = 'E:\Phase 3\Day-1OurExerciseDb_log.ldf',
    SIZE = 8MB,
    MAXSIZE = 2048GB,
    FILEGROWTH = 8MB);

-- Use the created database
USE OurExerciseDb;

-- Create the Product table
CREATE TABLE Product (
    Pid INT PRIMARY KEY,
    PName NVARCHAR(255) NOT NULL,
    PPrice DECIMAL(10, 2) CHECK (PPrice >= 50 AND PPrice <= 100000),
    PCompany NVARCHAR(255) DEFAULT 'Default',
    PQty INT CHECK (PQty >= 1)
);

-- Set identity seed for Pid column
DBCC CHECKIDENT('Product', RESEED, 50);

-- Insert at least 5 records into the Product table
INSERT INTO Product (Pid, PName, PPrice, PCompany, PQty) VALUES
(50, 'M20', 1000.00, 'Samsung', 1),
(51, 'S40', 1500.00, 'Apple', 1),
(52, 'F23', 800.00, 'Redmi', 2),
(53, 'A50', 1200.00, 'HTC', 3),
(54, 'LG4', 500.00, 'Sony', 5);

Select * From Product
drop table Product