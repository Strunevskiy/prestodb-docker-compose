CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-02-01', 50.00),
(2, '2024-02-03', 75.25),
(3, '2024-02-05', 100.50),
(1, '2024-02-07', 30.75);