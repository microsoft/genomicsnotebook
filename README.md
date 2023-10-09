
# Genomics Data Analysis with Jupyter Notebooks on Azure
![text](https://github.com/microsoft/genomicsnotebook/blob/main/docs/image328.png)

Jupyter notebook is a great tool for data scientists who are working on genomics data analysis. In this repo, we demonstrate the use of [Azure Notebooks](https://docs.microsoft.com/en-us/azure/notebooks/) for genomics data analysis via GATK, Picard, Bioconductor and Python libraries.

### 3/31/2022: NEW DEMO VIDEO: [How to use 'genomicsnotebook' repo in GitHub Codespaces?](https://datasettoaexample.blob.core.windows.net/publicsample/genomics_notebook_codespaces.mp4)
_For more information about Codespaces please visit the [product page](https://github.com/features/codespaces)_

Here is the list of sample notebooks on this repo:

1. [`genomics.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics.ipynb): Analysis from 'uBAM' to 'structured data table' analysis.
2. [`genomicsML.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomicsML.ipynb): Train Machine Learning models with Genomics + Clinical Data
3. [`genomics-platinum-genomes.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics-platinum-genomes.ipynb): Accessing Illumina Platinum Genomes data from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/)* and to make initial data analysis.
4. [`genomics-reference-genomes.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics-reference-genomes.ipynb): Accessing reference genomes from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/)* 
5. [`genomics-clinvar.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics-clinvar.ipynb): Accessing ClinVar data from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/)*
6. [`genomics-giab.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/AzureNotebooks-azure-storage-genomics-giab.ipynb): Accessing Genome in a Bottle data from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/)* 
7. [`SnpEff.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/SnpEff.ipynb): Accessing SnpEff databases from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/)* 
8. [`1000 Genomes.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/1000-genomes_Azure_Genomics_Data_Lake.ipynb): Accessing 1000 Genomes dataset from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/)* 
9. [`GATKResourceBundle.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics-gatk-resource-bundle.ipynb): Accessing GATK resource bundle  from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/)* 
10. [`ENCODE.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics-encode.ipynb): Accessing ENCODE dataset from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/)* 
11. [`genomics-OpenCRAVAT.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics-opencravat.ipynb): Accessing OpenCRAVAT dataset from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/) and deploy built-in Azure Data Science VM for OpenCRAVAT*  
12. [`Bioconductor.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/Bioconductor.ipynb): Pulling Bioconductor Docker image from [Microsoft Container Registry](https://hub.docker.com/_/microsoft-bioconductor)
13. [`simtotable.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/simtotable.ipynb): Simulate NGS data, use Cromwell on Azure OR Microsoft Genomics service for secondary analysis and convert the gVCF data to a structured data table.
14. [`igv_jupyter_extension_sample.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/igv_jupyter_extension_sample.ipynb): Download sample VCF file from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/) and use igv-jupyter extension on Jupyter Lab environment.
15. [`radiogenomics.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/radiogenomics.ipynb): Combine DICOM, VCF and gene expression data for patient segmentation analysis.
16. [`fhir+PacBio.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/fhir_long_read.ipynb): Convert Synthetic FHIR and PacBio VCF Data to parquet and Explore with Azure Synapse Analytics
17. [`fhir-vcf-clustering.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/fhir-vcf-clustering.ipynb): Convert Synthetic FHIR and PacBio VCF Data to parquet and Explore with Azure Synapse Analytics



*Technical note: [Explore Azure Genomics Data Lake with Azure Storage Explorer](https://github.com/microsoft/genomicsnotebook/blob/main/docs/Genomics_Data_Lake_Azure_Storage_Explorer.pdf)

# 1. Prerequisites

#  Create and manage Azure Machine Learning workspaces in the Azure portal

![text](https://github.com/microsoft/genomicsnotebook/blob/main/docs/create-workspace.gif)

For further details on creation of Azure ML workspace please visit [this page.](https://docs.microsoft.com/en-us/azure/machine-learning/how-to-manage-workspace)

# Run the notebook in your workspace

This chapter uses the cloud notebook server in your workspace for an install-free and pre-configured experience. Use your own environment if you prefer to have control over your environment, packages and dependencies.

Follow along with this video or use the detailed steps below to clone and run the tutorial from your workspace.

[![Watch the video](https://github.com/microsoft/genomicsnotebook/blob/main/docs/video.JPG)](https://www.microsoft.com/en-us/videoplayer/embed/RE4mTUr) 


# 2. Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

# 3. References

1. [Jupyter Notebook on Azure](https://docs.microsoft.com/en-us/azure/notebooks/tutorial-create-run-jupyter-notebook) 
2. [Introduction to Azure Notebooks](https://notebooks.azure.com)
3. [GATK](https://gatk.broadinstitute.org/hc/en-us) 
4. [Picard](http://broadinstitute.github.io/picard/index.html)
5. [Azure Machine Learning](https://azure.microsoft.com/en-us/services/machine-learning/)
6. [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/)
7. [Cromwell on Azure](https://github.com/microsoft/CromwellOnAzure)
8. [Bioconductor](https://www.bioconductor.org/)
