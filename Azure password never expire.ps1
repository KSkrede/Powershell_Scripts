Install-Module AzureAD
import-module AzureAD
Connect-AzureAD 
$Evokolist = Get-Content -Path C:\Users\kriskr\Documents\Evoko.txt
ForEach ($Evoko in $Evokolist){

$Evoko = Get-AzureADUser -SearchString ABD-3 |Set-AzureADUser -object -PasswordPolicies DisablePasswordExpiration }