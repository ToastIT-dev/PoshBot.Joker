function Get-Fortune {
    (Invoke-RestMethod -Uri 'http://yerkee.com/api/fortune' -UseBasicParsing).fortune
}
