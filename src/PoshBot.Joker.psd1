@{
    RootModule        = 'PoshBot.Joker.psm1'
    ModuleVersion     = '0.0.1'
    GUID              = '76c6ca86-11f0-4e5e-b484-9289adf3c210'
    Author            = 'Josh (Windos) King'
    CompanyName       = 'ToastIT.dev'
    Copyright         = '(c) 2019 Josh (Windos) King. All rights reserved.'
    Description       = 'PoshBot PowerShell module for retrieving jokes. Icon made by [Freepik](https://www.flaticon.com/authors/freepik) from [www.flaticon.com](https://www.flaticon.com/)'
    PowerShellVersion = '5.0.0'
    RequiredModules   = @('PoshBot')
    FunctionsToExport = 'Get-Joke'
    CmdletsToExport   = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags         = @('Humor', 'PoshBot', 'ChatOps')
            LicenseUri   = 'https://github.com/ToastIT-dev/PoshBot.Joker/blob/master/LICENSE'
            ProjectUri   = 'https://github.com/ToastIT-dev/PoshBot.Joker'
            IconUri      = 'https://raw.githubusercontent.com/ToastIT-dev/PoshBot.Joker/master/Media/jester.png'
            ReleaseNotes = '# 0.0.1

* Initial release
'
        }
    }
}