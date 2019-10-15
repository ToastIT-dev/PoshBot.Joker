function Get-CorpBuzzword {
    $Header = @{'Accept' = 'application/json'}

    (Invoke-RestMethod -Method Get -Uri 'https://corporatebs-generator.sameerkumar.website/' -Headers $Header -UseBasicParsing).phrase
}
