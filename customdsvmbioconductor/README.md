## Deploy Custom Data Science VM for Bioconductor in Azure with Linux Extension

Azure Virtual machine (VM) extensions are small applications that provide post-deployment configuration and automation tasks on Azure VMs. For example, if a virtual machine requires software installation, antivirus protection, or the ability to run a script inside it, you can use a VM extension [1]. Users can run Azure VM extensions by using the Azure CLI, PowerShell, Azure Resource Manager templates (ARM templates), and the Azure portal. 

Users can bundle extensions with a new VM deployment or run them against any existing system [1]. In this document, we will provide an overview of Azure VM extensions with using Bioconductor’s system dependency shell file.  

###### Figure 1. Overall architectural design of custom Linux extension implementation

<img src="https://github.com/microsoft/genomicsnotebook/blob/main/docs/bioc_arch_1.JPG" width="600" />

Once deployment is completed with the prepared code, users will have a Linux Data Science VM which has the following features: 

###### Table 1. Data Science VM pre-built configurations

<img src="https://github.com/microsoft/genomicsnotebook/blob/main/docs/bioc_arch_2.JPG" width="600" />

These kinds of custom deployment options will provide flexibility to the researchers who would like to use cloud technologies. They do not need to keep the VMs, just deploy new resources once needed.

# Custom DSVM deployment command: 

Users need to fill the mandatory fields (subscription ID, resource group etc.) to submit the DSVM deployment command from their terminal.

```az login \
az group deployment create --subscription <SUBSCRIPTION ID> \
-g <RESOURCE_GROUP_NAME> \
--template-uri <TEMPLATE_JSON_LOCATION> \
--parameters <PARAMETERS_JSON_LOCATION> \
--parameters location=<REGION> \
--parameters virtualNetworkId=/subscriptions/<SUBSCRIPTION ID>/resourceGroups/<RESOURCE_GROUP_NAME>/providers/Microsoft.Network/virtualNetworks/<RESOURCE_GROUP_NAME> \
--parameters adminPassword=<VM PASSWORD> \
--parameters virtualMachineSize=Standard_D8s_v3 \
--parameters networkInterfaceName1=<NETWORK_INTERFACE_NAME> \
--parameters networkSecurityGroupName=<NETWORK_SECURITY_GROUP> \
--parameters virtualMachineName=<VMNAME>\
--parameters adminUsername=<USERNAME>
```

# Resources:

1.	[Sample 'template.json'  location for ARM Template](https://datasettoaexample.blob.core.windows.net/publicsample/template.json)
2.	[Sample 'parameters.json' location for ARM Template](https://datasettoaexample.blob.core.windows.net/publicsample/parameters.json)
3.	[Sample command to deploy Custom DSVM](https://datasettoaexample.blob.core.windows.net/publicsample/deployment_command.txt)
  
    _Note: Users need to log-in (az login) their Azure account to use this sample command_
  
4.	[Bioconductor’s system dependency shell file](https://github.com/Bioconductor/bioconductor_docker/blob/master/bioc_scripts/install_bioc_sysdeps.sh)

5. [Demo video for BioC 2022 conference](https://datasettoaexample.blob.core.windows.net/publicsample/record_bioc_22_erdal_cosgun.mp4)

# References:
1.	[Azure VM extensions and features for Linux - Azure Virtual Machines | Microsoft Docs](https://docs.microsoft.com/en-us/azure/virtual-machines/extensions/features-linux)

2.	[Bioconductor on Microsoft Azure - Microsoft Tech Community](https://techcommunity.microsoft.com/t5/healthcare-and-life-sciences/bioconductor-on-microsoft-azure/ba-p/3101837)

3.	[What is the Azure Data Science Virtual Machine - Azure Data Science Virtual Machine | Microsoft Docs](https://docs.microsoft.com/en-us/azure/machine-learning/data-science-virtual-machine/overview)

# Notices
THIS DOCUMENT (README.md) JUST PROVIDES A SAMPLE CODES,INSTRUCTIONS FOR EDUCATIONAL PURPOSES. MICROSOFT DOES NOT CLAIM ANY OWNERSHIP ON THESE CODES AND LIBRARIES. MICROSOFT PROVIDES SHELL FILE FROM BIOCONDUCTOR PROJECT, ARM TEMPLATE FOR CUSTOM DSVM AND ANY MATERIAL ON AN “AS IS” BASIS. MICROSOFT MAKES NO WARRANTIES, EXPRESS OR IMPLIED, GUARANTEES OR CONDITIONS WITH RESPECT TO YOUR USE OF THIS DOCUMENT. TO THE EXTENT PERMITTED UNDER YOUR LOCAL LAW, MICROSOFT DISCLAIMS ALL LIABILITY FOR ANY DAMAGES OR LOSSES, INCLUDING DIRECT, CONSEQUENTIAL, SPECIAL, INDIRECT, INCIDENTAL OR PUNITIVE, RESULTING FROM YOUR USE OF THIS DOCUMENT.

#### Thanks to Bioconductor Project's Core team to provide system dependency shell file.
