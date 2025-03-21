# Criação de scripts de longa execução gerenciáveis
# Automatização de processos em outras máquinas

workflow wrkflw
{
    # Write-Host é para o HOST
    Write-Output "Hello World" 
}

# Escreva wrkflow no terminal
# (Get-Command wrkflw).Parameters para ver os parâmetros

# Workflows were removed in PowerShell 7, consider using background jobs, 
# runspaces, or PowerShell 7's ForEach-Object -Parallel

# $PSVersionTable --> VER VERSÃO
# Meu PS atualmente é o 5.1

workflow tarefas{
    # Execução em paralelo
    Parallel{
        Start-Process Notepad
        Start-Process Chrome
    }
}

# Use a function when:

# You need a simple, reusable code block.
# You want full error-handling control.
# You don't need parallel execution or checkpointing.

# Use a workflow (if using PowerShell 5.1 or earlier) when:

# You need parallel execution for large tasks.
# You need the ability to resume execution after a failure.
# You're running long-running automation (e.g., patching multiple servers).
