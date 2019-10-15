function Get-Advice {
    $Header = @{'Accept' = 'application/json'}

    (Invoke-RestMethod -Method Get -Uri 'https://api.adviceslip.com/advice' -Headers $Header -UseBasicParsing).slip.advice
}
