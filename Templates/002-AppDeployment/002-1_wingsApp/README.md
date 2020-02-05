# Example App Deployment: WingsApp

The WingsApp is an application that will be deployed to Azure Virtual Machines (IaaS VM). For this application the template(s) are broken out into two peices. Including resources for front-end services, and back-end services.

## Resources deployed

- [Availability Set (AS)](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/manage-availability)
- [Network Interface](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-network-interface)
- [Virtual Machines](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/overview)

## Parameters

### Networking

Define the Resource Group, Virtual Network name (VNet), and Subnet that the Virtual Machine will be connected. The VNet and Subnet need to exist, this template will not create any network resources.

```json
    "networkResourceGroup": {
        "value": ""
    },
    "vNetName": {
        "value": ""
    },
    "vNetSubnetName": {
        "value": ""
    },
```

### VM Image Options

Define the Virtual Machine size and OS image configuration. 

```json
    "vmSKu": {
        "value": ""
    },
    "osImagePublisher": {
        "value": "MicrosoftWindowsServer"
    },
    "osImageOffer": {
        "value": "WindowsServer"
    },
    "osImageSKU": {
        "value": "2016-Datacenter"
    },
    "osDiskType": {
        "value": "Standard_LRS"
    },
```

- [Azure VM Image Reference](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/cli-ps-findimage)
- [Azure VM Size Reference](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/sizes)

### Default Admin Password

The default administrator password for the VM will be stored in an Azure KeyVault. The parameters files needs to be updated to include the **KeyVault ID** and the **secret** name.

```json
    "vmAdminUsername": {
        "value": ""
    },
    "vmAdminPassword": {
        "reference": {
            "keyVault": {
                "id": ""
            },
            "secretName": ""
        }
    },
```

- [Use Azure KeyVault in ARM templates](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/key-vault-parameter?tabs=azure-cli)

## Deploy Template

### PowerShell

```powershell
# move to template directory
cd ~/azure-examples/Templates/002-AppDeployment/002-1_wingsApp

# Deploy AzKeyVault Template
New-AzResourceGroupDeployment -name app1deployment `
    -ResourceGroupName <ResourceGroupName> `
    -TemplateFile ./App1_FE.azrm.json `
    -TemplateParameterFile ./App1_FE.azrm.parameters.json
```

### Azure CLI (BASH)

```bash
# move to template directory
cd ~/azure-examples/Templates/002-AppDeployment/002-1_wingsApp

az group deployment validate \
    --resource-group <resource-group-name> \
    --template-file ./App1_FE.azrm.json \
    --parameters ./App1_FE.azrm.parameters.json

```

### Azure Portal

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/hibbertda/azure-examples/master/Templates/002-AppDeployment/002-1_wingsApp/App1_FE-vms.azrm.json" target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.png"/>
</a>

<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/hibbertda/azure-examples/master/Templates/002-AppDeployment/002-1_wingsApp/App1_FE-vms.azrm.json" target="_blank">
    <img src="https://azuredeploy.net/AzureGov.png"/>
</a>

