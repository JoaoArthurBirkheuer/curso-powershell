# Define a script to delete old log files
$ScriptBlock = {
    Get-ChildItem -Path "C:\Logs" -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force
}

# Schedule the job to run every Sunday at 1 AM
Register-ScheduledJob -Name "DeleteOldLogs" `
    -ScriptBlock $ScriptBlock `
    -Trigger (New-JobTrigger -Weekly -DaysOfWeek Sunday -At 01:00) `
    -ScheduledJobOption (New-ScheduledJobOption -RunElevated)
