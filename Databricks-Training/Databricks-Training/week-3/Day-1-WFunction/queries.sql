SELECT emp_name,department,salary,ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num FROM employees;

SELECT emp_name,department,salary,ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num FROM employees;

SELECT emp_name,join_date,ROW_NUMBER() OVER(ORDER BY join_date DESC) AS row_num FROM employees;

SELECT emp_name,department,join_date,ROW_NUMBER() OVER(PARTITION BY department ORDER BY join_date ASC) AS row_num FROM employees;

SELECT order_id,customer_name,order_date,ROW_NUMBER() OVER(ORDER BY order_date) AS row_num FROM orders;

SELECT order_id,customer_name,city,amount,ROW_NUMBER() OVER(PARTITION BY city ORDER BY amount DESC) AS row_num FROM orders;

SELECT emp_name,salary,ROW_NUMBER() OVER(ORDER BY salary ASC) AS row_num FROM employees;

SELECT emp_name,department,ROW_NUMBER() OVER(PARTITION BY department ORDER BY emp_name ASC) AS row_num FROM employees;

SELECT emp_name,salary,RANK() OVER(ORDER BY salary DESC) AS rank_num FROM employees;

SELECT emp_name,department,salary,RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_num FROM employees;

SELECT emp_name,join_date,RANK() OVER(ORDER BY join_date DESC) AS rank_num FROM employees;

SELECT order_id,customer_name,amount,RANK() OVER(ORDER BY amount DESC) AS rank_num FROM orders;

SELECT order_id,customer_name,city,amount,RANK() OVER(PARTITION BY city ORDER BY amount DESC) AS rank_num FROM orders;

SELECT emp_name,department,salary,RANK() OVER(PARTITION BY department ORDER BY salary ASC) AS rank_num FROM employees;

SELECT emp_name,RANK() OVER(ORDER BY emp_name ASC) AS rank_num FROM employees;

SELECT order_id,customer_name,city,order_date,RANK() OVER(PARTITION BY city ORDER BY order_date ASC) AS rank_num FROM orders;

SELECT emp_name,salary,DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_num FROM employees;

SELECT emp_name,department,salary,DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rank_num FROM employees;

SELECT emp_name,join_date,DENSE_RANK() OVER(ORDER BY join_date DESC) AS dense_rank_num FROM employees;

SELECT order_id,customer_name,amount,DENSE_RANK() OVER(ORDER BY amount DESC) AS dense_rank_num FROM orders;

SELECT order_id,customer_name,city,amount,DENSE_RANK() OVER(PARTITION BY city ORDER BY amount DESC) AS dense_rank_num FROM orders;

SELECT emp_name,salary,DENSE_RANK() OVER(ORDER BY salary ASC) AS dense_rank_num FROM employees;

SELECT emp_name,department,join_date,DENSE_RANK() OVER(PARTITION BY department ORDER BY join_date ASC) AS dense_rank_num FROM employees;

SELECT order_id,customer_name,order_date,DENSE_RANK() OVER(ORDER BY order_date ASC) AS dense_rank_num FROM orders;