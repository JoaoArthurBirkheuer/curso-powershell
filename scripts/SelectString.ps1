# Select-String

@"
Nome: João da Silva
Idade: 30
Nota: 8.5

Nome: Maria Oliveira
Idade: 25
Nota: 9.0

Nome: Carlos Souza
Idade: 28
Nota: 7.8
"@ | Set-Content "$PSScriptRoot\dados1.txt"

# Lista todos os arquivos .txt na mesma pasta do script
Get-ChildItem -Path . -Filter *.txt

# Lê e exibe todo o conteúdo do arquivo dados.txt
Get-Content -Path .\dados1.txt

# Exibe apenas as linhas que contêm a palavra "Nota"
Get-Content -Path .\dados1.txt | Select-String -Pattern "Nota"

# Para cada arquivo .txt na pasta atual, lê seu conteúdo e exibe as linhas que contêm "Nome:"
Get-ChildItem -Filter *.txt | ForEach-Object {
    Get-Content -Path $_.FullName | Select-String -Pattern "Nome:"
}

# -NotMatch