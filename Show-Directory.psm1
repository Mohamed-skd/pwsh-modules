<#
.SYNOPSIS
Show current directory details

.EXAMPLE
direc -List
.EXAMPLE
direc -GetTextsContent

.NOTES
Alias: direc
#>

function Show-Directory {
  [CmdletBinding()]
  param (
    # Print children directories status (empty|full)
    [Parameter(ParameterSetName = "List", Position = 0)]
    [switch] $List,
    # Print children textfiles content
    [Parameter(ParameterSetName = "GetTextsContent", Position = 0)]
    [switch] $GetTextsContent
  ) 
    
  switch ($true) {
    $List { 
      $dirs = @(Get-ChildItem -Directory) 
      if ($dirs.Count -lt 1) {
        Write-Host "ℹ️ No directories" 
        exit 
      }
        
      $full = @{} 
      $empty = @() 
      foreach ($dir in $dirs) {
        Set-Location $dir 
        $size = @(Get-ChildItem).Count 
          
        if ($size -gt 0) {
          $full["+ $($dir.Name)"] = "$size $($size -eq 1 ? "File." : "Files.")" 
        }
        else {
          $empty += "- $($dir.Name)" 
        }
        Set-Location .. 
      }
        
      $total = $dirs.Count 
      $fCount = $full.Count 
      $eCount = $empty.Count 
      if ($fCount -lt 1) {
        Write-Host "ℹ️ The $total directories here are empty" 
        exit 
      }
        
      Write-Host $($fCount -eq 1 ? "ℹ️ 1 full directory" : "ℹ️ Full directories: $fCount/$total") 
      foreach ($dir in $full.Keys) {
        Write-Host $dir -ForegroundColor Green 
        Write-Host "$($full[$dir])" 
      }
      Write-Host `r 
        
      if ($eCount -gt 0) {
        Write-Host $($eCount -eq 1 ? "ℹ️ 1 empty directory" : "ℹ️ Empty directories: $eCount/$total") 
        foreach ($dir in $empty) {
          Write-Host $dir -ForegroundColor Red 
        }
        Write-Host "`n" 
      }
      break 
    }
    $GetTextsContent { 
      $files = @(Get-ChildItem -File) 
      Write-Host "`n" 
        
      foreach ($file in $files) {
        Write-Host "$($file.Name) :" -ForegroundColor Green 
        Get-Content $file 
        Write-Host "`n" 
      } 
      break 
    }
  }
}

Set-Alias "direc" Show-Directory
Export-ModuleMember -Function Show-Directory -Alias "direc"