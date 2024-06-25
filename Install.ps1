param(
  $Selection,
  $Branch
)

$URLScanIODir = $PSScriptRoot
if ($Selection -ne 's') {
    . $URLScanIODir\Modules\URLScan.io\Functions\Private\Misc.ps1

    $Platform = Detect-OS

    if ($Platform -eq "Windows") {
    $UserDocuments = "$ENV:USERPROFILE\Documents"
    $UserModuleDirectory = "$UserDocuments\WindowsPowerShell\Modules"
    $GlobalModuleDirectory = "C:\Windows\System32\WindowsPowerShell\v1.0\Modules"

    $elevated = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) 
    }

    if ($Platform -eq "Mac" -or $Platform -eq "Unix") {
    $UserDocuments = "$ENV:HOME/.local/share"
    $UserModuleDirectory = "$UserDocuments/powershell/Modules"
    $GlobalModuleDirectory = "/usr/local/microsoft/powershell/7/Modules"
    if ($(whoami) -eq "root") {
        $elevated = $true
    }
    }
}

## Context Menu
function Context-Menu {
    param (
        [string]$Title = 'URLScan.io Installation Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "i: Press 'i' to install URLScan.io as current user."
    Write-Host "g: Press 'g' to install globally (Must be run as Administrator/Sudo)."
    Write-Host "r: Press 'r' to uninstall URLScan.io from current user."
    Write-Host "u: Press 'a' to uninstall URLScan.io globally."
    Write-Host "Q: Press 'Q' to quit."
}

## Show Menu
do {
    if (!$Selection) {
      Context-Menu
      $selection = Read-Host "Please make a selection"
      $endwheninstalled = $false
    } else {
      $endwheninstalled = $true
    }
    switch ($selection)
    {
      'i' {
        Write-Host "Installing URLScan.io for current user.." -ForegroundColor Yellow

        if ($Platform -eq "Windows") {
          if (!(Test-Path "$UserDocuments\WindowsPowerShell")) {
              New-Item -ItemType Directory -Name "WindowsPowershell" -Path $UserDocuments
          }
          if (!(Test-Path $UserModuleDirectory)) {
              New-Item -ItemType Directory -Name "Modules" -Path "$UserDocuments\WindowsPowerShell"
          }
        }

        if ($Platform -eq "Mac" -or $Platform -eq "Unix") {
          if (!(Test-Path "$UserDocuments/powershell")) {
              New-Item -ItemType Directory -Name "powershell" -Path $UserDocuments
          }
          if (!(Test-Path $UserModuleDirectory)) {
              New-Item -ItemType Directory -Name "Modules" -Path "$UserDocuments\powershell"
          }
        }

        if (Test-Path "$UserModuleDirectory\URLScan.io") {
            Write-Host "Found existing version, removing.." -ForegroundColor Yellow
            Remove-Item "$UserModuleDirectory\URLScan.io" -Recurse -Force
        }
        Copy-Item "$URLScanIODir\Modules\URLScan.io" $UserModuleDirectory -Recurse -Force
        if ($env:PSModulePath -notlike "*$UserModuleDirectory*") {
            Write-Host "Adding $UserModuleDirectory to PSModulePath" -ForegroundColor Yellow
            $PSModuleDirectories = $env:PSModulePath += ";$UserModuleDirectory"
            [System.Environment]::SetEnvironmentVariable('PSModulePath',$PSModuleDirectories,[System.EnvironmentVariableTarget]::User)
        }
        Get-Module URLScan.io -ListAvailable | Import-Module -DisableNameChecking -Force
        if (Test-Path "$UserModuleDirectory\URLScan.io") {
            Write-Host "File installation succeeded." -ForegroundColor Green
            if (Get-URLScanConfiguration) {
                Write-Host "Module loaded successfully." -ForegroundColor Green
            } else {
                Write-Host "Module failed to load." -ForegroundColor Red
            }
        } else {
            Write-Host "File installation failed." -ForegroundColor Red
        }
      }
      'g' {
        if (!($elevated)) {
            Write-Host "You must run this script as an administrator/sudo to install URLScan.io globally." -ForegroundColor Red
            break      
        } else {
              Write-Host "Installing URLScan.io Globally.." -ForegroundColor Yellow
              if (!(Test-Path "$GlobalModuleDirectory")) {
                  Write-Host "Failed to locate global module directory: $GlobalModuleDirectory"
              }
        }
        if (Test-Path "$GlobalModuleDirectory\URLScan.io") {
            Write-Host "Found existing version, removing.." -ForegroundColor Yellow
            Remove-Item "$GlobalModuleDirectory\URLScan.io" -Recurse -Force
        }
        Copy-Item "$URLScanIODir\Modules\URLScan.io" $GlobalModuleDirectory -Recurse -Force
        Get-Module URLScan.io -ListAvailable | Import-Module -DisableNameChecking -Force
          if (Test-Path "$GlobalModuleDirectory\URLScan.io") {
              Write-Host "File installation succeeded." -ForegroundColor Green
              if (Get-URLScanConfiguration) {
                  Write-Host "Module loaded successfully." -ForegroundColor Green
              } else {
                  Write-Host "Module failed to load." -ForegroundColor Red
              }
          } else {
              Write-Host "File installation failed." -ForegroundColor Red
          }
      }
      'r' {
        Write-Host "Uninstalling URLScan.io from current user.." -ForegroundColor Yellow
        if (!(Test-Path "$UserModuleDirectory\URLScan.io" -ErrorAction SilentlyContinue)) {
            Write-Host "Failed to locate URLScan.io module directory: $UserModuleDirectory\URLScan.io"
        } else {
            Remove-Item "$UserModuleDirectory\URLScan.io" -Recurse -Force
            if (!(Test-Path "$UserModuleDirectory\URLScan.io")) {
                Write-Host "URLScan.io uninstall succeeded." -ForegroundColor Green
            } else {
                Write-Host "URLScan.io uninstall failed." -ForegroundColor Red
            }
        }
      } 
      'a' {
        if (!($elevated)) {
            Write-Host "You must run this script as an administrator to uninstall URLScan.io globally." -ForegroundColor Red
        } else {
            Write-Host "Uninstalling URLScan.io Globally.." -ForegroundColor Yellow
            if (!(Test-Path "$GlobalModuleDirectory\URLScan.io")) {
                Write-Host "Failed to locate URLScan.io module directory: $GlobalModuleDirectory\URLScan.io"
            } else {
                Remove-Item "$GlobalModuleDirectory\URLScan.io" -Recurse -Force
                if (!(Test-Path "$GlobalModuleDirectory\URLScan.io")) {
                    Write-Host "URLScan.io uninstall succeeded." -ForegroundColor Green
                } else {
                    Write-Host "URLScan.io uninstall failed." -ForegroundColor Red
                }
            }
        }
      }
      ## Install from Source
      's' {
        if (!($Branch)) {
            $Branch = "main"
        }
        if (Get-Command Get-URLScanConfiguration) {
            Write-Host "Found existing version, removing.." -ForegroundColor Yellow
            (Get-Module URLScan.io -ListAvailable).moduleBase | Remove-Item -Recurse -Force
        }
        Write-Host "Downloading URLScan.io $($Branch) branch from Github.." -ForegroundColor Cyan
        Invoke-WebRequest -Uri "https://github.com/TehMuffinMoo/URLScan.io/archive/refs/heads/$($Branch).zip" -OutFile URLScanIO.zip -Headers @{"Cache-Control"="no-cache"}
        if (Test-Path URLScanIO.zip) {
          Write-Host "Extracting URLScan.io to disk.." -ForegroundColor Cyan
          Expand-Archive URLScanIO.zip
        } else {
            Write-Error "Failed to download URLScan.io $($Branch) branch from Github"
            return $null
        }
        if (Test-Path URLScanIO) {
          Write-Host "Installing URLScan.io Module.." -ForegroundColor Cyan
          Set-Location URLScanIO/URLScan.io-$($Branch)
          .\Install.ps1 -Selection i
        } else {
            Write-Error "Failed to extract URLScan.io."
            return $null
        }
        Set-Location ../../
        Remove-Item URLScanIO,URLScanIO.zip -Recurse -Force
        $URLScanIOVersion = (Get-URLScanConfiguration).Version
        if ($URLScanIOVersion) {
          Write-Host "Successfully installed URLScan.io v$($URLScanIOVersion) - ($($Branch))." -ForegroundColor Green
        } else {
          Write-Error "Failed to install URLScan.io v$($URLScanIOVersion) - ($($Branch))."
        }
      }
    }
    if ($endwheninstalled -or $Selection -eq "q") {
      $selection = "q"
    } else {
      $Selection = $null
      pause
    }
 }
 until ($selection -eq 'q')