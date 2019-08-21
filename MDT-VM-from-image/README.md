# Deploy MDT VM From Image v1.0

**Time to deploy**: ~10 minutes

The **Deploy MDT VM From Image** template provisions a single VM from an existing WinPE image that you have uploaded to an Azure storage account.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmaxskunkworks%2Farm%2Fmaster%2FMDT-VM-from-image%2Fazuredeploy.json" target="_blank">
<img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fmaxskunkworks%2Farm%2Fmaster%2FMDT-VM-from-image%2Fazuredeploy.json" target="_blank">
<img src="http://armviz.io/visualizebutton.png"/>
</a>

## Usage

You can deploy this template in one of two ways:

+ Click the **Deploy to Azure** button to open the deployment UI in the Azure portal
+ Execute the PowerShell script at https://raw.githubusercontent.com/maxskunkworks/arm/master/MDT-VM-from-image/scripts/deploy-template.ps1 on your local computer.
  >**Note:** To deploy using the PowerShell script, you must first install the Az module. See [Introducing the new Azure PowerShell Az module](https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az) for more details.

+ Provide the following information:

  + Name of the VM (as it will appear in Azure). This does not have to be identical to the hostname of the VM.
  + VM size. i.e. _Standard_DS3_v2_. For more information, see [Sizes for Windows virtual machines in Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes).
  + The name of the storage account containing the source image. i.e. _mystorageaccount_. Do not include the fully qualified URI.
  + The named path of the stored VM image, including the name of the blob folder and any sub-folders, and with no leading slash i.e. _vhds/image.vhd_
  + The name of the existing virtual network to which VMs will be connected, i.e. _MyVNET_
  + The name of the virtual network subnet, i.e. _Default_
  + If the storage account containing the source image is secured, provide the SAS key. The key must be in the _SAS token_ format, including the leading _?_ character, and must have at minimum read access to the _Blob service_ and the _Container_ and _Object_ resource types. For more information, see [Grant limited access to Azure Storage resources using shared access signatures (SAS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview).

## Solution notes

+ Depends on an existing VNet/subnet and properly configured access to an image in an existing Azure storage account.
+ The source image must be uploaded to the storage account as a **page blob**, and must be of **fixed** type.
+ Access to the VM depends on pre-existing user accounts in the image configuration.

## Deployed resources

+ VM resource with a new disk copied from the specified source image
+ Virtual network interface card (NIC) connected to the virtual network
+ Storage accounts for VM disks and diagnostics data

___
Developed by the **MARVEL Skunkworks Lab** <br> ![alt text](../common/images/maxskunkworkslogo-small.jpg "MARVEL Skunkworks") <br> Author: Kelley Vice (kvice@microsoft.com) <br> https://github.com/maxskunkworks

Last update: _8/20/2019_

## Changelog

+ **8/20/2019**:  Initial commit.
