if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

$module = Join-Path  $PSScriptRoot.Substring(0, $PSScriptRoot.indexof('\test')) -ChildPath "\src\PoshBot.Joker.psd1"

Import-Module $module

InModuleScope "PoshBot.Joker" {
    Describe "Get-Joke" {
        BeforeAll {

            Mock -CommandName Get-DadJoke { return "String" }
        }
        Context "Get-Joke with Possible Parameter Values" {
        
            It "Should Call Get-Joke With Random Parameter" {
                Get-Joke -Random | Should -BeOfType [String]
            
            }
        
            It "Should Call Get-Joke Without Passing Parameter By default genre as Dad" {
                Get-Joke 
                Assert-MockCalled Get-DadJoke
            }
        }

        Context "Behaviour of Possible Genre Parameter Values " {
            $testdata = @(
                @{ Genre = 'Dad' }
                @{ Genre = 'Geek' }
                @{ Genre = 'Fortune' }
                @{ Genre = 'ChuckNorris' }
                @{ Genre = 'RonSwanson' }
                @{ Genre = 'Advice' }
                @{ Genre = 'Programming' }
                @{ Genre = 'General' }
            )
            It "Should call the Valid Genre Values" -TestCases $testdata {
                param(
                    $Genre
                )
                Get-Joke -Genre $Genre | Should -BeOfType [String]
            } 
            It "Should Throw if invalid values passed in the Genre Parameter" {
                { Get-Joke -Genre "InvalidValue" -ErrorAction Stop } | Should -Throw 
            }
        }
    }
}