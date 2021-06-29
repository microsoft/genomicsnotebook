
# .vcf to .parquet conversion with Glow on Microsoft Azure 

Notebooks to convert variant call information from .vcf to .parquet using [Glow](https://projectglow.io/). `vcf2parquet-walkthrough.ipynb` is a **sample code** of format conversion run on chromosome 22 from [1000 Genomes datatset](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-1000-genomes/). `vcf2parquet-datasetConversion.ipynb` is a notebook used to produce curated 1000 Genomes dataset in .parquet format available on Azure.

We also provide SQL scripts to create external tables on curated 1000 Genomes dataset and to query it with [Azure Synapse Analytics](https://azure.microsoft.com/en-us/services/synapse-analytics/).

### Requirements and compute configuration 

* glow[]().py and Glow maven package should be installed on your Spark cluster, see details in [Getting started with Glow](https://glow.readthedocs.io/en/latest/getting-started.html) and [Azure Databricks documentation](https://docs.microsoft.com/en-us/azure/databricks/libraries/workspace-libraries).

* Notebooks tested on Azure Databricks Runtime 8.1 (Apache Spark 3.1.1, Scala 2.12) and Glow v1.0.1, cluster worker type Standard_DS13_v2 (min - 7, max - 15).

### Curated 1000 Genomes data access

East US: https://curated1000genomes.blob.core.windows.net/dataset

[SAS Token](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview): sv=2020-04-08&st=2021-06-25T13%3A18%3A33Z&se=2021-07-26T13%3A18%3A00Z&sr=c&sp=rl&sig=WzzItjHxTZnApdYB%2B9iD2ABPVKaOi3sA2NG05AyJB5g%3D

### Data schema 

Notebooks create 2 copies of dataset with different schema:
* [Default Glow schema](https://glow.readthedocs.io/en/latest/etl/variant-data.html#vcf)  that mirrors a single row of a VCF + hashId. 

    Information that applies to an entire variant, such as the contig name, start and end positions, and INFO attributes, is contained in columns. The genotypes, which correspond to the GT FORMAT fields in a VCF, are contained in an array with one entry per sample. Each entry is a struct with fields that are described in the VCF header. Column hashId is constructed as the hash code of all columns except genotypes using the 64-bit variant of the xxHash algorithm, hashId might be used as unique variant id.

* Flattened schema

    Information that applies to an entire variant (hashId included) stays the same. The genotypes get replaced by set of columns, one per each struct field - to achieve that we have to copy variant information for each entry of genotypes array.  Schema is consistent across all chromosomes in the dataset.

Go through `vcf2parquet-walkthrough.ipynb` to see the difference between two schemas described. If you want to learn more about VCF format check [the spec page](https://samtools.github.io/hts-specs/).

Format conversion is done for each chromosome separately, so default data schema might differ between chromosomes. In case of flattened schema we add empty columns when needed to match schema across all chromosomes.

### Microsoft Azure Resources 
If you are new to Azure, see:
- [Azure Databricks](https://azure.microsoft.com/en-us/services/databricks/)
- [Azure Synapse Analytics](https://azure.microsoft.com/en-us/services/synapse-analytics/)

### Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

### Support

For questions about the notebook: Please send an e-mail to genomics@microsoft.com