# Variables
$resourceGroupName = "YourResourceGroup"
$location = "WestUS"
$vmName = "YourVM"
$vmSize = "Standard_DS2_v2"
$adminUsername = "YourAdminUsername"
$adminPassword = "YourAdminPassword"
$imagePublisher = "Canonical"
$imageOffer = "UbuntuServer"
$imageSku = "16.04-LTS"
$storageAccountName = "YourStorageAccount"
$storageContainerName = "scripts"
$scriptPath = "C:\Scripts\script.sh"
$scriptName = "script.sh"

# Create resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create a virtual machine
$vmConfig = New-AzVmConfig -VMName $vmName -VMSize $vmSize
$vmConfig = Set-AzVMOperatingSystem -VM $vmConfig -Linux -ComputerName $vmName -Credential (Get-Credential -UserName $adminUsername -Password $adminPassword)
$vmConfig = Set-AzVMSourceImage -VM $vmConfig -Publisher $imagePublisher -Offer $imageOffer -Sku $imageSku -Version "latest"
$vmConfig = Set-AzVMOSDisk -VM $vmConfig -Name "$vmName-osdisk" -StorageAccountName $storageAccountName -CreateOption FromImage -Caching ReadWrite -DiskSizeInGB 30
$vmConfig = Add-AzVMNetworkInterface -VM $vmConfig -Id (Get-AzNetworkInterface -ResourceGroupName $resourceGroupName).Id
New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VM $vmConfig

# Upload script to Azure Storage
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$storageContext = $storageAccount.Context
Set-AzStorageBlobContent -Container $storageContainerName -Blob $scriptName -File $scriptPath -Context $storageContext

# Execute script on the virtual machine
$publicIpAddress = (Get-AzVm -ResourceGroupName $resourceGroupName -Name $vmName).Network.PublicIpAddresses.Id
$scriptUrl = "$($storageAccount.PrimaryEndpoints.Blob.ToString())$storageContainerName/$scriptName"
$command = "ssh $adminUsername@$publicIpAddress 'bash -s' < <(curl -s $scriptUrl)"
Invoke-AzVMRunCommand -ResourceGroupName $resourceGroupName -VMName $vmName -CommandId 'RunShellScript' -ScriptPath $command
