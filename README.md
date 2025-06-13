# Get-PropertyFrequencies
Return Frequencies of Property Values Occurrence in PSObject

<img width="963px" alt="RuntimeScreenshot" src="https://github.com/CyberCondor/_media/blob/main/Get-PropertyFrequenciesExample.png" /> 

---

### Import Module to current Session e.g.,:
```PowerShell
# Import-Module
Import-Module Get-PropertyFrequencies
```

### Add Module to PATH e.g.,:
```PowerShell
#Get Relevant PSNodule PATH(s)
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

### Call Get-PropertyFrequencies e.g.,:
```PowerShell
Get-PropertyFrequencies -PropertyName "Property" -Object $Object
Get-PropertyFrequencies -PropertyName "Department" -Object $Users
Get-PropertyFrequencies "OS" $Computers
GPF "ProcessName" (Get-Process)
GPF -PropertyName "Status" -Object (Get-Service)

$Properties = @("Title", "Department", "Enabled", "PasswordExpired", "PasswordLastSet")
$Users = Get-ADUsers -server $server -filter * -properties $Properties
foreach($property in $properties){
    Get-PropertyFrequencies -PropertyName $property -Object $Users
}
```
