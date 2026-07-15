SELECT LEFT(full_name,4),RIGHT(city,3) FROM employees;

SELECT email,INSTR(email,'@') FROM employees;

SELECT email,LOCATE('.',email) FROM employees;

SELECT REPLACE(department,'Data','Big Data') FROM employees;

SELECT full_name,REVERSE(full_name) FROM employees;

SELECT LPAD(emp_id,5,'0') FROM employees;

SELECT RPAD(city,15,'*') FROM employees;

SELECT TRIM(REPLACE(city,' ','')) FROM employees;

SELECT full_name,IFNULL(remarks,'No remarks') FROM employees;

SELECT full_name,COALESCE(remarks,'N/A') FROM employees;

SELECT FIND_IN_SET('Analytics','Data,Analytics,AI');

SELECT UPPER(full_name) FROM employees;

SELECT LOWER(department) FROM employees;

SELECT LENGTH(full_name) FROM employees;

SELECT TRIM(full_name) FROM employees;

SELECT CONCAT(full_name,' - ',city) FROM employees;