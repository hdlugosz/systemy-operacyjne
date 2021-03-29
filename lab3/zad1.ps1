start-process notepad
Get-Process notepad
$ID = Read-Host -Prompt 'Wprowadz numer PID procesu ktory chcesz zakonczyc'

Stop-Process -Id "$ID" -Force

get-process notepad
