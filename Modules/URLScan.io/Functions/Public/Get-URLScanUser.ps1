function Get-URLScanUser {
        <#
    .SYNOPSIS
        This function returns details about the current user

    .DESCRIPTION
        This function returns details about the user associated with the current API Key

    .PARAMETER Summary
        Return the submission statistics for the current user

    .PARAMETER APIKey
        The -APIKey parameter enables you to specify an API Key if you have an account with URLScan.io. This will enable higher query limits and larger page sizes.
        This is only necessary if your API Key has not been saved using Set-URLScanConfiguration

    .EXAMPLE
        PS> 

    .FUNCTIONALITY
        URLScan.io
    #>
    param(
        [Switch]$Submissions,
        [String]$APIKey
    )
    $Headers = Get-URLScanHeaders -APIKey $($APIKey)
    try {
        $Results = Invoke-RestMethod -Method GET -Uri "https://urlscan.io/user/username/" -Headers $Headers
    } catch {
        Write-Error $_
        break
    }

    if ($Results) {
        if ($Submissions) {
            $ReturnProperties = @{
                Property =  @{n="Total";e={$_.total}},
                            @{n="Public";e={$_.public}},
                            @{n="Private";e={$_.private}},
                            @{n="Unlisted";e={$_.unlisted}},
                            @{n="API";e={$_.stats.api}},
                            @{n="Manual";e={$_.manual}},
                            @{n="Last Submission";e={[DateTime]"$($_.lastSubmission)"}}
            }
            $Results.submissions | Select @ReturnProperties
        } else {
            return $Results
        }
    }
}