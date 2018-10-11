$RemoteComputers = Get-Content -Path C:\Users\kriskr_admin\Documents\PCList2.txt
$timer = (Get-Date -Format yyyy-MM-dd-HHmm)
$filename = "C:\Users\kriskr_admin\Documents\" + $timer + "_error_log.txt"
ForEach ($Computer in $RemoteComputers)
{
     Try
         {
          Invoke-Command -ComputerName $Computer -ScriptBlock { Start-Process -FilePath "C:\Windows\SysWOW64\msiexec.exe" -ArgumentList "/x {7A4192A1-84C4-4E90-A31B-B4847CA8E23A} KLLOGIN=***** KLPASSWD=**********"} -ErrorAction Stop
         }
     Catch
         {
             Add-Content $filename $Computer
             
         }
             
}  
