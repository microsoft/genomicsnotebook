
# .vcf to .parquet conversion with Glow on Microsoft Azure 

Notebooks to convert variant call information from .vcf to .parquet for 1000 Genomes and gnomAD datasets using [Glow](https://projectglow.io/). 

Notebook `vcf2parquet-walkthrough.ipynb` is a **sample code** of format conversion run on chromosome 22 from [1000 Genomes datatset](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-1000-genomes/).  It was tested on Azure Databricks Runtime 9.1, Azure Synapse Spark 3.1 Runtime and Glow v1.1.1.




### Requirements  

glow[]().py and Glow maven package should be installed on your Spark cluster:

* For Azure Databricks  - see details in [Getting started with Glow](https://glow.readthedocs.io/en/latest/getting-started.html) and [Azure Databricks documentation](https://docs.microsoft.com/en-us/azure/databricks/libraries/workspace-libraries).
* For Azure Synapse Analytics - see details in [Manage Python libraries](https://docs.microsoft.com/en-us/azure/synapse-analytics/spark/apache-spark-manage-python-packages) and [Manage Scala and Java packages](https://docs.microsoft.com/en-us/azure/synapse-analytics/spark/apache-spark-manage-scala-packages). We recommend to install glow[]().py by [providing an environment specification file](https://docs.microsoft.com/en-us/azure/synapse-analytics/spark/apache-spark-manage-python-packages#environment-specification-formats). Since Maven coordinates are not yet supported in Azure Synapse, there are 2 options to install Glow: a. build Glow jar and upload it to your Synapse workspace, or b. download Glow jar and dependencies from Maven repository and upload them to your Synapse workspace ([Glow Spark3 v1.1.1](https://mvnrepository.com/artifact/io.projectglow/glow-spark3_2.12/1.1.1), [HTSJDK v2.21.2](https://mvnrepository.com/artifact/com.github.samtools/htsjdk/2.21.2) and [Hadoop BAM v7.9.2](https://mvnrepository.com/artifact/org.seqdoop/hadoop-bam/7.9.2) are required for all notebooks in this repo)


### Data schema 

Notebook `vcf2parquet-walkthrough.ipynb` creates 2 copies of dataset with different schema:
* [Default Glow schema](https://glow.readthedocs.io/en/latest/etl/variant-data.html#vcf)  that mirrors a single row of a VCF + hashId. 

    Information that applies to an entire variant, such as the contig name, start and end positions, and INFO attributes, is contained in columns. The genotypes, which correspond to the GT FORMAT fields in a VCF, are contained in an array with one entry per sample. Each entry is a struct with fields that are described in the VCF header. Column hashId is constructed as the hash code of all columns except genotypes using the 64-bit variant of the xxHash algorithm, hashId might be used as unique variant id.

* Flattened schema

    Information that applies to an entire variant (hashId included) stays the same. The genotypes get replaced by set of columns, one per each struct field - to achieve that we have to copy variant information for each entry of genotypes array.  

If you want to learn more about VCF format check [the spec page](https://samtools.github.io/hts-specs/).

### Microsoft Azure Resources 
If you are new to Azure, see:
- [Azure Synapse Analytics](https://azure.microsoft.com/en-us/services/synapse-analytics/)
- [Azure Databricks](https://azure.microsoft.com/en-us/services/databricks/)

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