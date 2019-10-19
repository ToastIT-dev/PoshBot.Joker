if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

$module = Join-Path  $PSScriptRoot.Substring(0, $PSScriptRoot.indexof('\test')) -ChildPath "\src\PoshBot.Joker.psd1"

Import-Module $module

InModuleScope "PoshBot.Joker" {
    Describe "Get-GeneralJoke" {
    
        Context "Behaviour of OutPut Type" {
            It "Should Return OutPut Type as String" {
                Get-Joke -Genre "General" | Should -BeOfType [String]
            }
        }
    
        Context "Behaviour of Function Calling" {
            Mock -CommandName Invoke-RestMethod
            Get-Joke -Genre "General"
            
            It "Invoke-RestMethod Cmdlet Should be Called with GET Method" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $Method -eq "GET" }
            }
            It "Invoke-RestMethod Reaches only the General api" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $uri -eq 'https://official-joke-api.appspot.com/random_joke' }
            }
        }

        Context "Behaviour of Get-GeneralJoke Calling"{
            Mock -CommandName Get-GeneralJoke
            
            It "Get-General Should be called when General is passed"{
                Get-Joke -Genre "General"
                Assert-MockCalled Get-GeneralJoke
            }
        }
    }
}