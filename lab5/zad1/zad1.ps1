#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-childitem?view=powershell-7.1
#https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-member?view=powershell-7.1
#https://social.technet.microsoft.com/Forums/en-US/cdab4808-eb91-4df3-841b-92075a6fa0fb/creating-an-array-from-the-getchilditem-cmdlet?forum=ITCG

# skrypt porownujacy zawartosc dwoch katalogow
# parametry: path1 - sciezka do pierwszego katalogu, path2 - sciezka do drugiego katalogu, Size - porownywanie po rozmiarze, Moddate - porownywanie po dacie ostatniej modyfikacji
param ([Parameter(Mandatory=$true)]$path1, [Parameter(Mandatory=$true)]$path2, [Switch]$Size, [Switch]$Moddate)
 
# sprawdzenie parametrow
if(-not $Size -and -not $Moddate){
    $option = "BaseName"
}
elseif($Size -and -not $Moddate){
    $option = "Length"
}
elseif($Moddate -and -not $Size){
    $option = "LastWriteTime"
}
else{
    $option = "Both"
}


#$option = "BaseName"
#$option = "Length"
#$option = "LastWriteTime"

#$path1 = "C:\Users\huber\Desktop\dir0"
#$path2 = "C:\Users\huber\Desktop\dir0_v2"

# deklaracja pustych tablic na sciezki duplikatow
$1st_dir_dup = @()
$2nd_dir_dup = @()

# rekurencyjne pobranie plikow z podanych sciezek i wpisanie do zmiennych
$files_from_1st_dir= (Get-ChildItem $path1 -Recurse)
$files_from_2nd_dir= (Get-ChildItem $path2 -Recurse)

# petle szukajace duplikatow -> jesli dwa pliki rownaja sie sobie po nazwie, rozmiarze, dacie ostatniej modyfikacji lub 
# rozmiarze i dacie modyfikacji w zaleznosci od podanych parametrow -> sa wpisywane do zadeklarowanych wyzej tablic
For ($i=0; $i -lt $files_from_1st_dir.Count; $i++) {
    For ($j=0; $j -lt $files_from_2nd_dir.Count; $j++){
        if($option -ne "Both"){ # ten warunek wchodzi jesli nie podano zadnego parametru lub podano jeden
            if($files_from_1st_dir[$i].$option  -eq $files_from_2nd_dir[$j].$option){
                
                $1st_dir_dup += $files_from_1st_dir[$i].FullName
                $2nd_dir_dup += $files_from_2nd_dir[$j].FullName
            }
        }
        else{ # ten warunek wchodzi jesli podano oba parametry (-Size i -Moddate)
            if(($files_from_1st_dir[$i].Length  -eq $files_from_2nd_dir[$j].Length) -and ($files_from_1st_dir[$i].LastWriteTime  -eq $files_from_2nd_dir[$j].LastWriteTime)){
                $1st_dir_dup += $files_from_1st_dir[$i].FullName
                $2nd_dir_dup += $files_from_2nd_dir[$j].FullName
            }
        }
    }
}


Write-Host "`nDUPLICATES:"

# wypisanie znalezionych duplikatow w dwukolumnowej tabeli - pierwsza kolumna zawiera sciezki do plikow w pierwszym katalogu, druga odpowiada sciezkom duplikatow w drugim katalogu
$result = for($i = 0; $i -lt $1st_dir_dup.Count; $i++)
{
    [PSCustomObject]@{
    "1st_dir" = $1st_dir_dup[$i]
    "2nd_dir" = $2nd_dir_dup[$i]
    }
}

$result

