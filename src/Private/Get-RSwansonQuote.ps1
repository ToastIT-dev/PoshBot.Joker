function Get-RSwansonQuote {
    $Header = @{'Accept' = 'application/json' }

    $quote = Invoke-RestMethod -Method Get -Uri 'https://ron-swanson-quotes.herokuapp.com/v2/quotes' -Headers $Header -UseBasicParsing

    Write-Output $quote
}
