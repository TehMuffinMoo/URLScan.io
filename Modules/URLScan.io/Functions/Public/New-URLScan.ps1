function New-URLScan {
        <#
    .SYNOPSIS
        This function enables you to submit a new scan to URLScan.io

    .DESCRIPTION
        This function enables you to submit a new scan to URLScan.io

    .PARAMETER URL
        The URL to submit to URLScan.io for scanning

    .PARAMETER Visibility
        The visibility to use when submitting a new scan request (public/unlisted/private). Default is 'public'.

    .PARAMETER SourceCountry
        The source country to use when submitting a new scan request.

    .PARAMETER Referer
        The HTTP Referer to use when submitting a new scan request.

    .PARAMETER CustomAgent
        The HTTP User-Agent to use when submitting a new scan request.

    .PARAMETER Tags
        A list of tags to use when submitting a new scan request.

    .PARAMETER OverrideSafety
        If the -OverrideSafety parameter is used, this will disable reclassification of URLs with potential PII in them. Use with care!

    .PARAMETER WaitForScan
        The -WaitForScan parameter will wait for the scan to complete, then return the results.

    .PARAMETER APIKey
        The -APIKey parameter enables you to specify an API Key if you have an account with URLScan.io. This will enable higher query limits and larger page sizes.
        This is only necessary if your API Key has not been saved using Set-URLScanConfiguration

    .EXAMPLE
        PS> New-URLScan -URL 'https://google.com/test' `
                        -Visibility public `
                        -SourceCountry gb `
                        -Referer 'https://google.com/test2' `
                        -CustomAgent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' `
                        -Tags @('test','test2')

        message    : Submission successful
        uuid       : 4f916fa4-10d9-495c-851d-c8496c7ef534
        result     : https://urlscan.io/result/4f916fa4-10d9-495c-851d-c8496c7ef534/
        api        : https://urlscan.io/api/v1/result/4f916fa4-10d9-495c-851d-c8496c7ef534/
        visibility : public
        options    : @{useragent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) 
                    Chrome/83.0.4103.61 Safari/537.36; headers=}
        url        : https://google.com/test
        country    : gb

    .FUNCTIONALITY
        URLScan.io
    #>
    param(
        [Parameter(Mandatory=$true)]
        [String]$URL,
        [ValidateSet('public','private','unlisted')]
        [String]$Visibility = 'public',
        [String]$SourceCountry,
        [String]$Referer,
        [String]$CustomAgent,
        [Object[]]$Tags,
        [Switch]$OverrideSafety,
        [Switch]$WaitForScan,
        [String]$APIKey
    )
    $Headers = @{
        "Content-Type" = "application/json"
    }
    ## Check if API Key has been saved
    if ($ENV:URLScanAPIKey) {
        $Headers.'API-Key' = Get-URLScanAPIKey
    }
    ## Append API Key to Header Object if specified
    if ($APIKey) {
        $Headers.'API-Key' = $APIKey
    }
    $Splat = @{
        'url' = $URL
        'visibility' = $Visibility
    }
    if ($SourceCountry) {
        $Splat.'country' = $SourceCountry
    }
    if ($Referer) {
        $Splat.'referer' = $Referer
    }
    if ($CustomAgent) {
        $Splat.'customagent' = $CustomAgent
    }
    if ($Tags) {
        $Splat.'tags' = $($Tags)
    }
    if ($OverrideSafety) {
        $Splat.'overrideSafety' = $true
    }
    $JSONPayload = $Splat | ConvertTo-Json -Depth 2 -Compress
    $Results = Invoke-RestMethod -Method POST -Uri "https://urlscan.io/api/v1/scan/" -Headers $Headers -Body $JSONPayload

    if ($WaitForScan) {
        while (!($ScanResults)) {
            Write-Host "Waiting for scan results.."
            try {
                $Results = Invoke-URLScan -UUID $($Results.uuid)
                $ScanResults = $true
            } catch {
                $ScanResults = $false
                Wait-Event -Timeout 3
            }
        }
    }
    return $Results
}