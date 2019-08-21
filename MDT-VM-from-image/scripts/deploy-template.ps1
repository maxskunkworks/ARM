<#  deploy-template.ps1
    Kelley Vice 8/20/2019

    Source: https://github.com/maxskunkworks/ARM/tree/master/MDT-VM-from-image

    This script deploys the Deploy MDT VM From Image template to your Azure RM subscription.
    You must have the Az PowerShell module installed on your computer to run this script.
    To install the Az module, execute the following command from an elevated PowerShell prompt:

      Install-Module Az

    For more information about the AZ PowerShell module, see:
    https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az

#>

# Provide parameter values
$subscription = "" # subscription name
$resourceGroup = "" # resource group name
$location = "" # location, i.e. West US
$vmName = "" # The name of the VM
$vmSize = "" # The size of the VM, i.e. Standard_DS3_v2
$storageAccount = "" # The name of the storage account containing the source image
$imageName = "" # The named path of the stored image of the VM you're migrating in the vhds folder of the new storage account, i.e. vhds/image.vhd
$vnetName = "" # The name of the existing virtual network to which VMs will be connected
$vnetLocation = "" # The programmatic name of the of the virtual network's location, i.e. westus
$subnetName = "" # The name of the existing virtual network to which VMs will be connected
$SasKey = "" # Select a VM size for all server VMs in your deployment.

# Do not change these values
$_artifactsLocation = "https://raw.githubusercontent.com/maxskunkworks/arm/master/MDT-VM-from-image" # Location of template artifacts.
$templateUri = "$_artifactsLocation/azuredeploy.json"

# Add parameters to array
$parameters = @{}
$parameters.Add("vmName",$vmName)
$parameters.Add("vmSize",$vmSize)
$parameters.Add("storageAccount",$storageAccount)
$parameters.Add("imageName",$imageName)
$parameters.Add("vnetName",$vnetName)
$parameters.Add("vnetLocation",$vnetLocation)
$parameters.Add("subnetName",$subnetName)
$parameters.Add("SasKey",$SasKey)
$parameters.Add("_artifactsLocation",$_artifactsLocation)

# Log in to Azure subscription
Connect-AzAccount
Get-AzSubscription -SubscriptionName $subscription | Set-AzContext

# Deploy template
New-AzResourceGroupDeployment -Name $vmName -ResourceGroupName $resourceGroup `
  -TemplateFile $templateUri -TemplateParameterObject $parameters -DeploymentDebugLogLevel All