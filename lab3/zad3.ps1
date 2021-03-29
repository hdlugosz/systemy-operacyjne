start-process "notepad"
start-process "notepad"
start-process "notepad"
start-process "notepad"

#zaznaczenie procesów po nazwie
$procesy = get-process -name "notepad"

Write-Host "Numery procesów otwartych notatników: "
#wypisanie numerów procesów 
($procesy).Id

#zatrzymanie wszystkich procesów po nazwie
stop-process -name "notepad"