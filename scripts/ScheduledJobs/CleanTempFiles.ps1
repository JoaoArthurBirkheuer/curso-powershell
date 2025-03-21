# Define a script block that removes temp files
$ScriptBlock = {
    Get-ChildItem -Path "C:\Temp" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
}

# Create a scheduled job that runs at midnight every day
Register-ScheduledJob -Name "ClearTempFiles" `
    -ScriptBlock $ScriptBlock `
    -Trigger (New-JobTrigger -Daily -At 00:00) `
    -ScheduledJobOption (New-ScheduledJobOption -RequireNetwork -RunElevated)

Disable-ScheduledJob -Name "ClearTempFiles"
Get-ScheduledJob -Name "ClearTempFiles"
