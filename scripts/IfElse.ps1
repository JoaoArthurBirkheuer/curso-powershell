# -lt --> less than
# -le --> less than or equal to
# -gt --> greater than
# -ge --> greater than or equal to
# -eq --> equal to
# -ne --> not equal to

# -like --> ($a -like $b) --> comparação de padrões com coringas
    # é case insensitive, mas pode usar -clike
    # usado para comparar se string exibe um padrão comparado a outra
    # '*' é qualquer sequência de caracteres
    # '?' é qualquer caractere

# -notlike --> not($a -like $b)

# -contains --> ($a -contains $b)
    # verificar se um valor pertence a uma coleção

# -notcontains

# -match --> less than
    # verifica se uma string... 
    # ...corresponde a um padrão de expressão regular

# -notmatch --> less than

# -replace --> $a -replace $b,$c
    # Se A possui string B, substitua por C

    Clear-Host
    $Serv = Get-Service -Name EFS
    If($Serv.Status -eq "Running"){
        Write-Host Em execução
    }
    Else{
        Write-Host Serviço parado
    }

    $connection = (Test-Connection www.google.com -Count 1 -Quiet)

    # CHAVES SÃO OBRIGATÓRIAS
    If($connection -eq "true") {Write-Host "Google" -ForegroundColor Red }
    Else {Write-Host "~Google"}