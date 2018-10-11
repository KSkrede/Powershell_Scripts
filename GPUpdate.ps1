$RemoteComputers = Get-Content -Path C:\Users\kriskr_admin\Documents\PCList.txt
$timer = (Get-Date -Format yyyy-MM-dd-HHmm)
$filename = "C:\Users\kriskr_admin\Documents\" + $timer + "_error_log.txt"
ForEach ($Computer in $RemoteComputers)
{
     Try
         {
            Invoke-GPUpdate -Computer $Computer -Force 
         }
     Catch
         {
             Add-Content $filename $Computer
             
         }
             
}


Dette er en test2fggfdgdfgdfg