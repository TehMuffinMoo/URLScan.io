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

    .EXAMPLE
        PS> New-URLScan -URL 'https://infoblox.com/threat-intel' -Visibility private -WaitForScan
        Waiting for scan results..
        Waiting for scan results..
        Waiting for scan results..

        data      : @{requests=System.Object[]; cookies=System.Object[]; console=System.Object[]; links=System.Object[]; timing=; globals=System.Object[]}
        lists     : @{ips=System.Object[]; countries=System.Object[]; asns=System.Object[]; domains=System.Object[]; servers=System.Object[]; urls=System.Object[]; linkDomains=System.Object[]; certificates=System.Object[]; hashes=System.Object[]}
        meta      : @{processors=}
        page      : @{asn=AS54113; asnname=FASTLY, US; city=Frankfurt am Main; country=DE; domain=www.infoblox.com; ip=146.75.122.253; server=nginx; url=https://www.infoblox.com/threat-intel/; apexDomain=infoblox.com; umbrellaRank=897192; tlsIssuer=R3; tlsValidFrom=5/9/2024 3:27:21 AM; tlsValidDays=89; 
                    tlsAgeDays=36; redirected=sub-domain; status=200; mimeType=text/html; title=Infoblox Threat Intel - Threat Intelligence for DNS}
        scanner   : @{country=gb}
        stats     : @{IPv6Percentage=0; adBlocked=0; domainStats=System.Object[]; ipStats=System.Object[]; malicious=0; protocolStats=System.Object[]; regDomainStats=System.Object[]; resourceStats=System.Object[]; securePercentage=97; secureRequests=142; serverStats=System.Object[]; tlsStats=System.Object[]; 
                    totalLinks=32; uniqCountries=5}
        submitter : @{country=GB}
        task      : @{apexDomain=infoblox.com; domain=infoblox.com; method=api; source=4e882e8b; tags=System.Object[]; time=6/14/2024 2:28:58 PM; url=https://infoblox.com/threat-intel; uuid=16e64fe3-684e-4a35-8d3b-dc2880b6e04b; visibility=private; 
                    reportURL=https://urlscan.io/result/16e64fe3-684e-4a35-8d3b-dc2880b6e04b/; screenshotURL=https://urlscan.io/screenshots/16e64fe3-684e-4a35-8d3b-dc2880b6e04b.png; domURL=https://urlscan.io/dom/16e64fe3-684e-4a35-8d3b-dc2880b6e04b/}
        verdicts  : @{overall=; urlscan=; engines=; community=}

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
    $Headers = Get-URLScanHeaders -APIKey $($APIKey)
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
    try {
        $ScanSubmission = Invoke-RestMethod -Method POST -Uri "https://urlscan.io/api/v1/scan/" -Headers $Headers -Body $JSONPayload
    } catch {
        Write-Error $_
        break
    }

    if ($WaitForScan) {
        $StartTime = Get-Date
        while (!($Results)) {
            $Diff = $(Get-Date)-$StartTime
            Write-Host -NoNewLine "`rWaiting for scan results.. ($($Diff.Seconds)s)"
            try {
                $Results = $ScanSubmission | Get-URLScan
            } catch {
                Wait-Event -Timeout 2
            }
        }
        Write-Host -NoNewLine "`r                                            "
    } else {
        $Results = $ScanSubmission
    }
    return $Results
}