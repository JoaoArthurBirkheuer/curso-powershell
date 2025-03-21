# Jobs
# Permitem execução de comandos em Background em um PC local ou remoto
#Start-Job, Get-Job, Wait-Job, Receive-Job, Stop-Job, Remove-Job

# Scheduled Jobs --> trabalham com triggers

workflow demorado{
    while(1){
        (Get-Date).ToString() + "Script Demorado"
        Start-Sleep -Seconds 2
    }
}

Clear-Host

$wf = demorado -AsJob

Receive-Job $wf
Suspend-Job $fw -Force
Stop-Job $wf
Resume-Job