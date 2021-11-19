--- create database
CREATE DATABASE [gnomAD]
    COLLATE Latin1_General_100_BIN2_UTF8;
GO

USE [gnomAD]
GO

--- create external file format
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseParquetFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseParquetFormat] 
	WITH ( FORMAT_TYPE = PARQUET)
GO

--- create external data source
IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'gnomADVariants') 
	CREATE EXTERNAL DATA SOURCE [gnomADVariants]  
	WITH (
		LOCATION   = 'https://datasetgnomadparquet.blob.core.windows.net/dataset'
	)
GO

--- create external table for exome data
--- we use a subset of columns for this table
--- full schemas are available at https://datasetgnomadparquet.blob.core.windows.net/dataset/v2.1.1/dataSchema_exomes.txt and https://datasetgnomadparquet.blob.core.windows.net/dataset/v2.1.1/dataSchema_genomes.txt
CREATE EXTERNAL TABLE [exomes] (
	[contigName] varchar(2),
	[referenceAllele] varchar(150),
	[alternateAlleles] varchar(150),
	[start] bigint,
	[end] bigint,
	[names] varchar(150),
	[qual] float,
	[INFO_VQSR_POSITIVE_TRAIN_SITE] bit
	)
	WITH (
	LOCATION = 'v2.1.1/exomes/*/*.snappy.parquet', 
	DATA_SOURCE = [gnomADVariants],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO

--- count number of variants 
SELECT  COUNT_BIG(*) as totalVariantCount
FROM [dbo].[exomes]
GO

--- count number of variants by chromosome
SELECT [contigName],  COUNT_BIG(*) as variantCount
FROM [dbo].[exomes] GROUP BY contigName ORDER BY variantCount DESC
GO

--- count number of variants that are VQSR positive training sites, per chromosome
SELECT [contigName],  COUNT_BIG(*) as VQSRPositiveSitesCount
FROM [dbo].[exomes] 
WHERE INFO_VQSR_POSITIVE_TRAIN_SITE = 1
GROUP BY contigName ORDER BY VQSRPositiveSitesCount DESC
GO

--- take a look at VQSR positive training sites for chromosome Y
SELECT *
FROM [dbo].[exomes]
WHERE contigName = 'Y' and INFO_VQSR_POSITIVE_TRAIN_SITE = 1
GO
