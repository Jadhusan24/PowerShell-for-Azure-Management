# Create a resource group
New-AzResourceGroup -Name RG -Location "Southeast Asia"

<# Virtual Machine 1 #> 
New-AzVm `
-ResourceGroupName "RG" `
-Name "VM1" `
-Location "Southeast Asia" `
-VirtualNetworkName "vnet1" `
-SubnetName "subnet1" `
-PublicIpAddressName "vm1PubAdd" `
-OpenPorts 3389 `
-Image "Win2012R2Datacenter" `
-Size "Standard_DS1_v2"

<# Virtual Machine 2 #> 
New-AzVm `
-ResourceGroupName "RG" `
-Name "VM2" `
-Location "Southeast Asia" `
-VirtualNetworkName "vnet1" `
-SubnetName "subnet2" `
-PublicIpAddressName "vm2PubAdd" `
-OpenPorts 3389 `
-Image "Win2012R2Datacenter" `
-Size "Standard_DS1_v2"

#To stop the vm 
Stop-AzVM -ResourceGroupName "myResourceGroup" -Name "myVM"

#To start the vm 
Start-AzVM -ResourceGroupName "myResourceGroup" -Name "myVM"

#To restart the vm 
Restart-AzVM -ResourceGroupName "myResourceGroup" -Name "myVM"



