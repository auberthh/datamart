/*
 3.2. Encontrar el producto más vendido en cada región 
      considerando el volumen total (quantity * price).
*/

SELECT 
    c.region, 
    od.product_id, 
    SUM(od.quantity * od.price) AS total_volume
FROM 
    customers c
INNER JOIN 
    orders o ON c.customer_id = o.customer_id
INNER JOIN 
    order_details od ON o.order_id = od.order_id
GROUP BY 
    c.region, od.product_id
HAVING 
    SUM(od.quantity * od.price) = (
        SELECT 
            MAX(total_volume)
        FROM (
            SELECT 
                SUM(od2.quantity * od2.price) AS total_volume
            FROM 
                customers c2
            JOIN 
                orders o2 ON c2.customer_id = o2.customer_id
            JOIN 
                order_details od2 ON o2.order_id = od2.order_id
            WHERE 
                c2.region = c.region
            GROUP BY 
                od2.product_id
        )
    );
