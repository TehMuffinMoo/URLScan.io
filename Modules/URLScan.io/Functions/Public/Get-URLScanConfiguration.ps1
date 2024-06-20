function Get-URLScanConfiguration {
    <#
    .SYNOPSIS
        Used to get the current configuration for the URLScan.io Module

    .DESCRIPTION
        This function is used to get the current configuration for the URLScan.io Module

    .PARAMETER IncludeAPIKey
        The -IncludeAPIKey indicates whether the API Key should be returned in the response

    .EXAMPLE
        PS> Get-URLScanConfiguration | fl

        API Key         : ********
        Page Size       : 1000
        Version         : 1.0.0.4
        Screenshot Path : /User/Me/URLScan.io-Images

    .FUNCTIONALITY
        ibPS
    #>
  param (
    [Switch]$IncludeAPIKey
  )

  $URLScanModule = Get-Module -ListAvailable -Name URLScan.io | Sort-Object Version | Select-Object -Last 1
  if (!($URLScanModule)) {
    if (Test-Path "./Modules/URLScan.io/URLScan.io.psd1") {
      $URLScanModule = Test-ModuleManifest "./Modules/URLScan.io/URLScan.io.psd1"
    }
  }

  $CurrentConfig = [PSCustomObject]@{
    "API Key" = $(if ($ENV:URLScanAPIKey) { if ($IncludeAPIKey) {Get-URLScanAPIKey} else { "********" }} else {'Not Set'})
    "Page Size" = $(if ($ENV:URLScanPageLimit) { $ENV:URLScanPageLimit } else { 100 })
    "Version" = $(if ($URLScanModule) { $URLScanModule.Version.ToString() })
    "Screenshot Path" = $(if ($ENV:URLScanScreenshotPath) { $ENV:URLScanScreenshotPath } else {'Not Set'})
  }
  return $CurrentConfig
}