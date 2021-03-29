$parent_process = Start-Process -FilePath "C:\Windows\System32\cmd.exe" -ArgumentList {/c Notepad.exe} -PassThru
($parent_process).Id

#$child_process = Get-Process | Where-Object {$_.Parent.Id -eq $parent_process.Id}

($child_process).Id

Start-Sleep -s 5
Stop-Process -Name "cmd" -Force

