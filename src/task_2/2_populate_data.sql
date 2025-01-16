/*
 - This is the code for the technical challenge for Datamart.
 - Author: Auberth Hurtado
*/

INSERT INTO customers (customer_id, name, email, region) VALUES
(1, 'Alice Johnson', 'alice.johnson@.com', 'North America'),
(2, 'Bob Smith', 'bob.smith@.com', 'Europe'),
(3, 'Carlos Rodriguez', 'carlos.rodriguez@.com', 'South America'),
(4, 'Diana Lee', 'diana.lee@.com', 'Asia'),
(5, 'Edward Kim', 'edward.kim@.com', 'Oceania'),
(6, 'Fiona Chen', 'fiona.chen@.com', 'Asia'),
(7, 'George Brown', 'george.brown@.com', 'Africa'),
(8, 'Helen White', 'helen.white@.com', 'Europe'),
(9, 'Ibrahim Ali', 'ibrahim.ali@.com', 'Middle East'),
(10, 'Julia Scott', 'julia.scott@.com', 'North America'),
(11, 'Karen Martinez', 'karen.martinez@.com', 'South America'),
(12, 'Liam Wilson', 'liam.wilson@.com', 'Oceania'),
(13, 'Maria Garcia', 'maria.garcia@.com', 'Europe'),
(14, 'Nina Patel', 'nina.patel@.com', 'Asia'),
(15, 'Oscar Hernandez', 'oscar.hernandez@.com', 'North America'),
(16, 'Paula Brown', 'paula.brown@.com', 'Africa'),
(17, 'Quentin Adams', 'quentin.adams@.com', 'Europe'),
(18, 'Rita Santos', 'rita.santos@.com', 'South America'),
(19, 'Samuel Tan', 'samuel.tan@.com', 'Asia'),
(20, 'Tina Nguyen', 'tina.nguyen@.com', 'Oceania');

INSERT INTO orders (order_id, customer_id, order_date, shipping_priority) VALUES
(101, 1, '2025-01-10', 'High'),
(102, 2, '2025-01-11', 'Medium'),
(103, 3, '2025-01-12', 'Low'),
(104, 4, '2025-01-13', 'High'),
(105, 5, '2025-01-14', 'Medium'),
(106, 6, '2025-01-15', 'High'),
(107, 7, '2025-01-16', 'Medium'),
(108, 8, '2025-01-17', 'Low'),
(109, 9, '2025-01-18', 'High'),
(110, 10, '2025-01-19', 'Medium'),
(111, 11, '2025-01-20', 'High'),
(112, 12, '2025-01-21', 'Low'),
(113, 13, '2025-01-22', 'Medium'),
(114, 14, '2025-01-23', 'High'),
(115, 15, '2025-01-24', 'Low'),
(116, 16, '2025-01-25', 'Medium'),
(117, 17, '2025-01-26', 'High'),
(118, 18, '2025-01-27', 'Low'),
(119, 19, '2025-01-28', 'Medium'),
(120, 20, '2025-01-29', 'High');

INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, price, discount) VALUES
(1001, 101, 201, 2, 15.00, 0.10),
(1002, 101, 202, 1, 25.00, 0.00),
(1003, 102, 203, 3, 10.00, 0.05),
(1004, 103, 204, 5, 20.00, 0.15),
(1005, 104, 205, 4, 18.00, 0.20),
(1006, 105, 206, 2, 30.00, 0.05),
(1007, 106, 207, 6, 22.00, 0.10),
(1008, 107, 208, 3, 17.00, 0.00),
(1009, 108, 209, 8, 19.00, 0.05),
(1010, 109, 210, 4, 16.00, 0.15),
(1011, 110, 211, 2, 21.00, 0.20),
(1012, 111, 212, 5, 14.00, 0.10),
(1013, 112, 213, 7, 23.00, 0.00),
(1014, 113, 214, 9, 20.00, 0.05),
(1015, 114, 215, 3, 26.00, 0.15),
(1016, 115, 216, 2, 18.00, 0.20),
(1017, 116, 217, 5, 24.00, 0.10),
(1018, 117, 218, 6, 29.00, 0.00),
(1019, 118, 219, 4, 27.00, 0.05),
(1020, 119, 220, 8, 31.00, 0.15);

