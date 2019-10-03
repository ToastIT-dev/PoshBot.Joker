function Get-CNorrisJoke {
    $Header = @{'Accept' = 'application/json'}

    (Invoke-RestMethod -Method Get -Uri 'https://api.chucknorris.io/jokes/random' -Headers $Header -UseBasicParsing).value
}
