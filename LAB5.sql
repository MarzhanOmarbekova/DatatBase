--1
CREATE DATABASE lab5;

--2
CREATE TABLE salesman(
salesman_id INTEGER PRIMARY KEY ,
    name VARCHAR(200),
    city VARCHAR(200),
    commission real
);
CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY ,
    cust_name VARCHAR(200),
    city VARCHAR(200),
    grade INTEGER,
    salesman_id INTEGER
);
CREATE TABLE orders(
    ord_no INTEGER ,
    purch_amt REAL,
    ord_date date,
    customer_id INTEGER REFERENCES customers,
    salesman_id INTEGER REFERENCES salesman
);


INSERT INTO customers
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3001, 'Brad Guzan', 'London', null, 5005),
    (3004, 'Fabian Johns', 'Paris', 300, 5006),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3009, 'Geoff Camero', 'Berlin', 100, 5003),
    (3008, 'Nick Rimando', 'London', 300, 5002);

INSERT INTO salesman(salesman_id, name, city, commission)
VALUES(5001, 'James Hoog', 'New York', 0.15),
      (5002, 'Nail Knite', 'Paris', 0.13),
      (5005, 'Pit Alex', 'London', 0.11),
      (5006, 'Mc Lyon', 'Paris', 0.14),
      (5003, 'Lauson Hen', NULL, 0.12),
      (5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO orders
VALUES(70001, 150.5, '2012-10-05', 3005, 5002),
      (70009, 270.65, '2012-09-10', 3001, 5005),
      (70002, 65.26, '2012-10-05', 3002, 5001),
      (70004, 110.5, '2012-08-17', 3009, 5003),
      (70007, 948.5, '2012-09-10', 3005, 5002),
      (70005, 2400.6, '2012-07-27', 3007, 5001),
      (70008, 5760, '2012-09-10', 3002, 5001);

--3
SELECT sum(purch_amt) FROM orders;

--4
SELECT avg(purch_amt) FROM orders;

--5
SELECT count(cust_name) FROM customers;

--6
SELECT min(purch_amt) FROM  orders;

--7
SELECT * FROM customers
WHERE cust_name LIKE '%b %';

--8
SELECT * FROM orders
WHERE  customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');

--9
SELECT * FROM customers
WHERE  customer_id IN (SELECT customer_id FROM orders WHERE purch_amt>10);

--10
SELECT sum(grade) FROM customers;

--11
SELECT * FROM customers
WHERE cust_name IS NOT NULL;

--12
SELECT max(grade) FROM customers;