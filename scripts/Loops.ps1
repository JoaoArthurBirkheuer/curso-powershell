# for
# foreach
# while

Clear-Host
for($i = 0;$i -lt 10;$i++){
    Write-Host $i
}
Write-Host

foreach($nums in 1,2,3,4,5){
    echo $nums
}

foreach($arquivos in Get-ChildItem) {

    # Gets from C:\Users\User
    if($arquivos.IsReadOnly) {$arquivos}
}

# Fecha qualquer processo utilizando o bloco de notas
# Utilização de pipeline
Get-Process Notepad | foreach kill

$i = 10

# Conta de 9 a 0
while($i--){
    Write-Host $i
}

Write-Host

# Conta de 10 a 0
$i = 10
while($i){
    Write-Host $i
    $i--
}

