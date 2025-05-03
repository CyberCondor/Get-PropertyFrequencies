$ModuleName = "Get-PropertyFrequencies"
New-ModuleManifest -Path ".\$($ModuleName)\$($ModuleName).psd1" `
    -RootModule      "$($ModuleName).psm1" `
    -ModuleVersion   '3.3.3' `
    -Author          'Connor Ross (@CyberCondor)' `
    -CompanyName     'NULL' `
    -Description     "$($ModuleName)" `
    -Tags          @('CyberCondor','GPF','Get-PropertyFrequencies')`
    -ProjectUri      'https://github.com/CyberCondor/Get-PropertyFrequencies' `
    -HelpInfoURI     'https://github.com/CyberCondor/Get-PropertyFrequencies' `
    -NestedModules @(
    )`
    -RequiredModules @(
    )`
    -PowerShellVersion     '5.1' `
    -PowerShellHostName    '' `
    -ProcessorArchitecture 'None' `
    -CmdletsToExport      @() `
    -ModuleList           @("$($ModuleName).psm1") `
    -FileList             @("$($ModuleName).psm1","$($ModuleName).psd1") `
    -FunctionsToExport    @('Get-PropertyFrequencies') `
    -AliasesToExport      @('GPF') `
    -ReleaseNotes "Initial Public Release" `
    -LicenseUri 'https://github.com/CyberCondor/Get-PropertyFrequencies/blob/main/LICENSE'