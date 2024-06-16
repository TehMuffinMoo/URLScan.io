<#
.SYNOPSIS
   Generic Wrapper for URLScan.io
.DESCRIPTION
   This is a generic wrapper for interacting with URLScan.io
.NOTES
   https://github.com/TehMuffinMoo/URLScan.io
.AUTHOR
   Mat Cox
#>

## Import Functions
$FunctionsToImport = Get-ChildItem "$PSScriptRoot\*.ps1"

foreach($FunctionToImport in $FunctionsToImport) {
  try {
    . $FunctionToImport.fullname
  } catch {
    Write-Error "Failed to import function $($FunctionToImport.fullname)"
  }
}

Export-ModuleMember -Function ($FunctionToImport | Select-Object -ExpandProperty BaseName) -Alias *