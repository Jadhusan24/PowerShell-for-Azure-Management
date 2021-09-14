# Variables for common values
$rgName='RG'
$location="Southeast Asia"

# Create a resource group.
New-AzResourceGroup -Name $rgName -Location $location

# Create virtual network 1.
$vnet1 = New-AzVirtualNetwork -ResourceGroupName $rgName -Name 'Vnet1' -AddressPrefix '192.168.10.0/24' -Location $location

# Create virtual network 2.
$vnet2 = New-AzVirtualNetwork -ResourceGroupName $rgName -Name 'Vnet2' -AddressPrefix '192.168.20.0/24' -Location $location

# Peer VNet1 to VNet2.
Add-AzVirtualNetworkPeering -Name 'Vnet1-Vnet2' -VirtualNetwork $vnet1 -RemoteVirtualNetworkId $vnet2.Id

# Peer VNet2 to VNet1.
Add-AzVirtualNetworkPeering -Name 'Vnet2-Vnet1' -VirtualNetwork $vnet2 -RemoteVirtualNetworkId $vnet1.Id