# EXEMPLO DE SESSÃO PERSISTENTE
# e o que acontece dentro dela

Clear-Host

# Variável da conexão
# Cria conexão
$v = New-PSSession -NAME "WS2012R2"

Invoke-Command -Session $v -ScriptBlock{
    $i = 0
    while($true){
        Write-Host "Contando Até 1000. $i"
        sleep 1
        if($i -eq 1000) {break}
    }
} -AsJob -JobName trabalho

# ### COMANDOS ### #
# O job vai continuar até quando estivermos desconectados
# Ele precisa ser parado e então podemos nos desconectar

Disconnect-PSSession $v
Receive-PSSession $v

# Mantém em cache as informações do job remoto
Get-Job -Name trabalho | Receive-Job -Keep