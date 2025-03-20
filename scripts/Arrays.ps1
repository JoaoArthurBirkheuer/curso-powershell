# Arrays

# Se outra coisa estiver em execução, o ISE não
# te fornecerá auto-complete

Clear-Host
$GoogleDNS = @("8.8.8.8","8.8.4.4")
$TotalDNS = $GoogleDNS.Count
Write-Host Pingando todos os $TotalDNS DNS do Google

# Test-Coonection é como um ping
Test-Connection $GoogleDNS -Count 1

sleep 3

Write-Host FIM!