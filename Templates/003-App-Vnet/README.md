# App VNet Template

This template will deploy a basic networking configuration for an application(s) virtual network (VNet). Each application and/or application tier will have a dedicated subnet and Network Security Group (NSG).

## Resources deployed:
- Virtual Network (VNet)
- Network Security Group (one per Subnet)

## Parameters

The parameters for the template uses an array to define the name and IPv4 address prefix for creating subnets. Each object in the array represents a single subnet. The number of subnets created is determined by the number of objects defined by this parameter. 

```json
      "subnetsList": {
        "type": "array",
        "metadata": {
          "description": "List of subnet names"
        },        
        "defaultValue": [
          {
            "name": "app1Frontend",
            "addressPrefix": "10.5.1.0/24"
          },
          {
            "name": "app1BackEnd",
            "addressPrefix": "10.5.2.0/24"
          },          
          {
            "name": "app2",
            "addressPrefix": "10.5.3.0/24"
          }        
        ]
      },
```

---


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/hibbertda/azure-examples/vpnbreakout/Templates/003-App-Vnet/appVnet.azrm.json" target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.png"/>
</a>


<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/hibbertda/azure-examples/vpnbreakout/Templates/003-App-Vnet/appVnet.azrm.json" target="_blank">
    <img src="https://azuredeploy.net/AzureGov.png"/>
</a>


