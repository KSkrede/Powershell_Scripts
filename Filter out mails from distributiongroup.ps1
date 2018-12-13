#Output
$saveto = "C:\members.txt"
#Organizational Units containing users
$ous = "**"

Clear-Variable -Name COMPDG
$COMPDG = ForEach ($ou in $ous){
Get-DistributionGroup -OrganizationalUnit $ou}


foreach ($TargetDG in $COMPDG) {
#add new line with name of group and seperation
	"`r`n$($TargetDG)`r`n=============" | Add-Content $saveto
#Find all memebers and filter to those who follow the criteria
Get-DistributionGroupMember -Identity $TargetDG | Where PrimarySmtpAddress -notlike *@mail1.com | Where PrimarySmtpAddress -notlike *mail2.com | 
#Write to the document
 ForEach-Object {
				$_.Name + "  Email:(" + $_.PrimarySMTPAddress + ")" | Add-Content $saveto
			    }
	}

