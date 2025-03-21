# Import Active Directory module
Import-Module ActiveDirectory

# ==============================
# CREATE NEW AD USERS
# ==============================

# Define user details
$Users = @(
    @{ Name="John Doe"; Username="jdoe"; OU="OU=Employees,DC=example,DC=com" },
    @{ Name="Alice Smith"; Username="asmith"; OU="OU=Employees,DC=example,DC=com" },
    @{ Name="Bob Johnson"; Username="bjohnson"; OU="OU=IT,DC=example,DC=com" }
)

foreach ($User in $Users) {
    New-ADUser -Name $User.Name `
        -GivenName ($User.Name -split " ")[0] `
        -Surname ($User.Name -split " ")[1] `
        -SamAccountName $User.Username `
        -UserPrincipalName "$($User.Username)@example.com" `
        -Path $User.OU `
        -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
        -Enabled $true `
        -PassThru
}

Write-Host "Users created successfully!" -ForegroundColor Green

# ==============================
# CREATE AD SITES
# ==============================

# Define new AD site names
$SiteNames = @("NewYork-Site", "LosAngeles-Site")

foreach ($Site in $SiteNames) {
    New-ADReplicationSite -Name $Site
}

Write-Host "AD Sites created successfully!" -ForegroundColor Green

# ==============================
# CREATE AD SERVICES (Site Links)
# ==============================

# Define site link between New York and Los Angeles
New-ADReplicationSiteLink -Name "NY-LA-Link" -SitesIncluded "NewYork-Site","LosAngeles-Site" -Cost 100 -ReplicationFrequencyInMinutes 15

Write-Host "AD Site Link created successfully!" -ForegroundColor Green

# ==============================
# CREATE ORGANIZATIONAL UNITS (OU)
# ==============================

# Define OUs
$OUs = @("Employees", "IT", "HR", "Finance")

foreach ($OU in $OUs) {
    New-ADOrganizationalUnit -Name $OU -Path "DC=example,DC=com" -ProtectedFromAccidentalDeletion $false
}

Write-Host "Organizational Units created successfully!" -ForegroundColor Green

# ==============================
# ADD USERS TO GROUPS
# ==============================

# Create a security group
New-ADGroup -Name "IT-Admins" -GroupScope Global -Path "OU=IT,DC=example,DC=com"

# Add users to the IT-Admins group
Add-ADGroupMember -Identity "IT-Admins" -Members "bjohnson"

Write-Host " Users added to AD Groups successfully!" -ForegroundColor Green
