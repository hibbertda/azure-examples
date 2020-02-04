# Azure Examples



## Getting Stared ##

The easiest way to get started using these examples is to used the [Azure Cloud Shell (ACS)](https://shell.azure.com). ACS has all of the tools required to run all of these templates already baked in, without needing to install anything locally to your workstation.

### Clone Repo ###
Clone this 'azure-examples' repository

```bash
git clone https://github.com/hibbertda/azure-examples
```

select the directory for the desired example or template. By default ACS will place the cloned repository in your home directory.

```bash
cd ~/azure-examples
```
### Template Parameters ###
Each template has a [Parameters File](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-parameters) to specify configuration parameters for the resource deployment. 

ACS includes an in [integrated file editor](https://docs.microsoft.com/en-us/azure/cloud-shell/using-cloud-shell-editor). 

## Examples ##

## Automation
||Description|
| --- | --- |
| [AAD_GuestReport] | Use Azure Automation to generate a report of 'Guest' users in Azure Active Directory (AAD).

## Azure Policy
||Description|
| --- | --- | 
| [Restrict-VM-Sku] | User Azure Policy to restrict virtual machine SKUs allowed. 

# ARM Templates

## Core Infrastructure 
|Name|Description|Type|
| --- | --- | --- |
| [networkHub-Net] | Core / Transit VNet | ARM
| [networkHub-s2sVPN] | Add Azure Site-to-Site VPN to existing transit VNet | ARM
| [AppVnet] | Example VNet for hosting several applications | ARM
| [DeployKeyVault] | Deploy an Azure KeyVault with default configuration | ARM
| [DeployVNETHubSpoke] | Deploy Basic VNet with Site-to-Site VPN | ARM

## Azure Governance



[AAD_GuestReport]:/Automation/aad-guest-report

[Restrict-VM-Sku]:/Policy/restrict-vm-sku

[networkHub-Net]:/Templates/001-networkHub-Net
[networkHub-s2sVPN]:/Templates/002-networkHub-s2sVPN
[AppVnet]:/Templates/003-App-Vnet
[DeployKeyVault]:/Templates/KeyVault
[DeployVNETHubSpoke]:/Templates/VPN-hubSpoke
