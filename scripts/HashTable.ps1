Clear-Host

# Utiliza ';' ao invés de ','
# Usa {} ao invés de () (diferente do Array)
$servidores = [ordered]@{ Server1= "127.0.0.1" ; Server2= "127.0.0.2" ; Server3= "127.0.0.3" }

# Se selecionar essa linha, inclui modificações do script todo
$servidores

# Como um add
$servidores["Server4"] = "127.0.0.4"

# Remove
$servidores.Remove("Server3")

# Test-Connection
# Agora, Server3 não existe mais

# Test-Connection $servidores.Server2

# Exibir valores
$servidores.Values
