##
## Desc: Script to reset the local admin account for a VM running in Azure
## Last updated: 11/07/2022
##

$SubID = "Subscription_ID" 
$RgName = "Resource_Name" 
$VmName = "Machine_Name" 
$Location = "UK South" 

#Install-Module Az #Make sure the Az module has been installed before running script
Import-Module Az

Connect-AzAccount 
Select-AzSubscription -SubscriptionId $SubID 
Set-AzVMAccessExtension -ResourceGroupName $RgName -Location $Location -VMName $VmName -Credential (get-credential) -Name VMAccessAgent  #If you get a 404 not file, make sure the VMAccessAgent is the right name (this can be found in the Azure VM Portal)
