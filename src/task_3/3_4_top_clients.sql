/*
 3.4. Identificar a los top 5 clientes con más ingresos generados en el último año, junto con el número de órdenes realizadas.
*/

SELECT 
    c.customer_id, 
    c.name, 
    SUM(od.quantity * od.price * (1 - od.discount)) AS total_income, 
    COUNT(o.order_id) AS total_orders
FROM 
    customers c
INNER JOIN 
    orders o ON c.customer_id = o.customer_id
INNER JOIN 
    order_details od ON o.order_id = od.order_id
WHERE 
    o.order_date >= date('now', '-1 year')
GROUP BY 
    c.customer_id, c.name
ORDER BY 
    total_income DESC
LIMIT 5;
