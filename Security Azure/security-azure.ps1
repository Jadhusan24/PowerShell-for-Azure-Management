# Enable Azure Security Center
Set-AzSecurityCenterSubscription -SubscriptionId "YourSubscriptionId" -Tier "Standard"

# Get security recommendations for a resource
Get-AzSecurityRecommendation -ResourceId "YourResourceId"

# Get security alerts
Get-AzSecurityAlert -ResourceId "YourResourceId"

# Enable just-in-time (JIT) VM access
Set-AzJitNetworkAccessPolicy -ResourceGroupName "YourResourceGroup" -VirtualMachineName "YourVM" -Enabled $true

# Configure Azure Firewall
$firewall = Get-AzFirewall -Name "YourFirewallName" -ResourceGroupName "YourResourceGroup"
$ruleCollection = $firewall.FirewallPolicy.Collections | Where-Object {$_.Name -eq "YourRuleCollectionName"}
$ruleCollection.Rules.Add("YourNewRuleName", "YourRulePriority", "YourRuleAction", "YourRuleProtocols", "YourRuleSourceAddresses", "YourRuleDestinationAddresses", "YourRuleDestinationPorts")
Set-AzFirewall -AzureFirewall $firewall

# Enable Azure Network Security Groups (NSGs) on a subnet
$subnet = Get-AzVirtualNetworkSubnetConfig -Name "YourSubnetName" -VirtualNetworkName "YourVirtualNetworkName" -ResourceGroupName "YourResourceGroup"
$subnet.NetworkSecurityGroup = Get-AzNetworkSecurityGroup -Name "YourNSGName" -ResourceGroupName "YourResourceGroup"
Set-AzVirtualNetwork -VirtualNetwork $subnet.Parent

# Enable Azure Active Directory (Azure AD) Privileged Identity Management (PIM)
Set-AzADPrivilegedRoleAssignment -SignInName "YourUser@contoso.com" -ObjectId "YourObjectId" -RoleDefinitionId "YourRoleDefinitionId" -Scope "/subscriptions/YourSubscriptionId"

# Set Azure AD password policy
$policy = Get-AzureADPolicy | Where-Object {$_.Type -eq "PasswordPolicy"}
Set-AzureADPolicy -Id $policy.Id -DisplayName "YourPolicyName" -PasswordPolicies "YourPasswordPolicies"
