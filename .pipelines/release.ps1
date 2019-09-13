[CmdletBinding()]
param(
    [switch]
    $Publish
)

# Publish step
if ($Publish.IsPresent) {
    if (-not (Get-Module -Name PoshBot -ListAvailable)) {
        Write-Warning "Module 'PoshBot' is missing or out of date. Installing 'PoshBot' ..."
        Install-Module -Name PoshBot -Scope CurrentUser -Force
    }

    # Publish Module to PowerShell Gallery
    Try {
        $Splat = @{
            Path        = (Resolve-Path -Path $env:ArtifactDir\PoshBot.Joker)
            NuGetApiKey = $env:PSGallery
            ErrorAction = 'Stop'
        }
        Publish-Module @Splat

        Write-Output -InputObject ('PoshBot.Joker PowerShell Module published to the PowerShell Gallery')
    } Catch {
        throw $_
    }
}
