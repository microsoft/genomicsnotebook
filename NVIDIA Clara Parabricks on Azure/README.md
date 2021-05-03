
# NVIDIA Clara Parabricks on Microsoft Azure 

<!-- #region -->

`NVIDIA_Clara_Parabricks_on_Azure.ipnyb` presents the **sample code** of NVIDIA Clara Parabricks pipeline on Azure Machine Learning Studio and Ubuntu Virtual Machines on [Microsoft Azure](https://azure.microsoft.com/en-us/)

### What is NVIDIA Clara Parabricks Pipelines?*
"_Parabricks is a software suite for performing secondary analysis of next generation sequencing (NGS) DNA and RNA data. A major benefit of Parabricks is that it is designed to deliver results at blazing fast speeds and low cost. Parabricks can analyze whole human genomes in about **45 minutes**, compared to about 30 hours for **30x WGS data**. The best part is the output results exactly match the commonly used software. So, it’s fairly simple to verify the accuracy of the output._"

### Why use NVIDIA Clara Parabricks Pipelines?*

"_Under the hood, it achieves this performance through tight integration with GPUs, which excel at performing data parallel computation much more effectively than traditional CPU-based solutions. Parabricks was built from the ground up by GPU computing and Deep Learning experts who wanted to develop the fastest and most efficient possible implementation of common genomics algorithms used in secondary analysis._"

You can learn more at https://developer.nvidia.com/clara-parabricks*


**Recommended Virtual Machine/Azure ML compute configurations on Microsoft Azure**

Standard_NC64AS_T4_V3 (64 Cores, 448 GB RAM, 2816 GB Disk) 
    **Processing Unit** GPU - 4 x NVIDIA Tesla T4

Standard_NC24s_v3 (24 cores, 448 GB RAM, 1344 GB disk) 
    **Processing Unit** GPU - 4 x NVIDIA Tesla V100

For more information about NC series VMs on Azure, please visit [this link](https://docs.microsoft.com/en-us/azure/virtual-machines/nc-series)

**IMPORTANT INFORMATION**

Users needs a **NVIDIA Clara Parabricks** licence OR trial licence for running the pipelines. For more information please visit https://www.nvidia.com/en-us/clara/genomics/

### Microsoft Azure Resources 

If you are new to Azure, see:
- [Microsoft Genomics](https://www.microsoft.com/en-us/genomics/)
- [Azure Machine Learning](https://azure.microsoft.com/en-us/services/machine-learning/)
- [Azure Virtual Machines](https://azure.microsoft.com/services/virtual-machines/)
- [Azure Linux Virtual Machines documentation](https://docs.microsoft.com/azure/virtual-machines/linux/)
- [Template reference](https://docs.microsoft.com/azure/templates/microsoft.compute/allversions)
- [Quickstart templates](https://azure.microsoft.com/resources/templates/?resourceType=Microsoft.Compute&pageNumber=1&sort=Popular)


### `NVIDIA_Clara_Parabricks_on_Azure.ipnyb` covers the steps in below:

1. Create and manage Microsoft Azure Machine Learning Studio

2.  Getting Started with NVIDIA Clara Parabricks 

3. Install Dependencies for NVIDIA Parabricks Test Run

4. Run 'fq2bam' pipeline with NVIDIA Clara Parabricks client


### Notices

Third party software notices from [NVIDIA CLARA PARABRICKS](https://docs.nvidia.com/clara/parabricks/v3.5/text/software_notices.html)

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

For other questions about NVIDIA Clara Parabricks [Developer forum of NVIDIA Clara Parabricks](https://forums.developer.nvidia.com/c/healthcare/parabricks/290)
