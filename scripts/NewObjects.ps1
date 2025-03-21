$wshell = New-Object -ComObject WScript.Shell

$wshell | Get-Member

$wshell.Popup("Curso de PowerShell")

$wshell.Run("NotePad")
Start-Sleep 2
$wshell.SendKeys("Teste")