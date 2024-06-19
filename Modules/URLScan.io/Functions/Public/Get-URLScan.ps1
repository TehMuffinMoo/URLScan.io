function Get-URLScan {
    <#
    .SYNOPSIS
        This function enables you to retrieve submitted scans from URLScan.io

    .DESCRIPTION
        This function enables you to retrieve submitted scans from URLScan.io

    .PARAMETER UUID
        The UUID for the results you want to retrieve. This also accepts input as 'id' and '_id'

    .PARAMETER Return
        The type of data to return. (I.e. Links/Hashes/Technologies/etc.) By default the scan results are returned in their raw format.

    .PARAMETER ReturnType
        The return type for results to be returned in. (Object / JSON)

    .PARAMETER APIKey
        The -APIKey parameter enables you to specify an API Key if you have an account with URLScan.io. This will enable higher query limits and larger page sizes.
        This is only necessary if your API Key has not been saved using Set-URLScanConfiguration

    .EXAMPLE
        $Scan = New-URLScan -URL 'https://bbc.co.uk'
        $Scan | Get-URLScan -Return Certificates

        Subject                 Issuer                                               ValidFrom             ValidTo
        -------                 ------                                               ---------             -------
        www.bbc.com             GlobalSign RSA OV SSL CA 2018                        5/18/2078 5:20:51 AM  5/1/2079 12:32:58 AM
        www.bbc.co.uk           GlobalSign ECC OV SSL CA 2018                        4/12/2078 2:23:56 AM  5/14/2079 1:12:50 AM
        cdn.optimizely.com      DigiCert TLS RSA SHA256 2020 CA1                     2/16/2078 3:26:48 PM  2/21/2079 3:26:47 PM
        *.scorecardresearch.com Sectigo RSA Organization Validation Secure Server CA 5/28/2078 3:26:48 PM  5/29/2079 3:26:47 PM
        *.dotmetrics.net        Amazon RSA 2048 M02                                  2/7/2078 3:26:48 PM   3/9/2079 3:26:47 PM
        *.chartbeat.com         Thawte TLS RSA CA G1                                 10/31/2078 3:26:48 PM 11/23/2079 3:26:47 PM
        api-vip.bbci.co.uk      GlobalSign ECC OV SSL CA 2018                        10/27/2078 1:37:56 AM 11/28/2079 1:37:55 AM
        *.chartbeat.net         Thawte TLS RSA CA G1                                 5/7/2078 3:26:48 PM   6/8/2079 3:26:47 PM
        a1.api.bbc.co.uk        GlobalSign RSA OV SSL CA 2018                        5/19/2078 12:07:52 AM 6/20/2079 12:07:51 AM

    .EXAMPLE
        $Scan = New-URLScan -URL 'https://bbc.co.uk'
        $Scan | Get-URLScan -Return Links

        href                                                                               text
        ----                                                                               ----
        https://www.bbc.co.uk/usingthebbc/cookies/what-do-i-need-to-know-about-cookies/    cookies
        https://www.bbc.co.uk/usingthebbc/cookies/how-can-i-change-my-bbc-cookie-settings/ No, take me to settings
        https://www.bbc.co.uk/                                                             BBC Homepage
        https://www.bbc.co.uk/accessibility/                                               Accessibility Help
        https://session.bbc.com/session?lang=en-GB&ptrt=https://www.bbc.com/               Sign in
        https://www.bbc.co.uk/notifications                                                Notifications
        https://www.bbc.co.uk/news                                                         News
        https://www.bbc.co.uk/sport                                                        Sport

    .EXAMPLE
        $Scan = New-URLScan -URL 'https://bbc.co.uk'
        $Scan | Get-URLScan -Return Cookies | ft

        Name                                Domain          Path Size HTTPOnly Secure Session Expires
        ----                                ------          ---- ---- -------- ------ ------- -------
        ckns_mvt                            .bbc.co.uk      /      44    False   True   False 12/5/2079 8:54:59 AM
        ckns_mvt                            .bbc.com        /      44    False   True   False 12/5/2079 8:55:02 AM
        DotMetrics.DeviceKey                .dotmetrics.net /      29    False   True   False 12/5/2079 8:55:05 AM
        DotMetrics.UniqueUserIdentityCookie .dotmetrics.net /     165    False   True   False 12/5/2079 8:55:05 AM
        atuserid                            .bbc.com        /     194    False   True   False 1/6/2080 8:55:04 AM
        _cb                                 .bbc.com        /      21    False   True   False 1/4/2080 8:55:04 AM
        _chartbeat2                         .bbc.com        /      74    False   True   False 1/4/2080 8:55:04 AM
        _cb_svref                           .bbc.com        /      39    False   True   False 12/5/2078 9:25:05 AM
        DM_SitId1778                        www.bbc.com     /      13    False   True    True 6/18/2024 4:57:49 PM
        DM_SitId1778SecId13934              www.bbc.com     /      23    False   True    True 6/18/2024 4:57:49 PM

    .FUNCTIONALITY
        URLScan.io
    #>
    param(
        [Parameter(
            Mandatory=$true,
            ParameterSetName='Result',
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidatePattern('^\w{8}\-\w{4}\-\w{4}\-\w{4}\-\w{12}$')]
        [Alias('id','_id')]
        $UUID,
        [ValidateSet('Links','Hashes','IPs','URLs','Cookies','Certificates','Verdicts','Technologies')]
        [String]$Return,
        [ValidateSet('Object','JSON')]
        [String]$ReturnType = 'Object'
    )
    begin {
        $Headers = Get-URLScanHeaders -APIKey $($APIKey)
    }

    process {
        $Results = Invoke-RestMethod -Method GET -Uri "https://urlscan.io/api/v1/result/$($UUID)/" -Headers $Headers
        if ($Results) {
            $Date = Get-Date
            Switch($Return) {
                'Links' {
                    $ResultArr = $Results.data.links | Select-Object href,text
                    break
                }
                'Hashes' {
                    $ReturnProperties = @{
                        Property =  @{n="Type";e={$_.type}},
                                    @{n="Size";e={$_.size}},
                                    @{n="Hash";e={$_.hash}},
                                    @{n="Url";e={$_.response.url}}
                    }
                    $ResultArr = $Results.data.requests.response | Select-Object @ReturnProperties
                    break
                }
                'IPs' {
                    $ResultArr = $Results.lists.ips
                }
                'URLs' {
                    $ReturnProperties = @{
                        Property =  @{n="URL";e={$_.url}},
                                    @{n="Status";e={$_.status}},
                                    @{n="MimeType";e={$_.mimeType}},
                                    @{n="Charset";e={$_.charset}},
                                    @{n="Remote IP";e={$_.remoteIPAddress}},
                                    @{n="Remote Port";e={$_.remotePort}}
                    }
                    $ResultArr = $Results.data.requests.response.response | Select-Object @ReturnProperties
                    break
                }
                'Cookies' {
                    $ReturnProperties = @{
                        Property =  @{n="Name";e={$_.name}},
                                    @{n="Domain";e={$_.domain}},
                                    @{n="Path";e={$_.path}},
                                    @{n="Size";e={$_.size}},
                                    @{n="HTTPOnly";e={$_.httpOnly}},
                                    @{n="Secure";e={$_.secure}},
                                    @{n="Session";e={$_.session}},
                                    @{n="Expires";e={($Date).AddSeconds($_.expires)}}
                    }
                    $ResultArr = $Results.data.cookies | Select-Object @ReturnProperties
                    break
                }
                'Certificates' {
                    $ReturnProperties = @{
                        Property =  @{n="Subject";e={$_.subjectName}},
                                    @{n="Issuer";e={$_.issuer}},
                                    @{n="ValidFrom";e={($Date).AddSeconds($_.validFrom)}},
                                    @{n="ValidTo";e={($Date).AddSeconds($_.validTo)}}
                    }
                    $ResultArr = $Results.lists.certificates | Select-Object @ReturnProperties
                    break
                }
                'Verdicts' {
                    $ReturnProperties = @{
                        Property =  @{n="UUID";e={$_.task.uuid}},
                                    @{n="Time";e={$_.task.time}},
                                    @{n="URL";e={$_.task.url}},
                                    @{n="OverallMalicious";e={$_.verdicts.overall.malicious}},
                                    @{n="OverallScore";e={$_.verdicts.overall.score}},
                                    @{n="OverallBrands";e={$($_.verdicts.overall.brands) -join ','}},
                                    @{n="OverallTags";e={$($_.verdicts.overall.tags + $_.verdicts.overall.categories) -join ','}},
                                    @{n="EnginesMalicious";e={$_.verdicts.engines.malicious}},
                                    @{n="EnginesScore";e={$_.verdicts.engines.score}},
                                    @{n="EnginesBrands";e={$($_.verdicts.engines.brands) -join ','}},
                                    @{n="EnginesTags";e={$($_.verdicts.engines.tags + $_.verdicts.engines.categories) -join ','}},
                                    @{n="URLScanMalicious";e={$_.verdicts.urlscan.malicious}},
                                    @{n="URLScanScore";e={$_.verdicts.urlscan.score}},
                                    @{n="URLScanBrands";e={$($_.verdicts.urlscan.brands) -join ','}},
                                    @{n="URLScanTags";e={$($_.verdicts.urlscan.tags + $_.verdicts.urlscan.categories) -join ','}},
                                    @{n="CommunityMalicious";e={$_.verdicts.community.malicious}},
                                    @{n="CommunityScore";e={$_.verdicts.community.score}},
                                    @{n="CommunityBrands";e={$($_.verdicts.community.brands) -join ','}},
                                    @{n="CommunityTags";e={$($_.verdicts.community.tags + $_.verdicts.community.categories) -join ','}}
                    }
                    $ResultArr = $Results | Select-Object @ReturnProperties
                    break
                }
                "Technologies" {
                    $ReturnProperties = @{
                        Property =  @{n="App";e={$_.app}},
                                    @{n="Website";e={$_.website}},
                                    @{n="Categories";e={$_.categories.name -join ','}},
                                    @{n="Confidence";e={$_.confidenceTotal}}
                    }
                    $ResultArr = $Results.meta.processors.wappa.data | Select-Object @ReturnProperties
                    break
                }
                default {
                    $ResultArr = $Results
                }
            }
            Switch($ReturnType) {
                'Object' {
                    return $ResultArr
                }
                'JSON' {
                    return $($ResultArr | ConvertTo-Json -Depth 10)
                }
            }
        }
    }
}