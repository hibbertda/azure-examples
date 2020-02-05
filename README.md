# Azure Examples

## Getting Stared

The easiest way to get started using these examples is to used the [Azure Cloud Shell (ACS)](https://shell.azure.com). ACS has all of the tools required to run all of these templates already baked in, without needing to install anything locally to your workstation.

[![Launch Cloud Shell](https://shell.azure.com/images/launchcloudshell.png "Launch Cloud Shell")](https://shell.azure.com/powershell)

##### Note: If this is your first time using the Azure Cloud Shell there are some initial setup steps

## Prerequisite

### Resource Groups

The example deployments are intentded to be placed into Resource Groups based on the role and use of the resources. 

![Resource Groups](/img/prereq_resourcegroups.png)

The Resource Groups are required to be created before the template deployment is started. The Resource Group name is a required parameter for the deployment of an Azure template. 

#### Create Resource Groups

Resource Group can be created from the Azure [Portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal#create-resource-groups), or either the Azure PowerShell or Azure CLI command line environments. 

**Azure PowerShell**

```powershell
New-AzResourceGroup -Name <Resource Group Name>`
    -location <Azure Region Name>
```

**Azure CLI (BASH**)

```bash
az group create --name <Resource Group Name> \
    --location <Azure Region Name>
```

### Clone Azure-Examples git Repository

Clone this 'azure-examples' repository to your Azure Cloud Shell storage. 

```bash
git clone https://github.com/hibbertda/azure-examples
```

select the directory for the desired example or template. By default ACS will place the cloned repository in your home directory.

```bash
cd ~
cd ./azure-examples
```

### Template Parameters

Each template has a [Parameters File](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-parameters) to specify configuration parameters for the resource deployment. Each template includes information on the required parameters and steps for deployment. 

ACS includes an in [integrated file editor](https://docs.microsoft.com/en-us/azure/cloud-shell/using-cloud-shell-editor). Launch the editor by running **code .** at the cloud shell terminal to open the editor in the current active working directory.

![launch code editor](/img/acs_code_directory.png)

![ACS code editor](/img/acs_code_directory_2.png)

Update and save (**Ctrl-S**) the template example files in the ACS code editor. Close the ACS code editor (**Ctrl-Q**) and move on to the template deployment. 

## Example Templates

### 000 Azure Governance

|Name|Description|Type|
| --- | --- | --- |
| [000-1_DeployKeyVault](/Templates/000-governance/000-1_AzureKeyVault) | Deploy an Azure KeyVault with default configuration | ARM
| [000-2_AzureMonitor](/Templates/000-governance/000-2_AzureMonitor) | Deploy Azure Log Analytics Workspace | ARM
| [000-3_AzurePolicy](/Templates/000-governance/000-3_AzurePolicy) | Deploy Azure Policy(ies) | ARM

### 001 Networking

|Name|Description|Type|
| --- | --- | --- |
| [001-1_networkHub-Net](/Templates/001-Networking/001-1_networkHub-Net) | Core / Transit VNet | ARM
| [001-2_networkHub-s2sVPN](/Templates/001-Networking/001-2_networkHub-s2sVPN) | Add Azure Site-to-Site VPN to existing transit VNet | ARM
| [001-3_AppVnet](/Templates/001-Networking/001-3_App-Vnet) | Example VNet for hosting several applications | ARM

### 002 App Deployment


|Name|Description|Type|
| --- | --- | --- |
| [002-1_WingsApp](/Templates/002-AppDeployment/002-1_wingsApp) | IaaS VM deployment | ARM

## Azure Automation

|Name|Description|Type|
| --- | --- | --- |
| [AAD_GuestReport](/Automation/aad-guest-report) | Generate a report of 'Guest' users in Azure Active Directory (AAD). | Az Automation

