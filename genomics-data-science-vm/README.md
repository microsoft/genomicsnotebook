# Custom Genomics Data Science Virtual Machine on Microsoft Azure



<!-- #region -->
Virtual Machine (VM) templates in this page deploys a **Data Science Virtual Machine- Ubuntu 20.04**.

If you are new to Azure virtual machines, see:
- [Azure Virtual Machines](https://azure.microsoft.com/services/virtual-machines/)
- [Azure Linux Virtual Machines documentation](https://docs.microsoft.com/azure/virtual-machines/linux/)

Please review the following articles before deploying the VMs on Microsoft Azure:

- [Security recommendations for virtual machines in Azure - Azure Virtual Machines | Microsoft Learn](https://learn.microsoft.com/en-us/azure/virtual-machines/security-recommendations)

- [Security features used with Azure VMs - Azure security | Microsoft Learn](https://learn.microsoft.com/en-us/azure/security/fundamentals/virtual-machines-overview?source=recommendations)

##  Custom Genomics Data Science VM- Ubuntu 20.04

**[Guideline: Deploy custom Genomics Data Science VM](https://datasettoaexample.blob.core.windows.net/publicsample/deploycommunitygenomics.mp4)**



The 'Data Science Virtual Machine (DSVM)' is a 'Ubuntu 20.04' VM that has several popular tools for data exploration, analysis, modeling & development pre installed.

## Highlights:

### Custom Genomics features

* [Cromwell on Azure](https://github.com/microsoft/CromwellOnAzure)
* [NextFlow on Azure](https://www.nextflow.io/blog/2021/introducing-nextflow-for-azure-batch.html)
* [Microsoft Genomics service](https://azure.microsoft.com/en-us/products/genomics/)
* [Microsoft Genomics Jupyter Notebooks](https://github.com/microsoft/genomicsnotebook)
* [Bioconductor common workflows from Official Bioconductor Site](https://www.bioconductor.org/packages/release/BiocViews.html#___Workflow)

### Operating System, Drivers and other base components

* Nvidia drivers, CUDA Toolkit, cuDNN (when GPU machines are used)
* Docker
* Anaconda ("conda")
* Git

### Authoring Tools

* Visual Studio Code
* PyCharm Community Edition
* Jupyter, Jupyter Lab


### ML Framework

* PyTorch, TensorFlow, scikit-learn
* pyspark
* dask
* Vowpal Wabbit

### Other Notable Components

* Azure CLI
* Azure ML SDK for Python
* Azure Storage Explorer

Users can access the DSVM via Remote Desktop, SSH or browser (eg: Jupyter Hub). Optionally, the VM can be placed in a corporate network.

Users have full access to the DSVM. If needed, configurations can be adjusted, and additional frameworks can be installed like with any other virtual machine. The image provided here is a static VM image. Maintenance and protection against vulnerabilities of provisioned DSVMs is in the customer's responsibility.


## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Licensing
GATK script is released under the WDL source code license (BSD-3) (see LICENSE in https://github.com/broadinstitute/wdl). Note however that the programs it calls may be subject to different licenses. Users are responsible for checking that they are authorized to run all programs before running this script. [Bioconductor common workflows](https://www.bioconductor.org/packages/release/BiocViews.html#___Workflow) are the public content that users can download seperately. Users are responsible for checking of these public scripts' licensing rules. 

## Support

For questions: Please send an e-mail to genomics@microsoft.com

## NOTICES
THIS VM IMAGE JUST PROVIDE A SAMPLE SCHEMA FOR EDUCATIONAL PURPOSES. MICROSOFT DOES NOT CLAIM ANY OWNERSHIP ON THESE CODES AND LIBRARIES. MICROSOFT PROVIDES THIS VM IMAGE AND SAMPLE USE OF LIBRARIES ON AN “AS IS” BASIS.MICROSOFT MAKES NO WARRANTIES, EXPRESS OR IMPLIED, GUARANTEES OR CONDITIONS WITH RESPECT TO YOUR USE OF THIS VM IMAGE. TO THE EXTENT PERMITTED UNDER YOUR LOCAL LAW, MICROSOFT DISCLAIMS ALL LIABILITY FOR ANY DAMAGES OR LOSSES, INCLUDING DIRECT, CONSEQUENTIAL, SPECIAL, INDIRECT, INCIDENTAL OR PUNITIVE, RESULTING FROM YOUR USE OF THIS VM IMAGE.

<!-- #endregion -->
