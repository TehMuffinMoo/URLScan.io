function Set-URLScanConfiguration {
    <#
    .SYNOPSIS
        Used to set URLScan.io specific configuration

    .DESCRIPTION
        This function is used to set URLScan.io specific configuration, such as the BloxOne CSP API Key, Region/URL and enabling/disabling development or debug mode

    .PARAMETER APIKey
        Use this parameter to save the API Key for URLScan.io. If an API Key is not saved, you will be bound by the rate limits of a free user.

    .PARAMETER DefaultPageLimit
        Optionally set the default page size to be returned when performing queries to URLScan.io. This is set to 100 by default, which aligns with the Free Tier. If you have an account or subscription with URLScan.io, you can specify this value in line with your account limits.

    .PARAMETER ScreenshotPath
        Optionally configure a default screenshot path for when using Get-URLScanScreenshot & Get-URLScanLiveshot functions.

    .PARAMETER Persist
        Setting the -Persist parameter will save the configuration permanently for your user on this device. Without using this switch, the settings will only be saved for the duration of the PowerShell session.

    .EXAMPLE
        PS> Set-URLScanConfiguration -APIKey '<APIKey>' -Persist
                                                                                                                  
        URLScan.io key has been stored permanently for user on MAC-DSD984HG

    .EXAMPLE
        PS> Set-ibPSConfiguration -DefaultPageLimit 1000
                                                                                                                  
    .FUNCTIONALITY
        URLScan.io
    #>
  param (
    [String]$APIKey,
    [String]$DefaultPageLimit,
    [String]$ScreenshotPath,
    [Switch]$Persist
  )

  if ($APIKey) {
    $URLScanAPIKey = $APIKey | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString
    $Bytes = [System.Text.Encoding]::Unicode.GetBytes($URLScanAPIKey)
    $Base64 = [Convert]::ToBase64String($Bytes)
    if ($Persist) {
      $Platform = Detect-OS
      if ($Platform -eq "Windows") {
        [System.Environment]::SetEnvironmentVariable('URLScanAPIKey',$Base64,[System.EnvironmentVariableTarget]::User)
        $ENV:URLScanAPIKey = $Base64
        Write-Host "URLScan.io API key has been stored permanently for $env:USERNAME on $env:COMPUTERNAME." -ForegroundColor Green
      } elseif ($Platform -eq "Mac" -or $Platform -eq "Unix") {
        $ENV:URLScanAPIKey = $Base64
        if (!(Test-Path ~/.zshenv)) {
          touch ~/.zshenv
        }
        sed -i '' -e '/URLScanAPIKey/d' ~/.zshenv
        echo "export URLScanAPIKey=$Base64" >> ~/.zshenv
        Write-Host "URLScan.io API key has been stored permanently for $env:USER on $(scutil --get LocalHostName)." -ForegroundColor Green
      }
    } else {
        $ENV:URLScanAPIKey = $Base64
        Write-Host "URLScan.io API key has been stored for this session." -ForegroundColor Green
        Write-Host "You can make the API key persistent for this user on this machine by using the -persist parameter." -ForegroundColor Gray
    }
  }

  if ($DefaultPageLimit) {
    if ($Persist) {
      $Platform = Detect-OS
      if ($Platform -eq "Windows") {
        [System.Environment]::SetEnvironmentVariable('URLScanPageLimit',$DefaultPageLimit,[System.EnvironmentVariableTarget]::User)
        $ENV:URLScanPageLimit = $DefaultPageLimit
        Write-Host "URLScan.io default page limit has been set to: $($DefaultPageLimit) permanently for $($env:USERNAME) on $($env:COMPUTERNAME)." -ForegroundColor Green
      } elseif ($Platform -eq "Mac" -or $Platform -eq "Unix") {
        $ENV:URLScanPageLimit = $DefaultPageLimit
        if (!(Test-Path ~/.zshenv)) {
          touch ~/.zshenv
        }
        sed -i '' -e '/URLScanPageLimit/d' ~/.zshenv
        echo "export URLScanPageLimit=$DefaultPageLimit" >> ~/.zshenv
        Write-Host "URLScan.io default page limit has been set to: $($DefaultPageLimit) permanently for $env:USER on $(scutil --get LocalHostName)." -ForegroundColor Green
      }
    } else {
        $ENV:URLScanPageLimit = $DefaultPageLimit
        Write-Host "URLScan.io default page limit has been set to: $($DefaultPageLimit) for this session." -ForegroundColor Green
        Write-Host "You can make the change persistent for this user on this machine by using the -persist parameter." -ForegroundColor Gray
    }
  }

  if ($ScreenshotPath) {
    if (Test-Path $ScreenshotPath) {
      $ScreenshotPathResolved = (Get-Item $ScreenshotPath).ResolvedTarget
      if ($Persist) {
        $Platform = Detect-OS
        if ($Platform -eq "Windows") {
          [System.Environment]::SetEnvironmentVariable('URLScanScreenshotPath',$ScreenshotPathResolved,[System.EnvironmentVariableTarget]::User)
          $ENV:URLScanScreenshotPath = $ScreenshotPathResolved
          Write-Host "URLScan.io default screenshot path has been set to: $($ScreenshotPathResolved) permanently for $($env:USERNAME) on $($env:COMPUTERNAME)." -ForegroundColor Green
        } elseif ($Platform -eq "Mac" -or $Platform -eq "Unix") {
          $ENV:URLScanScreenshotPath = $ScreenshotPathResolved
          if (!(Test-Path ~/.zshenv)) {
            touch ~/.zshenv
          }
          sed -i '' -e '/URLScanScreenshotPath/d' ~/.zshenv
          echo "export URLScanScreenshotPath=$ScreenshotPathResolved" >> ~/.zshenv
          Write-Host "URLScan.io default screenshot path has been set to: $($ScreenshotPathResolved) permanently for $env:USER on $(scutil --get LocalHostName)." -ForegroundColor Green
        }
      } else {
          $ENV:URLScanScreenshotPath = $ScreenshotPathResolved
          Write-Host "URLScan.io default screenshot path has been set to: $($ScreenshotPathResolved) for this session." -ForegroundColor Green
          Write-Host "You can make the change persistent for this user on this machine by using the -persist parameter." -ForegroundColor Gray
      }
    } else {
      Write-Error "Unable to find path: $($ScreenshotPathResolved)"
    }
  }
}