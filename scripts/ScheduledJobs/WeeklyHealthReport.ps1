# Define script to collect system information and send email
$ScriptBlock = {
    $Report = Get-ComputerInfo | Out-String
    Send-MailMessage -To "admin@example.com" -From "server@example.com" `
        -Subject "Weekly System Health Report" `
        -Body $Report -SmtpServer "smtp.example.com"
}

# Schedule the job to run every Monday at 8 AM
Register-ScheduledJob -Name "WeeklyHealthReport" `
    -ScriptBlock $ScriptBlock `
    -Trigger (New-JobTrigger -Weekly -DaysOfWeek Monday -At 08:00) `
    -ScheduledJobOption (New-ScheduledJobOption -RunElevated)
