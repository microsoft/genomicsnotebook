--- create database
CREATE DATABASE [1000Genomes]
    COLLATE Latin1_General_100_BIN2_UTF8;
GO

USE [1000Genomes]
GO

--- create external file format
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO

--- create credential
CREATE MASTER KEY
GO
CREATE DATABASE SCOPED CREDENTIAL [PublicCredential]
WITH IDENTITY='SHARED ACCESS SIGNATURE',  
SECRET = 'sv=2020-04-08&st=2021-06-25T13%3A18%3A33Z&se=2021-07-26T13%3A18%3A00Z&sr=c&sp=rl&sig=WzzItjHxTZnApdYB%2B9iD2ABPVKaOi3sA2NG05AyJB5g%3D' 
GO


--- create external data source
IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = '1000GenomesVariants') 
	CREATE EXTERNAL DATA SOURCE [1000GenomesVariants]  
	WITH (
		LOCATION   = 'https://curated1000genomes.blob.core.windows.net/dataset', 
		CREDENTIAL = PublicCredential
	)
GO

