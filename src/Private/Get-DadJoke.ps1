function Get-DadJoke {
    $Header = @{'Accept' = 'application/json'}

    (Invoke-RestMethod -Method Get -Uri 'https://icanhazdadjoke.com/' -Headers $Header -UseBasicParsing).joke
}
