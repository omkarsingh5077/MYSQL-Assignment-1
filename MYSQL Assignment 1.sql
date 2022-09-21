CREATE DATABASE ASSIGNMENT;
USE ASSIGNMENT;
CREATE table salespeople
(  
 Snum INT AUTO_INCREMENT,
 Sname varchar(255) UNIQUE ,
 City varchar(255),
 Comm INT,
 PRIMARY KEY(Snum)
 );
 
desc salespeople;
INSERT INTO salespeople (Snum,Sname,City,Comm)                 
VALUES
(1001,'Peel','London',12),
(1002,'Serres','sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);

-- customers--

SHOW DATABASES;
USE ASSIGNMENT;
CREATE TABLE customers
(
	Cnum INT AUTO_INCREMENT ,
    Cname VARCHAR(255),
    City  VARCHAR(255) not null ,
    Snum INT ,
    PRIMARY KEY (Cnum),
    FOREIGN KEY (Snum) REFERENCES salespeople(Snum)
    );
Insert into Customers (Cnum,Cname,City,Snum)
							VALUES (2001,'Hoffman','London',1001),
							 (2002,'Giovanni','Rome',1003),
                             (2003,'Liu','Sanjose',1002),
                             (2004,'Grass','Berlin',1002),
                             (2006,'Clemens','London',1001),
                             (2008,'Cisneros','Sanjose', 1007),
							 (2007,'Pereira','Rome',1004);


-- ORDERS--


SHOW DATABASES;
USE ASSIGNMENT;
CREATE TABLE orders
(
	Onum INT AUTO_INCREMENT,
    Amt Decimal(10,2),
    Odate DATE,
    Cnum INT,
	Snum INT,
    PRIMARY KEY (Onum),
    FOREIGN KEY (Cnum) REFERENCES customers(Cnum),
    FOREIGN KEY (Snum) REFERENCES salespeople(Snum)    
);
INSERT INTO orders (Onum, Amt, Odate, Cnum, Snum) 
VALUES 
(3001, 18.69  , '1990-10-3', 2008, 1007),
(3003, 767.19 , '1990-10-3', 2001, 1001),
(3002, 1900.10, '1990-10-3', 2007, 1004),
(3005, 5160.45, '1990-10-3', 2003, 1002),
(3006, 1098.16, '1990-10-3', 2008, 1007),
(3009, 1713.23, '1990-10-4', 2002, 1003),
(3007, 75.75  , '1990-10-4', 2004, 1002),
(3008, 4273.00, '1990-10-5', 2006, 1001),
(3010, 1309.95, '1990-10-6', 2004, 1002),
(3011, 9891.88, '1990-10-6', 2006, 1001);


-- 5 QUESTIONS of Assignment --

SELECT * FROM assignment ;
-- 1
SELECT COUNT(*) FROM  salespeople WHERE Sname LIKE 'A%' or Sname LIKE 'a%' ;

-- 2

SELECT sp.sname, a.amt FROM  orders as a inner join salespeople as sp on a.snum = sp.snum WHERE  a.amt > 2000; 
SELECT * FROM orders WHERE Amt>2000;

-- 3

SELECT * FROM salespeople WHERE  City ='Newyork';

-- 4

SELECT City,COUNT(*) FROM salespeople WHERE  City ='London'or City='paris' ;

-- 5


SELECT sp.Sname, count(*) as number_of_orders , oo.Odate  FROM sales_people as sp inner join orders as oo on oo.Snum = sp.Snum group by sp.Sname, oo.Odate;

