function Get-Joke {
    <#
    .SYNOPSIS
        Get a random joke.
    .DESCRIPTION
        Get a random joke, or fortune cookie message from a selection of APIs.
    .PARAMETER Genre
        The type of joke you're interested in. Genre can be chosen without specifying the parameter. Defaults to 'Dad' jokes.
    .PARAMETER Random
        Randomly selects a genre of joke to be retrieved.
    .EXAMPLE
        !joke

        Gets a random dad joke via default genre.
    .EXAMPLE
        !joke 'Dad'

        Gets a random dad joke by explictly selecting that genre.
    .EXAMPLE
        !joke -Genre 'Geek'

        Gets a random geek / programmer joke specifying the optional '-Genre' identifier.
    .EXAMPLE
        !joke -Random

        Gets a random joke from a random genre.
    #>
    [PoshBot.BotCommand(CommandName = 'joke')]
    [CmdletBinding(DefaultParameterSetName = 'Specific')]
    param (
        [Parameter(Position = 0,
                   ParameterSetName = 'Specific')]
        [ValidateSet('Dad', 'Geek', 'Fortune')]
        [string] $Genre = 'Dad',

        [Parameter(Mandatory,
                   ParameterSetName = 'Random')]
        [switch] $Random
    )

    if ($Random) {
        $Genre = (Get-Variable "Genre").Attributes.ValidValues | Get-Random
    }

    switch ($Genre) {
        Dad { Get-DadJoke }
        Geek { Get-GeekJoke }
        Fortune { Get-Fortune }
    }
}
