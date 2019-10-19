if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

$module = Join-Path  $PSScriptRoot.Substring(0, $PSScriptRoot.indexof('\test')) -ChildPath "\src\PoshBot.Joker.psd1"

Import-Module $module

InModuleScope "PoshBot.Joker" {
    Describe "Get-CNorrisJoke" {
    
        Context "Behaviour of OutPut Type" {
            It "Should Return OutPut Type as String" {
                Get-Joke -Genre "ChuckNorris" | Should -BeOfType [String]
            }
        }
    
        Context "Behaviour of Function Calling" {
            Mock -CommandName Invoke-RestMethod
            Get-Joke -Genre "ChuckNorris"
            
            It "Invoke-RestMethod Cmdlet Should be Called with GET Method" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $Method -eq "GET" }
            }
            It "Invoke-RestMethod Reaches only the ChuckNorris api" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $uri -eq 'https://api.chucknorris.io/jokes/random' }
            }
        }

        Context "Behaviour of Get-CNorrisJoke Calling"{
            Mock -CommandName Get-CNorrisJoke
            
            It "Get-ChuckNorris Should be called when ChuckNorris is passed"{
                Get-Joke -Genre "ChuckNorris"
                Assert-MockCalled Get-CNorrisJoke
            }
        }
    }
}