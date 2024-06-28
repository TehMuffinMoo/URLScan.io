function Detect-OS {
    if ($PSVersionTable.PSVersion.ToString() -gt 6) {
      if ($IsWindows) {
        return "Windows"
      } elseif ($IsMacOS) {
        return "Mac"
      }
    } else {
      $Platform = [System.Environment]::OSVersion.Platform
      if ($Platform -like "Win*") {
        return "Windows"
      } elseif ($Platform -like "Unix*") {
        return "Unix"
      }
    }
}

function Get-URLScanHeaders {
  param (
    [String]$APIKey
  )
  $Headers = @{
    "Content-Type" = "application/json"
  }
  if ($ENV:URLScanAPIKey) {
      $Headers.'API-Key' = Get-URLScanAPIKey
  }
  if ($APIKey) {
      $Headers.'API-Key' = $APIKey
  }
  return $Headers
}

function Apply-RateLimiting {
  param(
    [System.Object]$Headers,
    [String]$RateLimitPause = 5,
    [Switch]$Silent
  )
  ## Calculate % of Limit based on $RateLimitPause (Defaults to 5%)
  $RateLimitPercentage = [Math]::Round((($([Int]$($Headers.'X-Rate-Limit-Limit'))/100)*$RateLimitPause),1)
  ## Check if Rate Limiting needs to be applied
  if ([Int]$($Headers.'X-Rate-Limit-Remaining') -lt $RateLimitPercentage) {
      ## Build array of Rate Limiting Info
      $RateLimitInfo = [PSCustomObject]@{
          "Scope" = [String]$($Headers.'X-Rate-Limit-Scope')
          "Action" = [String]$($Headers.'X-Rate-Limit-Action')
          "Window" = [String]$($Headers.'X-Rate-Limit-Window')
          "Limit" = [Int]$($Headers.'X-Rate-Limit-Limit')
          "Remaining" = [Int]$($Headers.'X-Rate-Limit-Remaining')
          "Reset Time" = [DateTime]"$($Headers.'X-Rate-Limit-Reset')"
          "Reset Seconds" = [Int]$($Headers.'X-Rate-Limit-Reset-After')
      }
      ## Set the timeout minutes/seconds to be displayed
      $TimeoutMinutes = [Math]::Round($($RateLimitInfo.'Reset Seconds' / 60),2)
      if ($TimeoutMinutes -lt 1) {
          $TimeoutMessage = "$($RateLimitInfo.'Reset Seconds') seconds"
      } else {
          $TimeoutMessage = "$($TimeoutMinutes) minutes"
      }
      ## Write Rate Limiting info
      if (!($Silent)) {
          Write-Host ""
          Write-Host "API Rate Limit Almost Reached. Pausing queries for $($TimeoutMessage)." -ForegroundColor Red
          Write-Host "Scope         : $($RateLimitInfo.Scope)"
          Write-Host "Action        : $($RateLimitInfo.Action)"
          Write-Host "Window        : $($RateLimitInfo.Window)"
          Write-Host "Limit         : $($RateLimitInfo.Limit)"
          Write-Host "Remaining     : $($RateLimitInfo.Remaining)"
          Write-Host "Reset Time    : $($RateLimitInfo.'Reset Time')"
          Write-Host "Reset Seconds : $($RateLimitInfo.'Reset Seconds')"
      }
      ## Set timeout based on seconds before rate limiting reset
      Wait-Event -Timeout $($RateLimitInfo.'Reset Seconds')
  } elseif ([Int]$($Headers.'X-Rate-Limit-Remaining') -lt $($RateLimitPercentage * 3)) {
      ## Slow down events if exceeds >3x of $RateLimitPercentage
      if ($RateLimitApplied -ne $true) {
          if (!($Silent)) {
            Write-Host ""
            Write-Host "API Rate Limit close to being reached. Slowing down queries to every 3 seconds.." -ForegroundColor Yellow
          }
          $RateLimitApplied = $true
      }
      Wait-Event -Timeout 3
  } else {
      ## Reset throttled rate limiting
      if ($RateLimitApplied -eq $true) {
          if (!($Silent)) {
            Write-Host ""
            Write-Host "API Rate Limit is now OK. Returning to normal query speed.." -ForegroundColor Yellow
          }
          $RateLimitApplied = $false
      }
  }
}