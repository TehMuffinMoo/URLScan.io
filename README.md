# URLScan.io
A PowerShell Wrapper for URLScan.io

## Import Module
```powershell
Import-Module ./POSH-URLScanIO.psm1
```

## Invoke-URLScan

### SYNOPSIS
This function is a generic wrapper for URLScan.io

### SYNTAX

#### Query
```
Invoke-URLScan [-Query <String>] [-Size <Int32>] [-PageSize <Int32>] [-APIKey <String>]
 [-RateLimitPause <Int32>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

#### Scan
```
Invoke-URLScan [-Scan <String>] [-Visibility <String>] [-SourceCountry <String>] [-WaitForScan]
 [-APIKey <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

#### Result
```
Invoke-URLScan [-UUID <String>] [-APIKey <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

#### Watch
```
Invoke-URLScan [-Watch <Switch>] [-APIKey <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### DESCRIPTION
This function enables you to make queries to URLScan.io, includes parameters for using an API Key, result count and results paging. This will also take into account the rate limiting whilst making queries, ensuring you don't hit limits.

### EXAMPLES

#### EXAMPLE 1
```powershell
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
```

#### EXAMPLE 2
```powershell
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
```

#### EXAMPLE 3
```powershell
PS> Invoke-URLScan -UUID '30109de8-bfb7-4f04-a620-b50cf053dfc9' | Select-Object -ExpandProperty task   

apexDomain    : infoblox.com
domain        : infoblox.com
method        : api
source        : 4e882e8b
tags          : {}
time          : 6/14/2024 2:31:02 PM
url           : https://infoblox.com/threat-intel
uuid          : 30109de8-bfb7-4f04-a620-b50cf053dfc9
visibility    : private
reportURL     : https://urlscan.io/result/30109de8-bfb7-4f04-a620-b50cf053dfc9/
screenshotURL : https://urlscan.io/screenshots/30109de8-bfb7-4f04-a620-b50cf053dfc9.png
domURL        : https://urlscan.io/dom/30109de8-bfb7-4f04-a620-b50cf053dfc9/
```

#### EXAMPLE 4
```powershell
PS> $Scan | Invoke-URLScan | Select-Object -ExpandProperty lists

ips          : {54.194.13.237, 18.239.18.125, 13.35.58.58, 2.17.147.185…}
countries    : {IE, US, CZ, DE}
asns         : {16509, 20940, 29990, 8068…}
domains      : {www.infoblox.com, consent.trustarc.com, b.6sc.co, script.crazyegg.com…}
servers      : {nginx, nginx/1.14.0 (Ubuntu), cloudflare, Google Frontend…}
urls         : {https://www.infoblox.com/threat-intel/, https://infoblox.com/threat-intel, https://www.infoblox.com/threat-intel, https://use.typekit.net/mxi4rkr.css…}
linkDomains  : {insights.infoblox.com, krebsonsecurity.com, www.techrepublic.com, www.bleepingcomputer.com…}
certificates : {@{subjectName=www.infoblox.com; issuer=R3; validFrom=1715225241; validTo=1723001240}, @{subjectName=use.typekit.net; issuer=DigiCert Global G2 TLS RSA SHA256 2020 CA1; validFrom=1706745600; validTo=1741046399}, @{subjectName=*.google-analytics.com; issuer=WR2; validFrom=1716791731; 
               validTo=1724049330}, @{subjectName=6sc.co; issuer=R3; validFrom=1712663247; validTo=1720439246}…}
hashes       : {858cfa14ac16150c2a2fcabb44ec385e225b477d97753bca39ccd649e3375b3c, 7bd4c976b4ca609f1d0e72e7579c2e746d2de02c7a5423bc2cab822d1a2f006f, d198aa686d1152dea61220e984befd325376330286ffbeb9bba9d43347c2f065, 5a6e5dd9bbbf6164e8b03b0ccb52314403b7a31868583207386163fbcadb1743…}
```

### PARAMETERS

#### -Query
The Query to send to URLScan.io, such as 'domain:mydomain.com'

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

#### -Scan
The URL to use when submitting a new scan request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

#### -Watch
Use the -Watch parameter to get a live feed of recent scans from URLScan.io

```yaml
Type: Switch
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

#### -Visibility
The visibility to use when submitting a new scan request (public/unlisted/private). Default is 'public'. Only used when -Scan is specified.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

#### -SourceCountry
The source country to use when submitting a new scan request. Only used when -Scan is specified.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

#### -WaitForScan
The -WaitForScan parameter will wait for the scan to complete, then return the results.
If this parameter is not set, the scan submission will be sent and you will have the UUID returned.
This UUID must be passed to -UUID to get the results, upon scan completion.

```yaml
Type: Switch
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

#### -UUID
The UUID for the results you want to retrieve. Accepts pipeline input from -Scan submission.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: True
Accept wildcard characters: False
```

#### -Size
The quantity of results you want to return

```yaml
Type: Int
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

#### -PageSize
The number of results to return in a single request. This defaults to 100 for Free/Unregistered users. If you have a subscription, this can be increased in-line with your subscription allowance when specifying an API Key.

```yaml
Type: Int
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

#### -APIKey
The -APIKey parameter enables you to specify an API Key if you have an account with URLScan.io. This will enable higher query limits and larger page sizes.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

#### -RateLimitPause
The -RateLimitPause parameter is used to define the minimum percentage that can be reached of the allowable rate limit before queries are paused.

```yaml
Type: Int
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```
