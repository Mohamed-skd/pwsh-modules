<#
.SYNOPSIS
Generate a password with only numbers and letters

.EXAMPLE
pswd
3Dh2034Mb4m7bX5V
.EXAMPLE
pswd -Size 4
yT84
.EXAMPLE
pswd -Size 32
3RpLo1rWqGxM5MpXqQ6P8QjSc10UyGh7

.NOTES
Alias: pswd
#>

function New-Password {
  [CmdletBinding(DefaultParameterSetName = "Size")]
  param(
    # Size of the password (between 4 & 64)
    [Parameter(ParameterSetName = "Size", Position = 0)]
    [ValidateRange(4, 64)]
    [int] $Size = 16
  ) 
    
  $base = "abcdefghijklmnopqrstuvwxyz0123456789".ToCharArray() 
  $flip = $false 
  $passwd = "" 
  
  for ($i = 0; $i -lt $Size; $i++) {
    $index = Get-Random -Minimum 0 -Maximum ($base.Length - 1) 
    $flip = !$flip 
    $passwd += $flip ? $base[$index].ToString().ToLower() : $base[$index].ToString().ToUpper() 
  }
  
  Write-Output `n$passwd`n 
  Set-Clipboard $passwd 
}

Set-Alias "pswd" New-Password
Export-ModuleMember -Function New-Password -Alias "pswd"
