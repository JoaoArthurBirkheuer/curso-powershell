Get-NetIPConfiguration
# Verificar as Interfaces de IPv4 e IPv6

New-NetIPAddress 192.168.1.102 -InterfaceAlias Ethernet -DefaultGateway 192.168.1.1 -AddressFamily IPv4 -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 192.168.1.123

Set-NetIPInterface -InterfaceAlias Ethernet -Dhcp Enabled
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ResetServerAddress

# Adicionar máquina no domínio

Add-Computer -ComputerName WSOPSH -DomainName "NAME.local"