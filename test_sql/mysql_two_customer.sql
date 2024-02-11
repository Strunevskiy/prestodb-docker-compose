CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255)
);

INSERT INTO customers (first_name, last_name, email, phone_number, address) VALUES
('John', 'Doe', 'john@example.com', '123-456-7890', '123 Main St, Anytown, USA'),
('Jane', 'Smith', 'jane@example.com', '987-654-3210', '456 Oak St, Anytown, USA'),
('Michael', 'Johnson', 'michael@example.com', '555-123-4567', '789 Elm St, Anytown, USA');