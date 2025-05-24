-- CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'adminMelvin$';
CREATE DATABASE SCOPED CREDENTIAL cred_melvin
WITH IDENTITY = 'Managed Identity';

CREATE EXTERNAL DATA SOURCE source_silver
WITH
  ( LOCATION = 'https://adep2sa.dfs.core.windows.net/silver/' ,
    CREDENTIAL = cred_melvin
  );

CREATE EXTERNAL DATA SOURCE source_gold
WITH
  ( LOCATION = 'https://adep2sa.dfs.core.windows.net/gold/' ,
    CREDENTIAL = cred_melvin
  );

--Create an external file format for PARQUET files.
CREATE EXTERNAL FILE FORMAT format_parquet
WITH (
        FORMAT_TYPE = PARQUET,
        DATA_COMPRESSION ='org.apache.hadoop.io.compress.SnappyCodec'
    );

----------------- Create external table extsales
CREATE EXTERNAL TABLE gold.extsales
WITH (
    LOCATION = 'extsales', -- folder name
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
) AS
SELECT * FROM gold.sales;