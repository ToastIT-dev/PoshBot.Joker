if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

if (Test-Path -Path "$PSScriptRoot/../PoshBot.Joker") {
    Import-Module "$PSScriptRoot/../PoshBot.Joker/PoshBot.Joker.psd1" -Force
} else {
    Import-Module "$PSScriptRoot/../src/PoshBot.Joker.psd1" -Force
}

Describe 'PoshBot.Joker Module' {
    Context 'Import Correctly' {
        It 'should be a script module' {
            (Get-Module PoshBot.Joker).ModuleType | Should -Be 'Script'
        }

        It 'should export two functions' {
            (Get-Command -Module PoshBot.Joker).Count | Should -Be 1
        }
    }
}
