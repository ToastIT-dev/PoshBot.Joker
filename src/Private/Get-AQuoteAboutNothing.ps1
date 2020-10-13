function Get-AQuoteAboutNothing {
    $quoteUri = "https://seinfeld-quotes.herokuapp.com/random"

    try{
        $masterOfMyDomain = Invoke-RestMethod -Method Get -Uri $quoteUri

        $m = $masterOfMyDomain
        Write-Output "$($m.quote) - $($m.author) [Season $($m.season), Episode $($m.episode)]"
    }
    catch{
        Write-Output "No quote for you! Come back one year!!"
    }
}