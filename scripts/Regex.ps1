# REGEX
# RegExLib.com
# Há muitos exemplos

Clear-Host

$email = Read-Host Qual seu email?
$regex = "^[a-z]+\.[a-z]+@gmail.com$"

If($email -notmatch $regex){
    Write-Host "Errou o formato de email $email"
}
Else {
    Write-Host "Acertou o formato de email"
}

# Sem considerar se é válido, apenas se o FORMATO é correto

$regexCPF = "^(\d{3}\.?\d{3}\.?\d{3}-?\d{2})$"
# $regexCNPJ = "^(\d{2}\.?\d{3}\.?\d{3}/?\d{4}-?\d{2})$"
$cpf = Read-Host Qual seu CPF?
If($cpf -notmatch $regexCPF){
    Write-Host "Errou o formato de CPF $cpf"
}
Else {
    Write-Host "Acertou o formato de CPF"
}

