---switch to database created by setup.sql
USE [1000Genomes]
GO

--- create external table for nested data schema
CREATE EXTERNAL TABLE [nested] (
	[contigName] varchar(2),
	[start] bigint,
	[end] bigint,
	[names] varchar(150),
	[referenceAllele] varchar(150),
	[alternateAlleles] varchar(700),
	[qual] float,
	[filters] varchar(10),
	[splitFromMultiAllelic] bit,
	[INFO_MEND] int,
	[INFO_AC] varchar(60),
	[INFO_CIEND] varchar(15),
	[INFO_NS] int,
	[INFO_AFR_AF] varchar(100),
	[INFO_VT] varchar(30),
	[INFO_AN] int,
	[INFO_MULTI_ALLELIC] bit,
	[INFO_SAS_AF] varchar(100),
	[INFO_CIPOS] varchar(15),
	[INFO_AA] varchar(150),
	[INFO_AF] varchar(150),
	[INFO_EAS_AF] varchar(100),
	[INFO_AMR_AF] varchar(100),
	[INFO_DP] int,
	[INFO_SVLEN] varchar(10),
	[INFO_MLEN] int,
	[INFO_MEINFO] varchar(30),
	[INFO_IMPRECISE] bit,
	[INFO_CS] varchar(15),
	[INFO_MC] varchar(450),
	[INFO_END] int,
	[INFO_MSTART] int,
	[INFO_EUR_AF] varchar(100),
	[INFO_EX_TARGET] bit,
	[INFO_TSD] varchar(35),
	[INFO_SVTYPE] varchar(10),
	[INFO_OLD_VARIANT] varchar(200),
	[genotypes] varchar(MAX),
	[hashId] bigint
	)
	WITH (
--- we create table for full dataset
--- specify chromosome name to create table for chromosome of interest, for example 'nested/chr22/*.snappy.parquet' for chromosome 22
	LOCATION = 'nested/*/*.snappy.parquet', 
	DATA_SOURCE = [1000GenomesVariants],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO

--- Count number of variants 
SELECT  COUNT_BIG(*)
FROM [dbo].[nested]
GO


--- Count variants per chromosome
SELECT [contigName],
    COUNT_BIG (contigName) as variantCount
FROM [dbo].[nested]
GROUP BY contigName
ORDER BY variantCount;
GO


--- Filter variants on multiple fields
SELECT TOP (10) [contigName],
    [referenceAllele],
    [alternateAlleles],
    [INFO_MULTI_ALLELIC],
    [start],
    [names],
    [INFO_AFR_AF],
    [INFO_VT],
    [AFR_AF]
FROM [dbo].[nested]
CROSS APPLY OPENJSON (INFO_AFR_AF) WITH (AFR_AF float '$')
WHERE ([referenceAllele] = 'A') AND ([AFR_AF] > 0.3); 
GO


SELECT TOP (10) [contigName],
    [start],
    [names],
    [referenceAllele],
    [alternateAlleles],
    [filters],
    [INFO_AC],
    [INFO_AA],
    [INFO_AF],
    [INFO_DP]
FROM [dbo].[nested]
CROSS APPLY OPENJSON (alternateAlleles) WITH (alternateAllele VARCHAR(700) '$')
WHERE ([alternateAllele]= 'C') AND ([INFO_DP]> 2);
GO


--- Filter true calls (by genotype) on start position
SELECT TOP (10) [contigName],
    [sampleId],
    [start],
    [names],
    [referenceAllele],
    [alternateAlleles],
    [INFO_AC],
    [INFO_AA],
    [INFO_AF],
    [INFO_DP],
    [call1],
    [call2]
FROM [dbo].[nested]
CROSS APPLY openjson (genotypes) WITH (sampleId VARCHAR(10), call1 INT '$.calls[0]', call2 INT '$.calls[1]') 
WHERE ([call1] > 0 OR [call2] > 0) AND ( [start] >= 23000000);
GO
