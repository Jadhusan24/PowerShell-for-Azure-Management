# Connect to Azure
Connect-AzAccount

# Create a new resource group
New-AzResourceGroup -Name "myResourceGroup" -Location "WestUS"

# Create a new virtual machine
New-AzVm -ResourceGroupName "myResourceGroup" -Name "myVM" -Location "WestUS" -Image "UbuntuLTS" -Size "Standard_DS2_v2" -Credential (Get-Credential) -OpenPorts 80, 443

# Create a new Azure storage account
New-AzStorageAccount -ResourceGroupName "myResourceGroup" -Name "mystorageaccount" -Location "WestUS" -SkuName "Standard_LRS" -Kind "StorageV2"

# List all virtual machines in a resource group
Get-AzVm -ResourceGroupName "myResourceGroup"

# Start a virtual machine
Start-AzVm -ResourceGroupName "myResourceGroup" -Name "myVM"

# Stop a virtual machine
Stop-AzVm -ResourceGroupName "myResourceGroup" -Name "myVM" -Force

# List all storage accounts
Get-AzStorageAccount

# Delete a resource group and all its resources
Remove-AzResourceGroup -Name "myResourceGroup" -Force
