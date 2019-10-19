if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

$module = Join-Path  $PSScriptRoot.Substring(0, $PSScriptRoot.indexof('\test')) -ChildPath "\src\PoshBot.Joker.psd1"

Import-Module $module

InModuleScope "PoshBot.Joker" {
    Describe "Get-GeekJoke" {
    
        Context "Behaviour of OutPut Type" {
            It "Should Return OutPut Type as String" {
                Get-Joke -Genre "Geek" | Should -BeOfType [String]
            }
        }
    
        Context "Behaviour of Function Calling" {
            Mock -CommandName Invoke-RestMethod
            Get-Joke -Genre "Geek"
            
            It "Invoke-RestMethod Reaches only the Geek api" {
                Assert-MockCalled -CommandName Invoke-RestMethod -ParameterFilter { $uri -eq 'https://sv443.net/jokeapi/category/Programming?blacklistFlags=nsfw,religious,political' }
            }
        }

        Context "Behaviour of Get-GeekJoke Calling"{
            Mock -CommandName Get-GeekJoke
            
            It "Get-GeekJoke Should be called when Geek is passed"{
                Get-Joke -Genre "Geek"
                Assert-MockCalled Get-GeekJoke
            }
        }
    }
}