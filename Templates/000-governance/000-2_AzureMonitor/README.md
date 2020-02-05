# Azure Monitor - Log Analytics Workspace

This template will deploy an [Azure Monitor Log Analytics Workspace](https://docs.microsoft.com/en-us/azure/azure-monitor/overview) to collect and store diagnostic logs and metrics for Azure resources. 

## Resources deployed

- [Log Analytics Workspace](https://docs.microsoft.com/en-us/azure/azure-monitor/overview)



## Parameters

```json
"parameters": {
    "laWorkspaceName": {
        "value": ""
    },
    "laWorkspaceRetentionDays": {
        "value": ""
    },
    "laWorkspaceSKU": {
        "value": ""
    }
```

Azure Log Analytics Workspace - [ARM Template Reference](https://docs.microsoft.com/en-us/azure/azure-monitor/platform/template-workspace-configuration)

---

## Deploy Template

### PowerShell

```powershell
# move to template directory
cd ~/azure-examples/Templates/000-governance/000-2_AzureMonitor

# Deploy AzKeyVault Template
New-AzResourceGroupDeployment -name AzMonDeployment `
    -ResourceGroupName <ResourceGroupName> `
    -TemplateFile ./azMonitor.azrm.json `
    -TemplateParameterFile ./azMonitor.parameters.azrm.json
```

### Azure CLI (BASH)

```bash
# move to template directory
cd ~/azure-examples/Templates/000-governance/000-2_AzureMonitor

az group deployment validate \
    --resource-group <resource-group-name> \
    --template-file ./azMonitor.azrm.json \
    --parameters ./azMonitor.parameters.azrm.json

```

### Azure Portal

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fhibbertda%2fazure-examples%2fmaster%2fTemplates%2f000-governance%2f000-2_AzureMonitor%2fazMonitor.azrm.json" target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.png"/>
</a>

<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fhibbertda%2fazure-examples%2fmaster%2fTemplates%2f000-governance%2f000-2_AzureMonitor%2fazMonitor.azrm.json" target="_blank">
    <img src="https://azuredeploy.net/AzureGov.png"/>
</a>
