-- select customers who have orders placed (JOIN)
SELECT first_name, last_name, email, customer_order.id as order_number, total_amount
FROM customer
         JOIN customer_order ON customer.id = customer_order.customer_id
ORDER BY first_name;

SELECT customer.first_name,
       customer_order.id as order_number,
       product.name      as product,
       order_item.quantity,
       product.price,
       order_item.price,
       customer_order.total_amount
FROM customer
         JOIN customer_order ON customer.id = customer_order.customer_id
         JOIN order_item ON customer_order.id = order_item.order_id
         JOIN product ON order_item.product_id = product.id;

-- select customers whether they have orders placed or not (LEFT JOIN)
SELECT first_name, last_name, email, customer_order.id as order_number, total_amount
FROM customer
         LEFT JOIN customer_order ON customer.id = customer_order.customer_id;

-- select customers who do not have any order placed (LEFT JOIN with condition)
SELECT customer.first_name, customer.last_name, customer.email FROM customer
LEFT JOIN customer_order ON customer.id = customer_order.customer_id
WHERE customer_id is NULL;

-- RIGHT JOIN (same buy in reverse)

--FULL JOIN (select every record within tables, whether they match or not)
SELECT * FROM customer
FULL JOIN customer_order ON customer.id = customer_order.customer_id;