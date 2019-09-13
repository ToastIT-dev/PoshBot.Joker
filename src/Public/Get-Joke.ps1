function Get-Joke {
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
