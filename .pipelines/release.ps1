[CmdletBinding()]
param(
    [switch]
    $Publish
)

# Publish step
if ($Publish.IsPresent) {
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
