# Exemplo construído com ajuda de IA

# https://www.easy365manager.com/powershell-get-disk-free-space/#:~:text=The%20below%20PowerShell%20function%2C%20Get,it%20to%20your%20own%20code.
function spaceOnDisk {
    $Disks = @()
    $DiskObjects = Get-WmiObject -namespace "root/cimv2" -query "SELECT Name, Capacity, FreeSpace FROM Win32_Volume"
    
    $DiskObjects | % {
        $Disk = New-Object PSObject -Property @{
            Name           = $_.Name
            Capacity       = [math]::Round($_.Capacity / 1073741824, 2)
            FreeSpace      = [math]::Round($_.FreeSpace / 1073741824, 2)
            FreePercentage = [math]::Round($_.FreeSpace / $_.Capacity * 100, 1)
        }
        $Disks += $Disk
    }

    return $Disks | Sort-Object Name
}

# Function to display output in a formatted table
function showDiskSpace {
    $Disks = spaceOnDisk
    $Disks | Format-Table Name, @{L='Capacity (GB)';E={$_.Capacity}}, @{L='FreeSpace (GB)';E={$_.FreeSpace}}, @{L='FreePercentage (%)';E={$_.FreePercentage}} -AutoSize
}

# Call the function to display disk space
showDiskSpace

function somar{
    param($a,$b)
    $res = $a + $b
    Write-Host "A soma é $res"
}

# Recebimento de parâmetros
somar 5 6
