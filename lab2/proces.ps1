#pobranie sciezki z ktorej zostal uruchomiony skrypt
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

#zmiana na sciezke w ktorej zostal uruchomiony skrypt, dzieki czemu folder tworzy sie w miejscu w ktorym znajduje sie skrypt
cd $dir

#sprawdzenie czy istnieje folder o podanej nazwie, jesli nie, tworzy go
if(-NOT(Test-path ".\proces.txt")){
    New-Item proces.txt
}

#petla, ktora co 5 sekund pobiera informacje o procesie zuzywajacym najwiecej CPU, nastepnie informacje te zostaja co 5 sekund dopisane do pliku wraz z godzina
while($true){
    $proces = Get-Process | Sort-Object CPU -desc | Select-Object -first 1
    $czas = Get-Date -Format "HH:mm:ss"
    Add-Content proces.txt "$czas $($proces.name) $($proces.cpu)"
    Start-Sleep -s 5
    Write-Host "."
}