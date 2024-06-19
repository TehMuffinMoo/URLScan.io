function Get-URLScanQuota {
        <#
    .SYNOPSIS
        This function returns your rate limiting quota.

    .DESCRIPTION
        This function returns your rate limiting quota.

    .PARAMETER Summary
        Return a summary of quota usage

    .PARAMETER APIKey
        The -APIKey parameter enables you to specify an API Key if you have an account with URLScan.io. This will enable higher query limits and larger page sizes.
        This is only necessary if your API Key has not been saved using Set-URLScanConfiguration

    .EXAMPLE
        PS> Get-URLScanQuota

        private                : @{day=; hour=; minute=}
        public                 : @{day=; hour=; minute=}
        retrieve               : @{day=; hour=; minute=}
        search                 : @{day=; hour=; minute=}
        unlisted               : @{day=; hour=; minute=}
        livescan               : @{day=; hour=; minute=}
        liveshot               : @{day=1000; hour=100; minute=10}
        maxRetentionPeriodDays : 7
        maxSearchRangeMonths   : 3
        maxSearchResults       : 1000
        products               : {}
        features               : {}
        queryableFields        : {asn, asnname.*, country, date…}
        queryVisibility        : {public}

    .FUNCTIONALITY
        URLScan.io
    #>
    param(
        [Switch]$Summary,
        [String]$APIKey
    )
    $Headers = Get-URLScanHeaders -APIKey $($APIKey)
    $Results = Invoke-RestMethod -Method GET -Uri "https://urlscan.io/user/quotas/" -Headers $Headers | Select-Object -ExpandProperty limits

    if ($Results) {
        if ($Summary) {
            $SummaryResults = @()
            @('private','public','retrieve','search','unlisted','livescan') | %{
                $SummaryData = [PSCustomObject]@{
                    'Scope' = $_
                    'Minute' = "($($Results."$($_)".minute.used)/$($Results."$($_)".minute.limit)) $($Results."$($_)".minute.percent)%"
                    'Hour' = "($($Results."$($_)".hour.used)/$($Results."$($_)".hour.limit)) $($Results."$($_)".hour.percent)%"
                    'Day' = "($($Results."$($_)".day.used)/$($Results."$($_)".day.limit)) $($Results."$($_)".day.percent)%"
                }
                $SummaryResults += $SummaryData
            }
            return $SummaryResults | Select Scope,Day,Hour,Minute
        } else {
            return $Results
        }
    }
}