#create a resource group
New-AzResourceGroup -Name RG -Location "Southeast Asia"

#delete a resource group
Remove-AzResourceGroup -Name RG

#delete specific resource
Remove-AzResource `
  -ResourceGroupName RG `
  -ResourceName vm1 `
  -ResourceType Microsoft.Compute/virtualMachines

#gets detail aboout resource group
Get-AzResourceGroup -Name "EngineerBlog"