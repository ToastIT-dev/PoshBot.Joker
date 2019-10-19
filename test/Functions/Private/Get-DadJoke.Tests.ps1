if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

$module = Join-Path  $PSScriptRoot.Substring(0, $PSScriptRoot.indexof('\test')) -ChildPath "\src\PoshBot.Joker.psd1"

Import-Module $module

InModuleScope "PoshBot.Joker" {
    Describe "Get-DadJoke" {
    
        Context "Behaviour of OutPut Type" {
            It "Should Return OutPut Type as String" {
                Get-Joke -Genre "Dad" | Should -BeOfType [String]
            }
        }
    
        Context "Behaviour of Function Calling" {
            Mock -CommandName Invoke-RestMethod
            Get-Joke -Genre "Dad"
            
            It "Invoke-RestMethod Cmdlet Should be Called with GET Method" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $Method -eq "GET" }
            }
            It "Invoke-RestMethod Reaches only the Dad api" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $uri -eq 'https://icanhazdadjoke.com/' }
            }
        }

        Context "Behaviour of Get-DadJoke Calling"{
            Mock -CommandName Get-DadJoke
            
            It "Get-DadJoke Should be called when Dad is passed"{
                Get-Joke -Genre "Dad"
                Assert-MockCalled Get-DadJoke
            }
        }
    }
}