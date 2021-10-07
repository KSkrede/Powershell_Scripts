# Take cmd parameters
param(
    [parameter()]
    [String]$BackupPath
)

#Creates folder if it does not exists

If (!(test-path $BackupPath))
{
    md $BackupPath
}

# Connect to Azure AD
Connect-AzureAD

$AllPolicies = Get-IntuneDeviceConfigurationPolicy

foreach ($Policy in $AllPolicies) {
    Write-Output "Backing up $($Policy.DisplayName) to ($BackupPath) "
    $PolicyJSON = $Policy | ConvertTo-Json -Depth 6
    $PolicyJSON | Out-File "$BackupPath\$($Policy.DisplayName).json"
}
$Policycombined = $AllPolicies | ConvertTo-Json -Depth 6
$Policycombined | Out-File "$BackupPath\combined.json"