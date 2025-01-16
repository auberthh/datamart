/*
 3.1. Calcular el ingreso total por cliente, ordenado de mayor a menor.
*/

SELECT 
    c.customer_id, 
    c.name, 
    SUM(od.quantity * od.price * (1 - od.discount)) AS total_income
FROM 
    customers c
INNER JOIN 
    orders o ON c.customer_id = o.customer_id
INNER JOIN 
    order_details od ON o.order_id = od.order_id
GROUP BY 
    c.customer_id, c.name
ORDER BY 
    total_income DESC;
