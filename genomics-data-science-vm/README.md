# Azure Genomics Data Science VM Templates 



<!-- #region -->
Virtual Machine (VM) templates in this page deploys a **Data Science Virtual Machine with Windows Server 2016 or Linux Ubuntu 18.04**.

If you are new to Azure virtual machines, see:
- [Azure Virtual Machines](https://azure.microsoft.com/services/virtual-machines/)
- [Azure Linux Virtual Machines documentation](https://docs.microsoft.com/azure/virtual-machines/linux/)
- [Azure Windows Virtual Machines documentation](https://docs.microsoft.com/azure/virtual-machines/windows/)
- [Template reference](https://docs.microsoft.com/azure/templates/microsoft.compute/allversions)
- [Quickstart templates](https://azure.microsoft.com/resources/templates/?resourceType=Microsoft.Compute&pageNumber=1&sort=Popular)


If you are new to template deployment, see: [Azure Resource Manager documentation](https://docs.microsoft.com/azure/azure-resource-manager/)

These templates allows you to deploy an **Data Science Virtual Machine with Genomics data analysis** content. Once users used these templates, all the content in below will be on the VM automatically. Below is the high level design of the templates:

![text](https://github.com/microsoft/genomicsnotebook/blob/main/genomics-data-science-vm/images/design.png)

## 1. Windows Server 2016
[![Deploy To Azure](https://github.com/microsoft/genomicsnotebook/blob/main/genomics-data-science-vm/images/deploytoazure.svg)](https://ms.portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fstoreshare.blob.core.windows.net%2Fvmtemplates%2Fgenomics_vm_template_windows.json)

#### The 'Data Science Virtual Machine (DSVM)' is a 'Windows Server 2016 with Containers' VM & includes popular tools for data exploration, analysis, modeling & development.

##### Highlights:

* Azure Machine Learning SDK
* Microsoft ML Server - Dev Edition (Scalable R & Python)
* Anaconda Python
* SQL Server 2017 Dev. Edition - With In-Database R and Python analytics
* Microsoft Office 365 ProPlus BYOL - Shared Computer Activation
* Julia
* Jupyter notebooks
* Visual Studio Community Ed. + Python, R & node.js tools
* Power BI Desktop
* Deep learning tools TensorFlow, Chainer, & mxnet
* ML algorithm libraries e.g. xgboost, Vowpal Wabbit

Azure SDKs + libraries for various Azure Cloud offerings. Integration tools are included for: 

1.  Azure Machine Learning
2. Azure Data Factory
3. Stream Analytics
4. SQL Data Warehouse
5. Hadoop + Apache Spark (HDICluster)
6. Data Lake
7. Blob storage
8. ML & Data Science tutorials as Jupyter notebooks
9. [Microsoft Genomics Jupyter Notebooks](https://github.com/microsoft/genomicsnotebook)
10. [Bioconductor common workflows from Official Bioconductor Site](https://www.bioconductor.org/packages/release/BiocViews.html#___Workflow)
11. [GATK 4.1.8.1](https://github.com/broadinstitute/gatk/releases) 

This image also includes tools for ML model operationalization as web services in the cloud, using Azure ML or Microsoft R Server.

This image is pre-configured with Nvidia drivers, CUDA Toolkit, & cuDNN library for GPU workloads available if using NC class VM SKUs.

**Useful Links**
* [Community Forum](http://aka.ms/dsvm/forum)
* [Data Science Virtual Machine for Linux (Ubuntu)](https://azuremarketplace.microsoft.com/en-us)
* [Documentation](http://aka.ms/dsvmdoc)
* [Tutorial](http://aka.ms/dsvmtenthings)

**Deployment Screen on Azure Portal**

Following visual is the screenshot of the template deployment on Azure Portal. Users needs to fill the relevant fields for the deployment. Please check the ***Required parameters for VM deployments*** part.


![text](https://github.com/microsoft/genomicsnotebook/blob/main/genomics-data-science-vm/images/win_vm.jpg)

## 2. Ubuntu 18.04

[![Deploy To Azure](https://github.com/microsoft/genomicsnotebook/blob/main/genomics-data-science-vm/images/deploytoazure.svg)](https://ms.portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fstoreshare.blob.core.windows.net%2Fvmtemplates%2Fgenomics_vm_template_linux.json)

The Data Science Virtual Machine for Linux is an Ubuntu-based virtual machine image that makes it easy to get started with deep learning on Azure. The Microsoft Cognitive Toolkit, TensorFlow, MXNet, Caffe, Caffe2, Chainer, NVIDIA DIGITS, Deep Water, Keras, Theano, Torch, and PyTorch are built, installed, and configured so they are ready to run immediately. The NVIDIA driver, CUDA 10, and cuDNN 7 are also included. All frameworks are the GPU versions but work on the CPU as well. Many sample Jupyter notebooks are included. TensorFlow Serving, MXNet Model Server, and TensorRT are included to test inferencing.

Please note, we have the latest version of 'Data Science Virtual Machine â€“ Ubuntu 18.04' available.

The Data Science Virtual Machine for Linux also contains popular tools for data science and development activities, including:

1. CRAN R
2. Anaconda Python
3. JupyterHub with sample notebooks
4. Spark local with PySpark and SparkR Jupyter kernels
5. Azure command-line interface
6. Visual Studio Code, IntelliJ IDEA, PyCharm, and Atom
7. H2O, Deep Water, and Sparkling Water
8. Julia
9. Vowpal Wabbit for online learning
10. xgboost for gradient boosting
11. SQL Server 2017
12. Intel Math Kernel Library
13. [Microsoft Genomics Jupyter Notebooks](https://github.com/microsoft/genomicsnotebook)
14. [Bioconductor common workflows from Official Bioconductor Site](https://www.bioconductor.org/packages/release/BiocViews.html#___Workflow) 
15. [GATK 4.1.8.1](https://github.com/broadinstitute/gatk/releases)

You can view a full list of installed tools for the Linux edition [here](https://docs.microsoft.com/en-us/azure/machine-learning/machine-learning-data-science-virtual-machine-overview).

**Deployment Screen on Azure Portal**

Following visual is the screenshot of the template deployment on Azure Portal. Users needs to fill the relevant fields for the deployment. Please check the ***Required parameters for VM deployments*** part.

![text](https://github.com/microsoft/genomicsnotebook/blob/main/genomics-data-science-vm/images/lin_vm.jpg) 



## 3. Required parameters for VM deployments:

![text](https://github.com/microsoft/genomicsnotebook/blob/main/genomics-data-science-vm/images/table.JPG) 

`Tags: Genomics, Windows Server, virtual machine, Linux, Ubuntu Server,Data Science`


## 4. Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## 5. Licensing
GATK script is released under the WDL source code license (BSD-3) (see LICENSE in https://github.com/broadinstitute/wdl). Note however that the programs it calls may be subject to different licenses. Users are responsible for checking that they are authorized to run all programs before running this script. [Bioconductor common workflows](https://www.bioconductor.org/packages/release/BiocViews.html#___Workflow) are the public content that users can download seperately. Users are responsible for checking of these public scripts' licensing rules. 

## 6. Support

For questions: Please send an e-mail to genomics@microsoft.com

## NOTICES
THESE VM TEMPLATES JUST PROVIDE A SAMPLE SCHEMA FOR EDUCATIONAL PURPOSES. MICROSOFT DOES NOT CLAIM ANY OWNERSHIP ON THESE CODES AND LIBRARIES. MICROSOFT PROVIDES THIS VM TEMPLATE AND SAMPLE USE OF LIBRARIES ON AN “AS IS” BASIS.MICROSOFT MAKES NO WARRANTIES, EXPRESS OR IMPLIED, GUARANTEES OR CONDITIONS WITH RESPECT TO YOUR USE OF THIS VM TEMPLATE. TO THE EXTENT PERMITTED UNDER YOUR LOCAL LAW, MICROSOFT DISCLAIMS ALL LIABILITY FOR ANY DAMAGES OR LOSSES, INCLUDING DIRECT, CONSEQUENTIAL, SPECIAL, INDIRECT, INCIDENTAL OR PUNITIVE, RESULTING FROM YOUR USE OF THIS VM TEMPLATE.

<!-- #endregion -->
