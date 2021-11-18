
# .vcf to .parquet conversion for gnomAD dataset

 `vcf2parquet-gnomad.ipynb` is a notebook used to convert variant call information from .vcf to .parquet for [gnomAD dataset](https://docs.microsoft.com/en-us/azure/open-datasets/dataset-gnomad) v2.1.1 using [Glow](https://projectglow.io/). 

Notebook was tested on Azure Synapse Spark 3.1 Runtime and Glow v1.1.1.

We also provide SQL scripts to create external tables on curated gnomAD dataset and to query it with [Azure Synapse Analytics](https://azure.microsoft.com/en-us/services/synapse-analytics/).

### Curated gnomAD data access

The data is available publicly without restrictions. Storage Account: https://datasetgnomadparquet.blob.core.windows.net/dataset 


### Data schema 

Notebook creates dataset with the following schema:
    
* [Default Glow schema](https://glow.readthedocs.io/en/latest/etl/variant-data.html#vcf)  with removed genotypes and added hashId. 

    Information that applies to an entire variant, such as the contig name, start and end positions, and INFO attributes, is contained in columns. The genotypes, which correspond to the GT FORMAT fields in a VCF, are removed since they do not contain any information in gnomAD dataset. Column hashId is constructed as the hash code of all columns except genotypes using the 64-bit variant of the xxHash algorithm, hashId might be used as unique variant id.