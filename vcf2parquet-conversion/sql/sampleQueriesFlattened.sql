---switch to database created by setup.sql
USE [1000Genomes]
GO


--- create external table for flattened data schema
CREATE EXTERNAL TABLE [chr22Flattened] (
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
	[hashId] bigint,
	[genotypes_sampleId] varchar(10),
	[genotypes_phased] bit,
	[genotypes_calls] varchar(10),
	[genotypes_CNL] varchar(60),
	[genotypes_filters] varchar(1),
	[genotypes_CN] int,
	[genotypes_CNP] varchar(60),
	[genotypes_CNQ] float,
	[genotypes_phredLikelihoods] varchar(30),
	[genotypes_conditionalQuality] int,
	[genotypes_posteriorProbabilities] varchar(60)
	)
	WITH (
--- we create table for chromosome 22
--- change chromosome name to create table for chromosome of interest
	LOCATION = 'flattened/chr22/*.snappy.parquet', 
	DATA_SOURCE = [1000GenomesVariants],
	FILE_FORMAT = [SynapseParquetFormat]
	)
GO


--- Coiunt number of calls
SELECT  COUNT_BIG(*)
 FROM [dbo].[chr22Flattened]
GO


--- Filter true calls (by genotype) by sample name 
SELECT TOP(100) [names], 
    [contigName], 
	[start], 
    [referenceAllele],
    [alternateAlleles],
	JSON_VALUE(genotypes_calls, '$[0]') as call1, 
	JSON_VALUE(genotypes_calls, '$[1]') as call2 
FROM [dbo].[chr22Flattened] 
WHERE genotypes_sampleId = 'NA12878' AND  (JSON_VALUE(genotypes_calls, '$[0]') > 0 OR 	JSON_VALUE(genotypes_calls, '$[1]') > 0); 
GO 


--- Count true calls (by genotype) per sample 
SELECT [genotypes_sampleId], 
    COUNT (genotypes_sampleId) as true_calls_count 
FROM [dbo].[chr22Flattened] 
WHERE (JSON_VALUE(genotypes_calls, '$[0]') > 0 OR 	JSON_VALUE(genotypes_calls, '$[1]') > 0)  
GROUP BY genotypes_sampleId 
ORDER BY true_calls_count; 
GO 
