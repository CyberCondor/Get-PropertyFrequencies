# Get-PropertyFrequencies
PowerShell: Return Frequencies of Property Values Occurrence in PSObject

Add to PATH e.g.:
```PowerShell
#Get Relevant PATH(s)
$env:PSModulePath -split ";"
# User env e.g.,
mkdir "~\Documents\WindowsPowerShell\Modules\Get-PropertyFrequencies"
move .\Get-PropertyFrequencies.psd1 "~\Documents\WindowsPowerShell\Modules\Get-PropertyFrequencies\"
move .\Get-PropertyFrequencies.psm1 "~\Documents\WindowsPowerShell\Modules\Get-PropertyFrequencies\"

#Administrative e.g., 
mkdir "C:\Program Files\WindowsPowerShell\Modules\Get-PropertyFrequencies"
move .\Get-PropertyFrequencies.psd1 "C:\Program Files\WindowsPowerShell\Modules\Get-PropertyFrequencies\"
move .\Get-PropertyFrequencies.psm1 "C:\Program Files\WindowsPowerShell\Modules\Get-PropertyFrequencies\"
```

Call Get-PropertyFrequencies e.g.:
```PowerShell
Get-PropertyFrequencies "Property" $Object
Get-PropertyFrequencies "Department" $Users
Get-PropertyFrequencies "OS" $Computers
```
