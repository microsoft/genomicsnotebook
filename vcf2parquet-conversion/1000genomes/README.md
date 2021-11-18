
# .vcf to .parquet conversion for 1000 Genomes dataset

`vcf2parquet-1000genomes.ipynb` is a notebook used to convert variant call information from .vcf to .parquet for [1000 Genomes datatset](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-1000-genomes/)  using [Glow](https://projectglow.io/). 

Notebook was tested on Azure Databricks Runtime 8.1 and Glow v1.0.1, cluster worker type Standard_DS13_v2 (min - 7, max - 15).

We also provide SQL scripts to create external tables on curated 1000 Genomes dataset and to query it with [Azure Synapse Analytics](https://azure.microsoft.com/en-us/services/synapse-analytics/).


### Curated 1000 Genomes data access

East US: https://curated1000genomes.blob.core.windows.net/dataset

[SAS Token](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview): sv=2020-04-08&st=2021-06-25T13%3A18%3A33Z&se=2021-07-26T13%3A18%3A00Z&sr=c&sp=rl&sig=WzzItjHxTZnApdYB%2B9iD2ABPVKaOi3sA2NG05AyJB5g%3D

### Data schema 

Notebook creates 2 copies of dataset with different schema:
* [Default Glow schema](https://glow.readthedocs.io/en/latest/etl/variant-data.html#vcf)  that mirrors a single row of a VCF + hashId. 

    Information that applies to an entire variant, such as the contig name, start and end positions, and INFO attributes, is contained in columns. The genotypes, which correspond to the GT FORMAT fields in a VCF, are contained in an array with one entry per sample. Each entry is a struct with fields that are described in the VCF header. Column hashId is constructed as the hash code of all columns except genotypes using the 64-bit variant of the xxHash algorithm, hashId might be used as unique variant id.

* Flattened schema

    Information that applies to an entire variant (hashId included) stays the same. The genotypes get replaced by set of columns, one per each struct field - to achieve that we have to copy variant information for each entry of genotypes array.  Schema is consistent across all chromosomes in the dataset.


Format conversion is done for each chromosome separately, so default data schema might differ between chromosomes. In case of flattened schema we add empty columns when needed to match schema across all chromosomes.
