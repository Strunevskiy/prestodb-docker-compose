show catalogs;

show schemas from mysql_one;
show schemas from mysql_two;

show tables from mysql_one.db;
show tables from mysql_two.db;

SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM
    mysql_one.db.customers c
INNER JOIN
    mysql_two.db.orders o ON c.customer_id = o.customer_id;