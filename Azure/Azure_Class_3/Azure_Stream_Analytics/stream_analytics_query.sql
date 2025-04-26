WITH stg AS (
    SELECT 
        arrayElement.arrayvalue.product_name AS ProductName,
        CAST(arrayElement.arrayvalue.quantity AS bigint) AS Quantity,
        event.order_id,
        event.customer_id,
        event.store_id,
        event.store_location.city AS City,
        event.store_location.country AS Country
    FROM 
        [input-eventhub] AS event
    CROSS APPLY 
        GetArrayElements(event.order_details) AS arrayElement
)
SELECT 
    ProductName,
    SUM(Quantity) AS TotalQuantity,
    COUNT(*) AS EventCount,
    System.Timestamp AS WindowEndTime
INTO 
    [gdslearningdev]
FROM 
    stg
GROUP BY 
    TUMBLINGWINDOW(minute, 1),
    ProductName;