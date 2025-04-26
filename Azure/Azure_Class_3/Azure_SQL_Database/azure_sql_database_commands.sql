CREATE SCHEMA sales_mart;
-- When you create a new schema in SQL Server (including Azure SQL Database), 
-- it won't immediately show up under the "Tables" section unless you have 
-- tables associated with that schema.

CREATE TABLE sales_mart.Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    Quantity INT,
    SaleAmount DECIMAL(18, 2),
    SaleDate DATETIME
);

-- Insert data in table

INSERT INTO [sales_mart].[Sales]
VALUES 
    ('Laptop', 5, 4500.00, '2024-01-15 10:30:00'),
    ('Smartphone', 10, 8000.00, '2024-02-01 14:20:00'),
    ('Headphones', 20, 3000.00, '2024-03-10 09:15:00'),
    ('Monitor', 7, 7000.00, '2024-04-25 12:45:00'),
    ('Keyboard', 15, 1500.00, '2024-05-05 16:10:00');

Select * from [sales_mart].[Sales];
