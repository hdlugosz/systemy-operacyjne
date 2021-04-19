# Get the path from which the script was run
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath

# Change to the path where the script was run
cd $dir

# Create shortcut

$Source = ".\shortcut.lnk"
$Destination = "$dir.\origin_file.txt"
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($Source)
$Shortcut.TargetPath = $Destination
$Shortcut.Save()

# Create SymbolicLink
# Need to open Powershell as Administrator 
New-Item -ItemType SymbolicLink -Path .\symLink.txt -Target .\origin_file.txt

# Create HardLink
New-Item -ItemType HardLink -Path .\hardLink.txt -Target .\origin_file.txt

# Create Junction
New-Item -ItemType  Junction -Path .\junction.txt -Target C:/Windows/System32/ 
