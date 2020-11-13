
# Genomics Data Analysis with Jupyter Notebooks on Azure
![text](https://github.com/microsoft/genomicsnotebook/blob/main/docs/image328.png)

Jupyter notebooks are a great tool for data scientists who are working on genomics data analysis. In this repo, we demonstrate the use of [Azure Notebooks](https://docs.microsoft.com/en-us/azure/notebooks/) for genomics data analysis via GATK, Picard, Bioconductor and Python libraries.

Here is the list of sample notebooks on this repo:

1. [`genomics.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics.ipynb): From 'uBAM' to 'structured data table' analysis.
2. [`genomics-platinum-genomes.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics-platinum-genomes.ipynb): Accessing Illumina Platinum Genomes data from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/) and to make initial data analysis.
3. [`genomics-reference-genomes.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics-reference-genomes.ipynb): Accessing reference genomes from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/) 
4. [`genomics-clinvar.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/genomics-clinvar.ipynb): Accessing ClinVar data from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/) 
5. [`genomics-giab.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/AzureNotebooks-azure-storage-genomics-giab.ipynb): Accessing Genome in a Bottle data from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/) 
6. [`SnpEff.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/SnpEff.ipynb): Accessing SnpEff databases from [Azure Open Datasets](https://azure.microsoft.com/en-us/services/open-datasets/catalog/genomics-data-lake/) 
7. [`Bioconductor.ipynb`](https://github.com/microsoft/genomicsnotebook/blob/main/sample-notebooks/Bioconductor.ipynb): Pulling Bioconductor Docker image from [Microsoft Container Registry](https://hub.docker.com/_/microsoft-bioconductor)


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
