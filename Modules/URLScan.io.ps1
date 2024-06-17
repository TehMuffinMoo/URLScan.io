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
$PublicFunctions = Get-ChildItem "$PSScriptRoot\Functions\Public\*.ps1"
$PrivateFunctions = Get-ChildItem "$PSScriptRoot\Functions\Private\*.ps1"

foreach($FunctionToImport in $($PublicFunctions + $PrivateFunctions)) {
  try {
    . $FunctionToImport.fullname
  } catch {
    Write-Error "Failed to import function $($FunctionToImport.fullname)"
  }
}

Export-ModuleMember -Function ($PublicFunctions | Select-Object -ExpandProperty BaseName) -Alias *