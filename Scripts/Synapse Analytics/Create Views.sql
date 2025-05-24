--------------------------------------------------
----------------- Create View Calendar

CREATE VIEW gold.calendar 
AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://adep2sa.dfs.core.windows.net/silver/AdventureWorks_Calendar/',
    FORMAT='PARQUET'
) AS [result];
GO

--------------------------------------------------
----------------- Create View Customers

CREATE VIEW gold.customers
AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://adep2sa.dfs.core.windows.net/silver/AdventureWorks_Customers/',
    FORMAT='PARQUET'
) AS [result];
GO

--------------------------------------------------
----------------- Create View Products

CREATE VIEW gold.products
AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://adep2sa.dfs.core.windows.net/silver/AdventureWorks_Products/',
    FORMAT='PARQUET'
) AS [result];
GO

--------------------------------------------------
----------------- Create View Returns

CREATE VIEW gold.[returns]
AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://adep2sa.dfs.core.windows.net/silver/AdventureWorks_Returns/',
    FORMAT='PARQUET'
) AS [result];
GO

--------------------------------------------------
----------------- Create View Sales

CREATE VIEW gold.sales
AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://adep2sa.dfs.core.windows.net/silver/AdventureWorks_Sales/',
    FORMAT='PARQUET'
) AS [result];
GO

--------------------------------------------------
----------------- Create View Territories

CREATE VIEW gold.territories
AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://adep2sa.dfs.core.windows.net/silver/AdventureWorks_Territories/',
    FORMAT='PARQUET'
) AS [result];
GO

--------------------------------------------------
----------------- Create View Product_Subcategories

CREATE VIEW gold.productSubCategory 
AS
SELECT * 
FROM OPENROWSET(
    BULK 'https://adep2sa.dfs.core.windows.net/silver/AdventureWorks_Product_Subcategories/',
    FORMAT='PARQUET'
) AS [result];
GO
