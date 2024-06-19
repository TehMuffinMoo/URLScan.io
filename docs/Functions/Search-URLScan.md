---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Search-URLScan

## SYNOPSIS
This function is used to perform a search query against URLScan.io

## SYNTAX

### Query
```
Search-URLScan -Query <String> [-Limit <Int32>] [-PageSize <Int32>] [-Strict] [-ReturnAll] [-Silent]
 [-APIKey <String>] [-RateLimitPause <Int32>] [<CommonParameters>]
```

### Filters
```
Search-URLScan [-Domain <String>] [-IP <String>] [-Country <String>] [-Server <String>] [-Hash <String>]
 [-Filename <String>] [-ASN <String>] [-ASNName <String>] [-Limit <Int32>] [-PageSize <Int32>] [-Strict]
 [-ReturnAll] [-Silent] [-APIKey <String>] [-RateLimitPause <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function is used to perform a search query against URLScan.io.

## EXAMPLES

### EXAMPLE 1
```powershell
Search-URLScan -Query 'task.url:google.com AND country:gb AND page.server:nginx' | Select-Object -ExpandProperty task | ft -AutoSize

(94/94): URLScan.io Results Returned.

visibility method    domain                                                 apexDomain                  time                   uuid                                 url
---------- ------    ------                                                 ----------                  ----                   ----                                 ---
public     manual    google.com                                             google.com                  5/16/2024 5:33:33 AM   42e9e5ec-e10e-441d-be9a-99865a2ae0ad https://google.com/amp/s/lido.community
public     api       www.hvacrecruitment.com                                hvacrecruitment.com         4/15/2024 1:07:20 PM   4159106e-f034-47b0-8a66-5c0145cceb04 https://www.hvacrecruitment.com/helpdesk-recruitment-agency?source=google.com
public     api       www1-google.com                                        www1-google.com             4/15/2024 6:59:00 AM   d307c542-1445-4dee-a7e2-1045fcd72d3b http://www1-google.com/
public     manual    google.com                                             google.com                  3/31/2024 7:32:44 PM   72b7e643-7134-4563-a2a5-eb2621156117 https://google.com/amp/s/coinmarketcap.network
public     manual    google.com                                             google.com                  3/28/2024 6:47:27 AM   4433dc67-2b4c-4b47-927d-6b36d2fe7534 https://google.com/amp/s/lido.fi.accelerator-program.support
public     manual    google.com                                             google.com                  3/27/2024 6:17:43 AM   d14d8e14-7ef8-442f-81c6-3e2ce5ce21e1 https://google.com/amp/s/lido.fi.accelerator-program.support
public     manual    google.com                                             google.com                  3/23/2024 7:52:49 AM   7820fbc1-6c44-409b-a099-3d2d58d059f1 https://google.com/amp/s/t2m.io/abjriGb?Claim-500USDT-Voucher
public     manual    google.com                                             google.com                  3/22/2024 8:16:39 PM   31b9a33b-b0cd-4cd5-83e5-1804ac1f8a95 https://google.com/amp/s/mailserver.promo?Claim-Voucher
public     manual    google.com                                             google.com                  3/11/2024 11:35:33 AM  482b916d-57e8-4e3c-9748-c1d9d95f9880 https://google.com/amp/s/mailing-database.com
public     manual    google.com                                             google.com                  2/28/2024 12:47:37 AM  f03c344b-d2cc-4f38-93df-50b3a74e9465 https://google.com/amp/s/insights-ripple.com
public     manual    google.com                                             google.com                  2/27/2024 9:15:42 PM   3299b0b9-e1e9-4f0a-b99e-f2d1833fc4dd https://google.com/amp/s/insights-ripple.com
...
```

### EXAMPLE 2
```powershell
$Results = Search-URLScan -Domain 'google.com' -Limit 300

Query Size Exceeds Page Size 100. Enabling paging of results..
(300/300): URLScan.io Results Returned..

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

### EXAMPLE 3
```powershell
## Return All Results for selected query
PS> $Results = Search-URLScan -Domain 'bbc.co.uk' -Strict -ReturnAll -PageSize 1000

(9027/9027): All URLScan.io Results Returned.
```

## PARAMETERS

### -Query
The ElasticSearch Query to send to URLScan.io, such as 'domain:mydomain.com'.
A full list of available search parameters can be found here: https://urlscan.io/docs/search/

```yaml
Type: String
Parameter Sets: Query
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain
Filter the results by domain.
This filters by 'domain' by default, or 'page.domain' when -Strict is specified.

```yaml
Type: String
Parameter Sets: Filters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IP
Filter the results by IP.
This filters by 'ip' by default, or 'page.ip' when -Strict is specified.

```yaml
Type: String
Parameter Sets: Filters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Country
Filter the results by Country.
This filters by 'country' by default, or 'page.country' when -Strict is specified.

```yaml
Type: String
Parameter Sets: Filters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
Filter the results by the HTTP 'Server' header.
This filters by 'server' by default, or 'page.server' when -Strict is specified.

```yaml
Type: String
Parameter Sets: Filters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Hash
Filter the results by the SHA256 hash of any HTTP response

```yaml
Type: String
Parameter Sets: Filters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filename
Filter the results by the filename of any URL that was requested

```yaml
Type: String
Parameter Sets: Filters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ASN
Filter the results by ASN Number.
This filters by 'asn' by default, or 'page.asn' when -Strict is specified.

```yaml
Type: String
Parameter Sets: Filters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ASNName
Filter the results by ASN Name.
This filters by 'asnname' by default, or 'page.asnname' when -Strict is specified.

```yaml
Type: String
Parameter Sets: Filters
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Limit
The quantity of results you want to return.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageSize
The number of results to return in a single request.
This defaults to 100 for Free/Unregistered users.
If you have a subscription, this can be increased in-line with your subscription allowance when specifying an API Key.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### -Strict
Enable strict checking of filter parameters.
By default, results will be returned when the the filter has been found or called from anywhere within the requested URL.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReturnAll
Return all results for your search.
This could take an excessively long time and eat away at your API allowance, so use with caution.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Silent
The -Silent parameter is used to silence the Write-Host messages returned during scans.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -APIKey
The -APIKey parameter enables you to specify an API Key if you have an account with URLScan.io.
This will enable higher query limits and larger page sizes.
This is only necessary if your API Key has not been saved using Set-URLScanConfiguration

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RateLimitPause
The -RateLimitPause parameter is used to define the minimum percentage that can be reached of the allowable rate limit before queries are paused.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 5
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
