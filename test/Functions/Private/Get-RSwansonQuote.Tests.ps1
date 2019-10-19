if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

$module = Join-Path  $PSScriptRoot.Substring(0, $PSScriptRoot.indexof('\test')) -ChildPath "\src\PoshBot.Joker.psd1"

Import-Module $module

InModuleScope "PoshBot.Joker" {
    Describe "Get-RSwansonQuote" {
    
        Context "Behaviour of OutPut Type" {
            It "Should Return OutPut Type as String" {
                Get-Joke -Genre "RonSwanson" | Should -BeOfType System.String
            }
        }
    
        Context "Behaviour of Function Calling" {
            Mock -CommandName Invoke-RestMethod
            Get-Joke -Genre "RonSwanson"
            
            It "Invoke-RestMethod Cmdlet Should be Called with GET Method" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $Method -eq "GET" }
            }
            It "Invoke-RestMethod Reaches only the Advice api" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $uri -eq 'https://ron-swanson-quotes.herokuapp.com/v2/quotes' }
            }
        }

        Context "Behaviour of Get-RSwansonQuote Calling" {
            Mock -CommandName Get-RSwansonQuote
            
            It "Get-RSwanson Should be called when RonSwanson is passed as Genre" {
                Get-Joke -Genre "RonSwanson"
                Assert-MockCalled Get-RSwansonQuote
            }
        }
    }
}