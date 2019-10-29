if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

$module = Join-Path  $PSScriptRoot.Substring(0, $PSScriptRoot.indexof('\test')) -ChildPath "\src\PoshBot.Joker.psd1"

Import-Module $module

InModuleScope "PoshBot.Joker" {
    Describe "Get-ProgrammingJoke" {
    
        Context "Behaviour of OutPut Type" {
            It "Should Return OutPut Type as String" {
                Get-Joke -Genre "Programming" | Should -BeOfType [String]
            }
        }
    
        Context "Behaviour of Function Calling" {
            Mock -CommandName Invoke-RestMethod
            Get-Joke -Genre "Programming"
            
            It "Invoke-RestMethod Cmdlet Should be Called with GET Method" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $Method -eq "GET" }
            }
            It "Invoke-RestMethod Reaches only the Programming api" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $uri -eq 'https://official-joke-api.appspot.com/jokes/programming/random' }
            }
        }

        Context "Behaviour of Get-ProgrammingJoke Calling" {
            Mock -CommandName Get-ProgrammingJoke
            
            It "Get-Programming Should be called when Programming is passed" {
                Get-Joke -Genre "Programming"
                Assert-MockCalled Get-ProgrammingJoke
            }
        }
    }
}