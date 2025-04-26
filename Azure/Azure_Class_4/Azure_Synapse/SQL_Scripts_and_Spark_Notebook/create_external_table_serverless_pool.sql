CREATE DATABASE SalesDB;

USE SalesDB;
CREATE SCHEMA Sales;

CREATE EXTERNAL DATA SOURCE RawDataExternalLoc
WITH (
    LOCATION = 'https://adlsaccountgds.dfs.core.windows.net/synapse-data-store'
);

CREATE EXTERNAL FILE FORMAT CsvFormat
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2 -- Skip the header row
    )
);

CREATE EXTERNAL TABLE Sales.Orders
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
)
WITH (
    LOCATION = 'Raw_Data/sales_data.csv', -- Path within your container
    DATA_SOURCE = RawDataExternalLoc,
    FILE_FORMAT = CsvFormat
);

DROP EXTERNAL TABLE Sales.Orders;

SELECT COUNT(*) FROM Sales.Orders;

SELECT TOP 5 * FROM Sales.Orders;