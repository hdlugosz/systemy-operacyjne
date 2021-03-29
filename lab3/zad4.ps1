#parametr
param([string]$IP)

#przykladowe IP wp.pl: 212.77.98.9

$result = Test-Connection -IPv4 $IP -Count 1

if ($result.Status -eq "Success") {
    Write-Host "Adres $IP jest aktywny"
}
else {
    Write-Host "Adres $IP jest nieaktywny"
}
