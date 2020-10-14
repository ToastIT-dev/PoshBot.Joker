function Get-AQuoteAboutNothing {
    $quoteUri = "https://seinfeld-quotes.herokuapp.com/random"

    try{
        # Are you master of your domain?
        $m = Invoke-RestMethod -Method Get -Uri $quoteUri

        Write-Output "$($m.quote) - $($m.author) [Season $($m.season), Episode $($m.episode)]"
    }
    catch{
        # [Slams money on the counter] I'm out!!
        Write-Output "No quote for you! Come back one year!!"
    }
}