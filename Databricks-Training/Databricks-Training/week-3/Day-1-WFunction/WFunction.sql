CREATE TABLE employees (
emp_id INT,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
join_date DATE
);

INSERT INTO employees VALUES
(1,'Amit','IT',50000,'2023-01-01'),
(2,'Ravi','HR',45000,'2023-01-02'),
(3,'Sneha','IT',60000,'2023-01-03'),
(4,'Kiran','Finance',55000,'2023-01-04'),
(5,'Priya','IT',50000,'2023-01-05'),
(6,'Arjun','HR',48000,'2023-01-06'),
(7,'Neha','Finance',52000,'2023-01-07'),
(8,'Vikas','IT',60000,'2023-01-08'),
(9,'Anjali','HR',47000,'2023-01-09'),
(10,'Rahul','Finance',56000,'2023-01-10'),
(11,'Suresh','IT',58000,'2023-01-11'),
(12,'Pooja','HR',46000,'2023-01-12'),
(13,'Manoj','Finance',54000,'2023-01-13'),
(14,'Divya','IT',51000,'2023-01-14'),
(15,'Karthik','HR',49000,'2023-01-15'),
(16,'Meena','Finance',53000,'2023-01-16'),
(17,'Raj','IT',57000,'2023-01-17'),
(18,'Simran','HR',50000,'2023-01-18'),
(19,'Deepak','Finance',55000,'2023-01-19'),
(20,'Nisha','IT',56000,'2023-01-20');

CREATE TABLE orders (
order_id INT,
customer_name VARCHAR(50),
city VARCHAR(50),
amount INT,
order_date DATE
);

INSERT INTO orders VALUES
(1,'Amit','Chennai',2000,'2023-01-01'),
(2,'Ravi','Hyderabad',1500,'2023-01-02'),
(3,'Sneha','Chennai',3000,'2023-01-03'),
(4,'Kiran','Bangalore',2500,'2023-01-04'),
(5,'Priya','Chennai',2000,'2023-01-05'),
(6,'Arjun','Hyderabad',1800,'2023-01-06'),
(7,'Neha','Bangalore',2200,'2023-01-07'),
(8,'Vikas','Chennai',3000,'2023-01-08'),
(9,'Anjali','Hyderabad',1700,'2023-01-09'),
(10,'Rahul','Bangalore',2600,'2023-01-10'),
(11,'Suresh','Chennai',2800,'2023-01-11'),
(12,'Pooja','Hyderabad',1600,'2023-01-12'),
(13,'Manoj','Bangalore',2400,'2023-01-13'),
(14,'Divya','Chennai',2100,'2023-01-14'),
(15,'Karthik','Hyderabad',1900,'2023-01-15'),
(16,'Meena','Bangalore',2300,'2023-01-16'),
(17,'Raj','Chennai',2700,'2023-01-17'),
(18,'Simran','Hyderabad',2000,'2023-01-18'),
(19,'Deepak','Bangalore',2500,'2023-01-19'),
(20,'Nisha','Chennai',2600,'2023-01-20');