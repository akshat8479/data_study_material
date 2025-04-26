CREATE SCHEMA Sales;

CREATE TABLE Sales.Orders
(
    ORDERNUMBER INT,
    QUANTITYORDERED INT,
    PRICEEACH FLOAT,
    ORDERLINENUMBER INT,
    SALES FLOAT,
    ORDERDATE VARCHAR(50),
    STATUS VARCHAR(50),
    QTR_ID INT,
    MONTH_ID INT,
    YEAR_ID INT
);

Drop table Sales.Orders;

COPY INTO Sales.Orders
FROM 'https://adlsaccountgds.dfs.core.windows.net/synapse-data-store/Raw_Data/'
WITH (
    FILE_TYPE = 'CSV',
    FIELDTERMINATOR = ',',
    FIRSTROW = 2 -- Skip the header row
);

SELECT COUNT(*) FROM Sales.Orders;

SELECT TOP 5 * FROM Sales.Orders;