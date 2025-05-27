<#
.SYNOPSIS
Generate a Lorem Ipsum

.EXAMPLE 
lorem

Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis eos ipsum aut laudantium nihil aliquid, vel a odio eaque quisquam dignissimos quo. Beatae similique aspernatur ipsam, rerum expedita ducimus, dignissimos sapiente praesentium id velit sint, aliquid ab reprehenderit numquam? Dignissimos maxime provident molestiae veritatis rem eius ea labore expedita dolorem.
.EXAMPLE
lorem -Count 3

Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis eos ipsum aut laudantium nihil aliquid, vel a odio eaque quisquam dignissimos quo. Beatae similique aspernatur ipsam, rerum expedita ducimus, dignissimos sapiente praesentium id velit sint, aliquid ab reprehenderit numquam? Dignissimos maxime provident molestiae veritatis rem eius ea labore expedita dolorem.
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis eos ipsum aut laudantium nihil aliquid, vel a odio eaque quisquam dignissimos quo. Beatae similique aspernatur ipsam, rerum expedita ducimus, dignissimos sapiente praesentium id velit sint, aliquid ab reprehenderit numquam? Dignissimos maxime provident molestiae veritatis rem eius ea labore expedita dolorem.
Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis eos ipsum aut laudantium nihil aliquid, vel a odio eaque quisquam dignissimos quo. Beatae similique aspernatur ipsam, rerum expedita ducimus, dignissimos sapiente praesentium id velit sint, aliquid ab reprehenderit numquam? Dignissimos maxime provident molestiae veritatis rem eius ea labore expedita dolorem.

.NOTES
Alias: lorem
#>

function Get-Lorem {
  [CmdletBinding(DefaultParameterSetName = "Count")]
  param(
    # Number of paragraphes
    [Parameter(ParameterSetName = "Count", Position = 0)]
    [ValidateRange(1, 100)]
    [int] $Count = 1
  ) 
    
  $lorem = "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quis eos ipsum aut laudantium nihil aliquid, vel a odio eaque quisquam dignissimos quo. Beatae similique aspernatur ipsam, rerum expedita ducimus, dignissimos sapiente praesentium id velit sint, aliquid ab reprehenderit numquam? Dignissimos maxime provident molestiae veritatis rem eius ea labore expedita dolorem." 
  $res = "" 
    
  for ($i = 0; $i -lt $Count; $i++) {
    $res += "`n$lorem" 
  }
    
  Write-Host $res`n 
  Set-Clipboard $res   
}

Export-ModuleMember -Function Get-Lorem -Alias "lorem"