# Variables
# Utilizar $
# Métodos diversos

Clear-Host

$nome = "João"
$frase = "Olá $nome"

Write-Host "Meu nome é $nome e minha senha no POSTGRESQL é $env:POSTGRESQL_PASSWORD"

$nome = Read-Host "Qual o seu nome? "
Write-Host $frase