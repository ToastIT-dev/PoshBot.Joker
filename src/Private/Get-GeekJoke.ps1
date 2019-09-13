function Get-GeekJoke {
    do {
    $Joke = Invoke-RestMethod -Uri 'https://sv443.net/jokeapi/category/Programming?blacklistFlags=nsfw,religious,political' -UseBasicParsing
    } while ($Joke.setup -like '*God*' -or $Joke.setup -like '*sex*' -or $Joke.joke -like '*sex*' -or $Joke.setup -like '*Gender*' -or $Joke.joke -like '*snuts*')

    if ($Joke.type -eq 'single') {
        $Joke.joke
    } else {
        $Joke.setup

        Start-Sleep -Seconds (Get-Random -Minimum 3 -Maximum 8)

        $Joke.delivery
    }
}
