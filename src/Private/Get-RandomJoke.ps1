Function Get-RandomJoke{
    $Header = @{'Accept' = 'application/json'}

 $joke = (Invoke-RestMethod -Method Get -Uri 'https://official-joke-api.appspot.com/random_joke' -Headers $Header -UseBasicParsing)
 Write-Output "[Question]:: $($joke.Setup)"
 Write-Output "[PunchLine]:: $($joke.punchline)"
}