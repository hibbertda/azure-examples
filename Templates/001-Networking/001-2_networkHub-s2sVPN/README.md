# networkHub-S2S VPN Template

This template will deploy an Azure Site-to-Site VPN configuration to an existing Azure VNet. 

## Resources deployed:
- VPN Gateway
- Local Gateway
- VPN Connection
- Public IP
- Gateway subnet (Created in existing transit VNet)


This template is a companion to the networkHub-Net core/transit VNet template. [networkHub-Net Template](../001-networkHub-Net) 

does not include a VPN. To add a VPN use the S2SVPN template to add a VPN configuration to an existing VNet. 

__Note: The deployment of a VPN Gateway can take 20 - 30 minutes__

## Paramaters

There are several parameters required for succesful deployment of this VPN configuration. 

**localGatewayIpAddress**
The publicly accessable IP address for the local (on-prem) VPN endpoint.

```json
"localGatewayIpAddress": {
    "type": "string",
    "metadata": {
        "description": "Local Gateway Public IP Address"
    }
},
```
**localAddressprefix**
Local networks address space(s)

```json
"localAddressPrefix": {
    "type": "array",
    "metadata": {
        "description": "CIDR block(s) of address prefixes for OnPrem network(s)"
    },
    "defaultValue": [
        "192.168.2.0/24"
    ]
},
```        
**VpnSharedKey**
IPSec Pre-Shared Key

```json
"vpnSharedKey": {
    "type": "securestring",
    "metadata": {
        "description": "IPSEC Preshared Key"
    }
},
```        

## References

Create a VNet with a Site-to-Site VPN Connection --
[Azure Docs](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-create-site-to-site-rm-powershell) 




---


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https://raw.githubusercontent.com/hibbertda/azure-examples/wings2/Templates/001-Networking/001-2_networkHub-s2sVPN/nethub-vpn.azrm.json" target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.png"/>
</a>


<a href="https://portal.azure.us/#create/Microsoft.Template/uri/https%3a%2f%2fraw.githubusercontent.com%2fhibbertda%2fazure-examples%2fwings2%2fTemplates%2f001-Networking%2f001-2_networkHub-s2sVPN%2fnethub-vpn.azrm.json" target="_blank">
    <img src="https://azuredeploy.net/AzureGov.png"/>
</a>


