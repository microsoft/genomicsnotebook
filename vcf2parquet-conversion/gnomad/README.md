
# .vcf to .parquet conversion for gnomAD dataset

 `vcf2parquet-gnomad.ipynb` is a notebook used to convert variant call information from .vcf to .parquet for [gnomAD dataset](https://docs.microsoft.com/en-us/azure/open-datasets/dataset-gnomad) using [Glow](https://projectglow.io/). 

Notebook was tested on Azure Synapse Spark 3.1 Runtime and Glow v1.1.1.

We also provide SQL scripts to create external tables on curated gnomAD dataset and to query it with [Azure Synapse Analytics](https://azure.microsoft.com/en-us/services/synapse-analytics/).


### Data schema 

