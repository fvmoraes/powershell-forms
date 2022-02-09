$Browser = "chrome"
$Urls = Get-Content -Path ./urls.txt | Select-String "[[*]]" -NotMatch
$Urls.GetType() | Format-Table -AutoSize
foreach ($Url in $Urls) 
{
    [system.Diagnostics.Process]::Start($Browser,$Url)
    Start-Sleep -s 1
}