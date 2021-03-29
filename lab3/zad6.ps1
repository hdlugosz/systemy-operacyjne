
#Skrypt przyjmuje adres sieci w postaci kropkowodziesiętnej bez ostatniego oktetu i sprawdza adresy od [...].1 do [...].254

param([string]$IP)
#$IP = "192.168.0."

Write-Host "Aktywne adresy:"

for($i=1; $i -lt 255; $i++){
    $IP2 = $IP + $i
    $result = Test-Connection -IPv4 $IP2 -Count 1

    if ($result.Status -eq "Success") {
        Write-Host "$IP2"
    }
}



