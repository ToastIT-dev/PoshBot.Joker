Function Get-ProgrammingJoke{
    $Header = @{'Accept' = 'application/json'}

 $joke = (Invoke-RestMethod -Method Get -Uri 'https://official-joke-api.appspot.com/jokes/programming/random' -Headers $Header -UseBasicParsing)
 Write-Output "[Question]:: $($joke.Setup)"
 Write-Output "[PunchLine]:: $($joke.punchline)"
}