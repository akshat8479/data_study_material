SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://adlsaccountgds.dfs.core.windows.net/synapse-data-store/orders_dataset.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE 
    ) AS [result];