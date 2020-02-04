# Azure KeyVault (AKV) template

This template will deploy an [Azure KeyVault (AKV)](https://docs.microsoft.com/en-us/azure/key-vault/) to store and manage secrets used in template deployments. In addition an Azure Storage Account used to store [KeyVault audit logs](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-logging) for the specified log retention period.

## Resources deployed

- [Azure KeyVault](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-overview)
- [Azure Storage Account](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-logging) for storing audit logs

This template will deploy an 

## Parameters

```json
"parameters": {
    "keyVaultName": {
        "value": ""
    },
    "aadTenantID": {
        "value": ""
    },
    "kvGroupObjectID": {
        "value": ""
    },
    "enabledForDeployment": {
        "value": true
    },
    "enabledForDiskEncryption": {
        "value": ""
    },
    "enabledforTemplateDeployment": {
        "value": ""
    },
    "kvSKU": {
        "value": ""
    },
    "kvLogStorageAccountName": {
        "value": ""
    },
    "kvLogRetention": {
        "value": ""
    },
```

Azure KeyVault [ARM Template Reference](https://docs.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2018-02-14/vaults)

---

## Deploy Template

### PowerShell

```powershell
# move to template directory
cd ~/azure-examples/Templates/000-governance/000-1_AzureKeyVault

# Deploy AzKeyVault Template
New-AzResourceGroupDeployment -name AzKVDeployment `
    -ResourceGroupName <ResourceGroupName> `
    -TemplateFile ./000-1_azKeyVault.azrm.json `
    -TemplateParameterFile ./000-1_azKeyVault.azrm.parameters.json
```

### Azure Portal

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fhibbertda%2fazure-examples%2fmaster%2fTemplates%2f000-governance%2f000-1_AzureKeyVault%2f000-1_azKeyVault.azrm.json" target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.png"/>
</a>

<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fhibbertda%2fazure-examples%2fmaster%2fTemplates%2f000-governance%2f000-1_AzureKeyVault%2f000-1_azKeyVault.azrm.json" target="_blank">
    <img src="https://azuredeploy.net/AzureGov.png"/>
</a>
