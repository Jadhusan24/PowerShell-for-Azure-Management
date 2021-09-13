<# Virtual Network 1 #> 
New-AzResourceGroup -Name RG -Location "Southeast Asia"

$vnet = @{
    Name = 'Vnet1'
    ResourceGroupName = 'RG'
    Location = 'Southeast Asia'
    AddressPrefix = '192.168.10.0/24'
    }
    $virtualNetwork = New-AzVirtualNetwork @vnet
    
    $subnet = @{
    Name = 'subnet1'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '192.168.10.0/26'
    }
    $subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet
    
    $virtualNetwork | Set-AzVirtualNetwork


<#-----------------------------------------------------------------------#>

$vnet = @{
    Name = 'Vnet2'
    ResourceGroupName = 'RG'
    Location = 'Southeast Asia'
    AddressPrefix = '192.168.20.0/24'
    }
    $virtualNetwork = New-AzVirtualNetwork @vnet
    
    $subnet = @{
    Name = 'subnet1'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '192.168.20.0/26'
    }
    $subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet
    
    
    $virtualNetwork | Set-AzVirtualNetwork
    


<#Name                   : Vnet2
ResourceGroupName      : RG
Location               : southeastasia
Id                     : /subscriptions/4650f6e6-eddf-427c-926f-a533dcc52b3e/resourceGroups/RG/providers/Microsoft.Network/virtualNetworks/Vnet2
Etag                   : W/"d447b36e-0643-4580-8ee9-3e7ef322f8a7"
ResourceGuid           : be5f57c7-c668-4ef4-ba1d-319db75cb0ee
ProvisioningState      : Succeeded
Tags                   :
AddressSpace           : {
                           "AddressPrefixes": [
                             "192.168.20.0/24"
                           ]
                         }
DhcpOptions            : {
                           "DnsServers": []
                         }
FlowTimeoutInMinutes   : null
Subnets                : [
                           {
                             "Delegations": [],
                             "Name": "subnet1",
                             "Etag": "W/\"d447b36e-0643-4580-8ee9-3e7ef322f8a7\"",
                             "Id":
                         "/subscriptions/4650f6e6-eddf-427c-926f-a533dcc52b3e/resourceGroups/RG/providers/Microsoft.Network/virtualNetworks/Vnet2/subnets/subnet1",
                             "AddressPrefix": [
                               "192.168.20.0/26"
                             ],
                             "IpConfigurations": [],
                             "ServiceAssociationLinks": [],
                             "ResourceNavigationLinks": [],
                             "ServiceEndpoints": [],
                             "ServiceEndpointPolicies": [],
                             "PrivateEndpoints": [],
                             "ProvisioningState": "Succeeded",
                             "PrivateEndpointNetworkPolicies": "Enabled",
                             "PrivateLinkServiceNetworkPolicies": "Enabled",
                             "IpAllocations": []
                           }
                         ]
VirtualNetworkPeerings : []
EnableDdosProtection   : false
DdosProtectionPlan     : null
ExtendedLocation       : null#>