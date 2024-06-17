function Invoke-URLScan {
    <#
    .SYNOPSIS
        This function is a generic wrapper for URLScan.io

    .DESCRIPTION
        This function enables you to make queries to URLScan.io, includes parameters for using an API Key, result count and results paging. This will also take into account the rate limiting whilst making queries, ensuring you don't hit limits.

    .PARAMETER Query
        The Query to send to URLScan.io, such as 'domain:mydomain.com'.

    .PARAMETER Scan
        The URL to use when submitting a new scan request.

    .PARAMETER Watch
        Use the -Watch parameter to get a live feed of recent scans from URLScan.io

    .PARAMETER Visibility
        The visibility to use when submitting a new scan request (public/unlisted/private). Default is 'public'. Only used when -Scan is specified.

    .PARAMETER SourceCountry
        The source country to use when submitting a new scan request. Only used when -Scan is specified.

    .PARAMETER WaitForScan
        The -WaitForScan parameter will wait for the scan to complete, then return the results.
        If this parameter is not set, the scan submission will be sent and you will have the UUID returned.
        This UUID must be passed to -UUID to get the results, upon scan completion.

    .PARAMETER UUID
        The UUID for the results you want to retrieve.

    .PARAMETER Size
        The quantity of results you want to return. Only used when -Query is specified.

    .PARAMETER PageSize
        The number of results to return in a single request. This defaults to 100 for Free/Unregistered users. If you have a subscription, this can be increased in-line with your subscription allowance when specifying an API Key. Only used when -Query is specified.

    .PARAMETER APIKey
        The -APIKey parameter enables you to specify an API Key if you have an account with URLScan.io. This will enable higher query limits and larger page sizes.

    .PARAMETER RateLimitPause
        The -RateLimitPause parameter is used to define the minimum percentage that can be reached of the allowable rate limit before queries are paused. Only used when -Query is specified.

    .EXAMPLE
        PS> $Results = Invoke-URLScan -Query 'domain:google.com' -Size 300
            
        Query Size Exceeds Page Size 100. Enabling paging of results..
        (100/300): Querying URLScan.io..
        (200/300): Querying URLScan.io..
        (300/300): Querying URLScan.io..

        $Results.task | ft -AutoSize              

        visibility method    domain                                                           apexDomain                                         time                uuid                                 url
        ---------- ------    ------                                                           ----------                                         ----                ----                                 ---
        public     api       ym556.top                                                        ym556.top                                          16/06/2024 08:43:42 d1667410-dc7e-49a1-8d76-7f44860a99e1 http://ym556.top/
        public     api       mold-removal-en-blaster.today                                    mold-removal-en-blaster.today                      16/06/2024 08:43:40 67d2f955-bd05-4dc1-a1ea-93a0e7c5fc7a https://mold-removal-en-blaster.today/
        public     api       deberardfamilyfoundation.org                                     deberardfamilyfoundation.org                       16/06/2024 08:43:37 f7448a7f-39a1-49fd-a601-9a0016762561 http://deberardfamilyfoundation.org/
        public     api       mxcdonolxoeew.aloepsychology.com                                 aloepsychology.com                                 16/06/2024 08:43:36 3e737098-6824-47f3-8f36-d48943e23aab https://mxcdonolxoeew.aloepsychology.com/
        public     api       toiturepereetfilsrenovationcouverture.ovh                        toiturepereetfilsrenovationcouverture.ovh          16/06/2024 08:43:36 20947fb7-7e4c-4f28-9305-11b5b6314f0d http://toiturepereetfilsrenovationcouverture.ovh/
        public     api       republicaustin.us                                                republicaustin.us                                  16/06/2024 08:43:36 d87d1512-8f57-4ef2-914b-00a0ac51a154 https://republicaustin.us/
        public     api       satoi-electricalindustry.com                                     satoi-electricalindustry.com                       16/06/2024 08:43:35 42b8d37f-43d1-4dce-ac59-3bdecb0b0bf1 https://satoi-electricalindustry.com/
        public     api       esgsoftware729505.life                                           esgsoftware729505.life                             16/06/2024 08:43:35 d2943fa1-c166-40b2-8ac7-1dffa120b7cd https://esgsoftware729505.life/
        public     automatic yandex.lpfatture.hearingaid1.xyz                                 hearingaid1.xyz                                    16/06/2024 08:43:34 b5e74964-28d8-49f5-acc4-f9f2c905b990 https://yandex.lpfatture.hearingaid1.xyz/
        public     automatic servicedesk.adra.org.ua                                          adra.org.ua                                        16/06/2024 08:43:33 c42f91fa-bb40-4566-ba6a-625698a8edd4 https://servicedesk.adra.org.ua/
        public     api       ngis.co                                                          ngis.co                                            16/06/2024 08:43:32 03a6a935-c708-4fce-be4c-9086ae6cd808 http://ngis.co/
        public     api       steamcommunitiny.com                                             steamcommunitiny.com                               16/06/2024 08:43:32 422a6d64-5427-43ab-9faf-f0049d1b8f73 http://steamcommunitiny.com/
        public     automatic oahlw.uberfreight311.xyz                                         uberfreight311.xyz                                 16/06/2024 08:43:31 a39f6056-16ec-42f5-b529-ce67333b28cb https://oahlw.uberfreight311.xyz/
        public     automatic sslvpn.bodymindsoulusa.com                                       bodymindsoulusa.com                                16/06/2024 08:43:30 2e18233d-3753-4548-8445-2b068b9fcdbb https://sslvpn.bodymindsoulusa.com/
        public     automatic nalozhka.nalozhka.www.kwid9.24-hour-sewer-service2.xyz           24-hour-sewer-service2.xyz                         16/06/2024 08:43:29 43a55c3b-22a6-4e0a-bf36-d8902fbfa062 https://nalozhka.nalozhka.www.kwid9.24-hour-sewer-service2.…
        ...

    .EXAMPLE
        PS> Invoke-URLScan -Scan 'https://infoblox.com/threat-intel' -Visibility private -APIKey $URLScanAPIKey -WaitForScan
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
        [Parameter(ParameterSetName='Query')]
        [String]$Query,
        [Parameter(ParameterSetName='Scan')]
        [String]$Scan,
        [Parameter(ParameterSetName='Watch')]
        [Switch]$Watch,
        [Parameter(ParameterSetName='Scan')]
        [ValidateSet('public','private','unlisted')]
        [String]$Visibility = 'public',
        [Parameter(ParameterSetName='Scan')]
        [String]$SourceCountry,
        [Parameter(ParameterSetName='Scan')]
        [Switch]$WaitForScan,
        [Parameter(
            ParameterSetName='Result',
            ValueFromPipelineByPropertyName = $true
        )]
        [String]$UUID,
        [Parameter(ParameterSetName='Query')]
        [Int]$Size = 100,
        [Parameter(ParameterSetName='Query')]
        [Int]$PageSize = 100,
        [String]$APIKey,
        [Parameter(ParameterSetName='Query')]
        [Int]$RateLimitPause = 5
    )
    ## Initialize Header Object
    $Headers = @{
        "Content-Type" = "application/json"
    }

    ## Check if Default Page Size has been set
    if ($ENV:URLScanPageLimit) {
        $PageSize = $ENV:URLScanPageLimit
    }

    ## Check if API Key has been saved
    if ($ENV:URLScanAPIKey) {
        $APIKey = Get-URLScanAPIKey
    }

    ## Append API Key to Header Object if specified
    if ($APIKey) {
        $Headers.'API-Key' = $APIKey
    }

    if ($Query) {
        ## If Size > PageSize, enable paging of results
        if ($Size -gt $PageSize) {
            $QuerySize = $PageSize
            Write-Host "Query Size Exceeds Page Size $($PageSize). Enabling paging of results.."
        } else {
            $QuerySize = $Size
        }

        ## Initilize Result Count and Results Array
        $ResultCount = 0
        $Results = @()

        while ($ResultCount -lt $Size) {
            ## Check if Result Count + Page Size is Greater than requested results.
            ## If so, adjust the Query Size accordingly to ensure the correct number of results.
            if ($ResultCount+$PageSize -gt $Size) {
                $QuerySize = $Size-$ResultCount
            }
            ## Check if the requested size is greater than the query size.
            ## If so, adjust the visible count accordingly.
            if ($Size -gt $QuerySize) {
                $ResultCountVisible = $ResultCount+$QuerySize
            } else {
                $ResultCountVisible = $ResultCount+$Size
            }

            ## If $JSONResult is already populated from previous loop, append the search_after query parameter to enable paging. Rate Limiting is applied here too.
            if ($JSONResult) {
                $SearchAfter = "&search_after=$(($JSONResult.results | Select -Last 1).sort -join ",")"

                ## Apply Rate Limiting
                $ResultHeaders = $Result.Headers
                ## Calculate % of Limit based on $RateLimitPause (Defaults to 5%)
                $RateLimitPercentage = [Math]::Round((($([Int]$($ResultHeaders.'X-Rate-Limit-Limit'))/100)*$RateLimitPause),1)
                ## Check if Rate Limiting needs to be applied
                if ([Int]$($ResultHeaders.'X-Rate-Limit-Remaining') -lt $RateLimitPercentage) {
                    ## Build array of Rate Limiting Info
                    $RateLimitInfo = [PSCustomObject]@{
                        "Scope" = [String]$($Result.Headers.'X-Rate-Limit-Scope')
                        "Action" = [String]$($Result.Headers.'X-Rate-Limit-Action')
                        "Window" = [String]$($Result.Headers.'X-Rate-Limit-Window')
                        "Limit" = [Int]$($Result.Headers.'X-Rate-Limit-Limit')
                        "Remaining" = [Int]$($Result.Headers.'X-Rate-Limit-Remaining')
                        "Reset Time" = [DateTime]"$($Result.Headers.'X-Rate-Limit-Reset')"
                        "Reset Seconds" = [Int]$($Result.Headers.'X-Rate-Limit-Reset-After')
                    }
                    ## Set the timeout minutes/seconds to be displayed
                    $TimeoutMinutes = [Math]::Round($($RateLimitInfo.'Reset Seconds' / 60),2)
                    if ($TimeoutMinutes -lt 1) {
                        $TimeoutMessage = "$($RateLimitInfo.'Reset Seconds') seconds"
                    } else {
                        $TimeoutMessage = "$($TimeoutMinutes) minutes"
                    }
                    ## Write Rate Limiting info
                    Write-Host "API Rate Limit Almost Reached. Pausing queries for $($TimeoutMessage)." -ForegroundColor Red
                    Write-Host "Scope         : $($RateLimitInfo.Scope)"
                    Write-Host "Action        : $($RateLimitInfo.Action)"
                    Write-Host "Window        : $($RateLimitInfo.Window)"
                    Write-Host "Limit         : $($RateLimitInfo.Limit)"
                    Write-Host "Remaining     : $($RateLimitInfo.Remaining)"
                    Write-Host "Reset Time    : $($RateLimitInfo.'Reset Time')"
                    Write-Host "Reset Seconds : $($RateLimitInfo.'Reset Seconds')"
                    ## Set timeout based on seconds before rate limiting reset
                    Wait-Event -Timeout $($RateLimitInfo.'Reset Seconds')
                } elseif ([Int]$($ResultHeaders.'X-Rate-Limit-Remaining') -lt $($RateLimitPercentage * 3)) {
                    ## Slow down events if exceeds >3x of $RateLimitPercentage
                    if ($RateLimitApplied -ne $true) {
                        Write-Host "API Rate Limit close to being reached. Slowing down queries to every 3 seconds.." -ForegroundColor Yellow
                        $RateLimitApplied = $true
                    }
                    Wait-Event -Timeout 3
                } else {
                    ## Reset throttled rate limiting
                    if ($RateLimitApplied -eq $true) {
                        Write-Host "API Rate Limit is now OK. Returning to normal query speed.." -ForegroundColor Yellow
                        $RateLimitApplied = $false
                    }
                }
            }

            ## Write Visible Count
            Write-Host "($($ResultCountVisible)/$($Size)): Querying URLScan.io.."
            $Result = Invoke-WebRequest -Method GET -Uri "https://urlscan.io/api/v1/search/?q=$($Query)&size=$($QuerySize)$($SearchAfter)" -Headers $Headers

            $JSONResult = $Result.Content | ConvertFrom-Json

            if ($JSONResult.results.count -lt $PageSize) {
                Write-Host "Requested Page Size: $($PageSize) but only $($JSONResult.results.count) results returned. Adjusting page size to: $($JSONResult.results.count)" -ForegroundColor Yellow
                $PageSize = $JSONResult.results.count
                $ResultCountVisible = $PageSize
                $QuerySize = $PageSize
            }

            if ($JSONResult.results) {
                ## Append results to Array
                $Results += $JSONResult.results
                ## Increment Result Count for loop tracking
                $ResultCount += $JSONResult.results.count
            } else {
                break
            }
        }
    }
    if ($Scan) {
        $Splat = @{
            'url' = $Scan
            'visibility' = $Visibility
        }
        if ($SourceCountry) {
            $Splat.'country' = $SourceCountry
        }
        $JSONPayload = $Splat | ConvertTo-Json -Depth 2
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
    }
    if ($UUID) {
        $Results = Invoke-RestMethod -Method GET -Uri "https://urlscan.io/api/v1/result/$($UUID)/" -Headers $Headers -Body $JSONPayload
    }
    if ($Watch) {
        while ($true) {
            $Result = Invoke-RestMethod -Uri "https://urlscan.io/json/live/"
            $ReturnProperties = @{
                Property =  @{n="id";e={$_.'_id'}},
                            @{n="time";e={$_.task.time}},
                            @{n="ip";e={$_.page.ip}},
                            @{n="Url";e={$_.page.url}}
            }
    
            $Result.results | Where-Object {$_._id -notin $OldResult._id} | select @ReturnProperties
            $OldResult = $Result.results
            Start-Sleep 5
        }
    }
    return $Results
}

$URLScanCountries = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    $(Invoke-RestMethod -Method GET -Uri 'https://urlscan.io/api/v1/availableCountries/').countries | Where-Object {$_ -like "$($wordToComplete)*"}
}
Register-ArgumentCompleter -CommandName Invoke-URLScan -ParameterName SourceCountry -ScriptBlock $URLScanCountries