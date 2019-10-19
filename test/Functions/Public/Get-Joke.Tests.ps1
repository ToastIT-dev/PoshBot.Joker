if (Get-Module -Name 'PoshBot.Joker') {
    Remove-Module -Name 'PoshBot.Joker'
}

$module = Join-Path  $PSScriptRoot.Substring(0, $PSScriptRoot.indexof('\test')) -ChildPath "\src\PoshBot.Joker.psd1"

Import-Module $module
      
$path = Join-Path $PSScriptRoot.Substring(0,$PSScriptRoot.IndexOf("\test")) -ChildPath "src\Private\"
$PrivateFunctions = Get-ChildItem -Path $path -File

InModuleScope "PoshBot.Joker"{
Describe "Get-Joke" {
    BeforeAll{
        $PrivateFunctions | ForEach-Object {
            Mock -CommandName $_.Name.Substring(0,$_.Name.LastIndexOf(".ps1")) {return "String"}
        }
      }
    Context "Get-Joke with Possible Parameter Values" {
        
        It "Should Call Get-Joke With Random Parameter" {
            Get-Joke -Random | Should -BeOfType [String]
            
        }
        
        It "Should Call Get-Joke Without Passing Parameter By default genre as Dad"{
            Get-Joke 
            Assert-MockCalled Get-DadJoke
        }
    }

    Context "Behaviour of Possible Genre Parameter Values "{
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
        It "Should call the Valid Genre Values" -TestCases $testdata{
            param(
                $Genre
            )
            Get-Joke -Genre $Genre | Should -BeOfType [String]
        } 
        It "Should Throw if invalid values passed in the Genre Parameter"{
            $message = "Cannot validate argument on parameter 'Genre'. The argument 'InvalidValue' does not belong to the set 'Dad,Geek,Fortune,ChuckNorris,RonSwanson,CorpBuzzword,Advice,Programming,General' specified by the ValidateSet attribute. Supply an argument that is in the set and then try the command again."
            {Get-Joke -Genre "InvalidValue" -ErrorAction Stop} | Should -Throw 
        }
    }
}
}