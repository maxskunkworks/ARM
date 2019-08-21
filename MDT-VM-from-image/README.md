# Deploy MDT VM From Image v1.0

**Time to deploy**: ~5 minutes

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
  + The virtual network location (region). This should not be the location display name (_West US_), but the programmatic name (_westus_). You can learn how to get the list of available regions and their names at [Subscriptions - List Locations](https://docs.microsoft.com/en-us/rest/api/resources/Subscriptions/ListLocations).
  + The name of the virtual network subnet, i.e. _Default_
  + If the storage account containing the source image is secured, provide the SAS key. The key must be in the _SAS token_ format, including the leading _?_ character, and must have at minimum read access to the _Blob service_ and the _Container_ and _Object_ resource types. For more information, see [Grant limited access to Azure Storage resources using shared access signatures (SAS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview).

## Solution notes

+ Depends on an existing VNet/subnet and properly configured access to an image in an existing Azure storage account.
+ The source image must be uploaded to the storage account as a **page blob**, and must be of **fixed** type.
+ The resource group you use for your deployment **must** be in the same location as the target virtual network or the deployment will fail.
+ The target virtual network should be the same on to which the MDT server is connected, or there should be a peering relationship between the target virtual network and the MDT server's virtual network.
+ For the sake of simplicity, the resource group and all resources within it should be in the same Azure location.
+ Access to the deployed VM depends on pre-existing user accounts in the image configuration. If you want to be able to access the VM using RDP (Remote Desktop Protocol), you must ensure that RDP is enabled in the source image.

## Deployed resources

+ VM resource with a new disk copied from the specified source image
+ Virtual network interface card (NIC) connected to the virtual network
+ Storage accounts for VM disks and diagnostics data

___
Developed by the **MARVEL Skunkworks Lab** <br> ![alt text](../common/images/maxskunkworkslogo-small.jpg "MARVEL Skunkworks") <br> Author: Kelley Vice (kvice@microsoft.com) <br> https://github.com/maxskunkworks

Last update: _8/21/2019_

## Changelog

+ **8/20/2019**: Initial commit.
+ **8/21/2019**: Added _vnetLocation_ parameter in the event that the target virtual network is in a different location than the resource group.
