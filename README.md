# Azure Examples

## Getting Stared

The easiest way to get started using these examples is to used the [Azure Cloud Shell (ACS)](https://shell.azure.com). ACS has all of the tools required to run all of these templates already baked in, without needing to install anything locally to your workstation.

[![Launch Cloud Shell](https://shell.azure.com/images/launchcloudshell.png "Launch Cloud Shell")](https://shell.azure.com/powershell)

*Note: If this is your first time using the Azure Cloud Shell there are some initial setup steps*

### Clone Repo

Clone this 'azure-examples' repository

```bash
git clone https://github.com/hibbertda/azure-examples
```

select the directory for the desired example or template. By default ACS will place the cloned repository in your home directory.

```bash
cd ~
cd ./azure-examples
```

### Template Parameters

Each template has a [Parameters File](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-parameters) to specify configuration parameters for the resource deployment. ACS includes an in [integrated file editor](https://docs.microsoft.com/en-us/azure/cloud-shell/using-cloud-shell-editor). Launch the editor by running **code .** at the cloud shell terminal to open the editor in the current active working directory.

![launch code editor](/img/acs_code_directory.png)

## Examples

### Core Infrastructure

|Name|Description|Type|
| --- | --- | --- |
| [networkHub-Net](/Templates/001-Networking/001-1_networkHub-Net) | Core / Transit VNet | ARM
| [networkHub-s2sVPN](/Templates/001-Networking/001-2_networkHub-s2sVPN) | Add Azure Site-to-Site VPN to existing transit VNet | ARM
| [AppVnet](/Templates/001-Networking/001-3_App-Vnet) | Example VNet for hosting several applications | ARM

### Azure Governance

|Name|Description|Type|
| --- | --- | --- |
| [DeployKeyVault](/Templates/KeyVault) | Deploy an Azure KeyVault with default configuration | ARM
| [DeployVNETHubSpoke](/Templates/VPN-hubSpoke) | Deploy Basic VNet with Site-to-Site VPN | ARM
| [Restrict-VM-Sku](/Policy/restrict-vm-sku) | User Azure Policy to restrict virtual machine SKUs allowed. | Az Policy

### Azure Automation

|Name|Description|Type|
| --- | --- | --- |
| [AAD_GuestReport](/Automation/aad-guest-report) | Use Azure Automation to generate a report of 'Guest' users in Azure Active Directory (AAD). | Az Automation