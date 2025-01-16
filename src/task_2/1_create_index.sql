/*
 - This is the code for the technical challenge for Datamart.
 - Author: Auberth Hurtado
*/

CREATE INDEX idx_customers_region ON customers(region);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_details_order_id ON order_details(order_id);
