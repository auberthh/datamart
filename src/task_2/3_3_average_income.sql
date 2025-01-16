/*
 3.3. Calcular el ingreso promedio por cliente y región para cada mes.
*/

SELECT 
    c.region, 
    strftime('%Y-%m', o.order_date) AS month, 
    AVG(od.quantity * od.price * (1 - od.discount)) AS average_income
FROM 
    customers c
INNER JOIN 
    orders o ON c.customer_id = o.customer_id
INNER JOIN 
    order_details od ON o.order_id = od.order_id
GROUP BY 
    c.region, month;
