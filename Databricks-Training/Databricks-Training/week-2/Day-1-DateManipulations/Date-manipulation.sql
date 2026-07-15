select CURDATE();
select CURRENT_DATE();
select CURTIME();
select CURRENT_TIME();
select NOW();
select CURRENT_TIMESTAMP;
select YEAR(order_date), MONTH(order_date), DAY(order_date)  from orders;
select EXTRACT(YEAR  from order_date), EXTRACT(MONTH  from order_date), EXTRACT(DAY  from order_date)  from orders;
select MONTHNAME(order_date), DAYNAME(order_date)  from orders;
select WEEKDAY(order_date), DAYOFWEEK(order_date)  from orders;
select order_id, order_date  from orders where DAYNAME(order_date) IN ('Saturday', 'Sunday');
select order_id, order_date  from orders where DAYOFWEEK(order_date) BETWEEN 2 AND 6;
select order_date, DATE_ADD(order_date, INTERVAL 5 DAY)  from orders;
select order_date, DATE_SUB(order_date, INTERVAL 3 DAY)  from orders;
select DATE_ADD(order_date, INTERVAL 1 MONTH) from orders;
select DATE_SUB(order_date, INTERVAL 2 MONTH) from orders;
select DATE_ADD(order_date, INTERVAL 1 YEAR) from orders;
select order_id, DATEDIFF(delivery_date, order_date) AS delivery_days  from orders;
select TIMESTAMPDIFF(DAY, order_date, delivery_date) AS days_diff, TIMESTAMPDIFF(MONTH, order_date, delivery_date) AS months_diff  from orders;
select LAST_DAY(order_date)  from orders;
select DATE_SUB(order_date, INTERVAL DAY(order_date)-1 DAY)  from orders;
select DATE_FORMAT(order_date, '%d-%m-%Y')  from orders;
select DATE_FORMAT(order_date, '%M %d, %Y')  from orders;
select STR_TO_DATE('15-01-2024', '%d-%m-%Y');
select DATE_FORMAT(order_timestamp, '%d-%m-%Y %H:%i:%s')  from orders;
select *  from orders where MONTH(order_date) = 1;
select *  from orders where MONTHNAME(order_date) = 'February';
select order_date, CASE WHEN MONTH(order_date) >= 4 THEN CONCAT(YEAR(order_date), '-', YEAR(order_date)+1)
ELSE CONCAT(YEAR(order_date)-1, '-', YEAR(order_date))
END AS financial_year
 from orders; 
select *  from orders where order_date >= CURDATE() - INTERVAL 7 DAY;
select *  from orders where DATE(order_timestamp) = CURDATE();