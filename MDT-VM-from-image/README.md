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

+ Click the "Deploy to Azure" button to open the deployment UI in the Azure portal.
+ Provide the following information:

  + Name of the VM (as it will appear in Azure). This does not have to be idential to the hostname of the VM.
  + VM size
  + The name of the storage account containing the source image. i.e. _mystorageaccount_
  + The named path of the stored VM image, i.e. _vhds/image.vhd_
  + The name of the existing virtual network to which VMs will be connected
  + The name of the virtual network subnet, i.e. _Default_
  + If the storage account containing the source image is secured, provide the SAS key

## Solution notes

+ Depends on an existing VNet/subnet and properly configured access to an image in an existing Azure storage account.
+ The source image must be uploaded to the storage account as a **page blob**, and must be of **fixed** type.
+ Access to the VM depends on pre-existing user accounts in the image configuration.

## Deployed resources

+ VM
+ Virtual network interface
+ Storage accounts for VM disks and diagnostics data

___
Developed by the **MARVEL Skunkworks Lab**

![alt text](../common/images/maxskunkworkslogo-small.jpg "MARVEL Skunkworks")

Author: Kelley Vice (kvice@microsoft.com)  
https://github.com/maxskunkworks

Last update: _8/20/2019_

## Changelog

+ **8/20/2019**:  Initial commit.
