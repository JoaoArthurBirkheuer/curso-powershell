# Instalação do PSWA

Install-WindowsFeature -name WindowsPowerShellWebAccess -ComputerName WSPOSH -IncludeManagementTools
# Uninstall-WindowsFeature -Name WindowsPowerShellAccess

Install-PswaWebApplication -WebApplicationName PSWA -UseTestCertificate
# Uninstall-PswaWebApplication -WebApplicationName PSWA

# ISSO É PARA FINS DE TESTE APENAS
Add-PswaAuthorizationRule -ComputerGroupName * -configurationName * -UserGroupName *
Get-PswaAuthorizationRule
#Remove-PswaAuthorizationRule