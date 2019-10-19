if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

$module = Join-Path  $PSScriptRoot.Substring(0, $PSScriptRoot.indexof('\test')) -ChildPath "\src\PoshBot.Joker.psd1"

Import-Module $module

InModuleScope "PoshBot.Joker" {
    Describe "Get-Fortune" {
    
        Context "Behaviour of OutPut Type" {
            It "Should Return OutPut Type as String" {
                Get-Joke -Genre "Fortune" | Should -BeOfType [String]
            }
        }
    
        Context "Behaviour of Function Calling" {
            Mock -CommandName Invoke-RestMethod
            Get-Joke -Genre "Fortune"
            
            It "Invoke-RestMethod Reaches only the Fortune api" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $uri -eq 'http://yerkee.com/api/fortune' }
            }
        }

        Context "Behaviour of Get-Fortune Calling"{
            Mock -CommandName Get-Fortune
            
            It "Get-Fortune Should be called when Fortune is passed"{
                Get-Joke -Genre "Fortune"
                Assert-MockCalled Get-Fortune
            }
        }
    }
}