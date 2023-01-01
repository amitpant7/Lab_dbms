CREATE database Db_emplyoee;
use Db_emplyoee;

create table Tbl_employee(
emplyoee_name varchar(255) primary key,
street VARCHAR(255),
city VARCHAR(255)
);

create table Tbl_works(
	employee_name varchar(255) primary key, 
    company_name varchar(255),
    salary INT
);

create table Tbl_manages(
	employee_name varchar(255) primary key, 
    manager_name varchar(255)
);
 create table Tbl_company(
  company_name varchar(255) primary key, 
	city varchar(255)
 );
 
 
 ALTER table tbl_works
 add foreign key (employee_name) references tbl_employee(employee_name),
 add foreign key(company_name) references Tbl_company(company_name);
 
 ALTER table Tbl_manages
 add FOREIGN KEY(employee_name) references tbl_employee(employee_name);
 
 #Adding Data
 INSERT INTO Tbl_employee (employee_name, street, city)
VALUES ('John Smith', '123 Main St', 'New York'),
       ('Jane Doe', '456 Maple Ave', 'Chicago'),
       ('Bob Johnson', '789 Pine St', 'Los Angeles'),
       ('Samantha Williams', '321 Park Ave', 'New York'),
       ('Michael Brown', '654 Oak St', 'Chicago'),
       ('Emily Davis', '912 Birch St', 'Los Angeles');

SELECT * from Tbl_employee;

INSERT INTO Tbl_works (employee_name, company_name, salary)
VALUES ('John Smith', 'First Bank Corporation', 75000),
       ('Jane Doe', 'First Bank Corporation', 80000),
       ('Bob Johnson', 'First Bank Corporation', 90000),
       ('Samantha Williams', 'TechCorp', 95000),
       ('Michael Brown', 'TechCorp', 100000),
       ('Emily Davis', 'TechCorp', 110000);

SELECT * from Tbl_works;

INSERT INTO Tbl_company (company_name, city)
VALUES ('First Bank Corporation', 'New York'),
       ('TechCorp', 'San Francisco');

SELECT * from Tbl_company;

INSERT INTO Tbl_manages (employee_name, manager_name)
VALUES ('Jane Doe', 'John Smith'),
       ('Bob Johnson', 'Jane Doe'),
       ('Michael Brown', 'Samantha Williams'),
       ('Emily Davis', 'Michael Brown');

SELECT * from Tbl_manages;

INSERT INTO Tbl_employee (employee_name, street, city)
VALUES 
      ('Tim Smith', '123 Main St', 'New York'),
       ('Julie Johnson', '456 Maple Ave', 'Chicago'),
       ('Mike Brown', '789 Pine St', 'Los Angeles'),
       ('Jessica Williams', '321 Park Ave', 'New York'),
       ('David Davis', '654 Oak St', 'Chicago'),
       ('Sarah Jackson', '912 Birch St', 'Los Angeles'),
       ('Jones' ,'192 brst', 'old town');

INSERT INTO Tbl_works (employee_name, company_name, salary)
VALUES  ('Tim Smith', 'Small Bank Corporation', 75000),
       ('Julie Johnson', 'Small Bank Corporation', 80000),
       ('Mike Brown', 'Small Bank Corporation', 90000),
       ('Jessica Williams', 'Small Bank Corporation', 95000),
       ('David Davis', 'Small Bank Corporation', 100000),
       ('Sarah Jackson', 'Small Bank Corporation', 110000);

INSERT INTO Tbl_company (company_name, city)
VALUES ('Small Bank Corporation', 'New York'),
('Big Corporation', 'New York'),
('Mid-Size Company', 'Chicago'),
('Small Business', 'Los Angeles'),
('Startup Inc.', 'San Francisco'),
('Global Enterprises', 'New York'),
('Regional Firm', 'Chicago');


INSERT INTO Tbl_manages(employee_name, manager_name)
VALUES ('Julie Johnson', 'Tim Smith'),
       ('Mike Brown', 'Julie Johnson'),
       ('Jessica Williams', 'David Davis'),
       ('Sarah Jackson', 'Jessica Williams');

 
 
 #Qn2
SELECT employee_name from Tbl_works WHERE company_name = 'First Bank Corporation';
SELECT Tbl_works.employee_name, Tbl_employee.city from Tbl_works, Tbl_employee WHERE Tbl_works.company_name = 'First Bank Corporation'; 

SELECT Tbl_works.employee_name, Tbl_employee.city, Tbl_employee.street
From Tbl_works, Tbl_employee WHERE Tbl_works.company_name = 'First Bank Corporation'
AND Tbl_works.salary > 10000; 

SELECT Tbl_employee.employee_name from Tbl_employee,Tbl_company WHERE Tbl_employee.city = Tbl_company.city;

SELECT employee_name from Tbl_works WHERE company_name != 'First Bank Corporation';

SELECT @maxsal := Max(salary) 
FROM Tbl_works Where company_name = 'Small Bank Corporation';

SELECT employee_name from Tbl_works where salary > @maxsal;

Select company_name from Tbl_company WHERE city IN(SELECT city from Tbl_company where company_name = 'Small Bank Corporation');

# Q.N 3

select employee_name, city from Tbl_employee;
 
update Tbl_employee 
SET city = 'Newtown' where employee_name = 'Jones';

SELECT * from tbl_works;

update Tbl_works
set salary = salary *1.1 where company_name = 'First Bank Corporation';


UPDATE Tbl_works
SET salary =
    CASE
        WHEN salary < 100000 THEN salary * 1.1
        ELSE salary * 1.03
    END
WHERE Tbl_works.employee_name IN (
    SELECT tbl_manages.employee_name
    FROM tbl_manages
    WHERE tbl_manages.manager_name = tbl_works.employee_name AND tbl_works.company_name = 'First Bank Corporation'
);

 
 
SELECT *
FROM tbl_works, tbl_manages
WHERE tbl_manages.manager_name = tbl_works.employee_name AND tbl_works.company_name = 'First Bank Corporation';

DELETE FROM works
WHERE company_name = 'Small Bank Corporation';

 