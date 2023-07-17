# Set variables
$resourceGroupName = "YourResourceGroup"
$location = "WestUS"
$webAppName = "YourWebApp"
$deploymentPackagePath = "$(System.DefaultWorkingDirectory)/_yourdeploymentpackage.zip"

# Connect to Azure
Connect-AzAccount -ServicePrincipal -Tenant $env:TENANT_ID -ApplicationId $env:SERVICE_PRINCIPAL_ID -CertificateThumbprint $env:CERTIFICATE_THUMBPRINT

# Select Azure subscription
Set-AzContext -SubscriptionId $env:SUBSCRIPTION_ID

# Create or update resource group
New-AzResourceGroup -Name $resourceGroupName -Location $location -Force

# Deploy web app to Azure
Publish-AzWebapp -ResourceGroupName $resourceGroupName -Name $webAppName -ArchivePath $deploymentPackagePath -Force
