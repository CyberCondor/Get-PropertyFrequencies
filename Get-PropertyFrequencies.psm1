function Get-PropertyFrequencies{
    param(
        [Parameter(Mandatory=$true)]
        [string]$PropertyName,

        [Parameter(Mandatory=$true)]
        [PSObject]$Object
    )
    if(!($Object | Get-Member |where Name -eq $PropertyName)){Write-Warning "Property '$($PropertyName)' not found in object";return $null}
    $Total = ($Object).count
    if($Total -le 0){return $null}
    $ProgressCount = 0
    $AllUniquePropertyValues = $Object | select $PropertyName | sort $PropertyName | unique -AsString # Get All Uniques
    $PropertyFrequencies = [System.Collections.Generic.List[PSObject]]::new()                         # Init empty Object
    $isDate = $false                                                                                                                                                          
    foreach($UniqueValue in $AllUniquePropertyValues){
        if(!($isDate -eq $true)){
            if([string]$UniqueValue.$PropertyName -as [DateTime]){$isDate = $true}
        }
        $PropertyFrequencies.Add([PSCustomObject]@{$PropertyName=$($UniqueValue.$PropertyName);Count=0;Frequency="100%"}) # Copy Uniques to Object Array and Init Count as 0
    }
    if(($isDate -eq $true) -and (($Object | Select $PropertyName | Get-Member).Definition -like "*datetime*")){
        foreach($PropertyFrequency in $PropertyFrequencies){
            if(($PropertyFrequency.$PropertyName) -and ([string]$PropertyFrequency.$PropertyName -as [DateTime])){
                try{$PropertyFrequency.$PropertyName = $PropertyFrequency.$PropertyName.ToString("yyyy-MM-dd")}
                catch{# Nothing
                }
            }
        }
        foreach($PName in $Object.$PropertyName){                                                        # For each value in Object
            if($Total -gt 0){Write-Progress -id 1 -Activity "Finding $PropertyName Frequencies -> ( $([int]$ProgressCount) / $Total )" -Status "$(($ProgressCount++/$Total).ToString("P")) Complete"}
            foreach($PropertyFrequency in $PropertyFrequencies){                                         # Search through all existing Property values
                if(($PName -eq $null) -and ($PropertyFrequency -eq $null)){$PropertyFrequency.Count++}   # If Property value is NULL, then add to count - still want to track this
                elseif($PName -ceq $PropertyFrequency.$PropertyName){$PropertyFrequency.Count++}         # Else If Property value is current value, then add to count
                else{
                    try{if($PropertyName.ToString("yyyy-MM-dd") -ceq $PropertyFrequency.$PropertyName){$PropertyFrequency.Count++}}
                    catch{# Nothing
                    }
                }
            }
        }
    }
    else{
        foreach($PName in $Object.$PropertyName){                                                        # For each value in Object
            if($Total -gt 0){Write-Progress -id 1 -Activity "Finding $PropertyName Frequencies -> ( $([int]$ProgressCount) / $Total )" -Status "$(($ProgressCount++/$Total).ToString("P")) Complete"}
            foreach($PropertyFrequency in $PropertyFrequencies){                                         # Search through all existing Property values
                if(($PName -eq $null) -and ($PropertyFrequency -eq $null)){$PropertyFrequency.Count++}   # If Property value is NULL, then add to count - still want to track this
                elseif($PName -ceq $PropertyFrequency.$PropertyName){$PropertyFrequency.Count++}         # Else If Property value is current value, then add to count
            }
        }
    }
    Write-Progress -id 1 -Completed -Activity "Complete"
    if($Total -gt 0){
        foreach($PropertyFrequency in $PropertyFrequencies){$PropertyFrequency.Frequency = ($PropertyFrequency.Count/$Total).ToString("P")}
    }
    
    return $PropertyFrequencies | select Count,$PropertyName,Frequency | sort Count,$PropertyName | Unique -AsString
}

Set-Alias -Name GPF -Value Get-PropertyFrequencies

Export-ModuleMember -Function Get-PropertyFrequencies -Alias GPF