CREATE SCHEMA sales_mart;

CREATE TABLE [sales_mart].[AggregatedSales] (
	[ProductName] nvarchar(4000),
	[TotalQuantity] bigint,
	[EventCount] bigint,
	[WindowEndTime] datetime2
)

