#pobranie sciezki z ktorej zostal uruchomiony skrypt
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

#zmiana na sciezke w ktorej zostal uruchomiony skrypt, dzieki czemu folder tworzy sie w miejscu w ktorym znajduje sie skrypt
cd $dir

#sprawdzenie czy istnieje folder o podanej nazwie, jesli nie, tworzy go
if(-NOT(Test-path ".\czas.txt")){
    New-Item czas.txt
}

#petla, ktora co 5 sekund pobiera informacje o godzinie, nastepnie dopisuje to do pliku
while($true){
    Get-Date -Format "dddd HH:mm:ss" >> czas.txt
    Start-Sleep -s 5
    Write-Host "."
}