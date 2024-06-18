---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Get-URLScan

## SYNOPSIS
This function enables you to retrieve submitted scans from URLScan.io

## SYNTAX

```
Get-URLScan -UUID <Object> [-Return <String>] [-ReturnType <String>] [<CommonParameters>]
```

## DESCRIPTION
This function enables you to retrieve submitted scans from URLScan.io

## EXAMPLES

### EXAMPLE 1
```powershell
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
```

### EXAMPLE 2
```powershell
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
```

### EXAMPLE 3
```powershell
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
```

## PARAMETERS

### -UUID
The UUID for the results you want to retrieve.
This also accepts input as 'id' and '_id'

```yaml
Type: Object
Parameter Sets: (All)
Aliases: id, _id

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Return
The type of data to return.
(I.e.
Links/Hashes/Technologies/etc.) By default the scan results are returned in their raw format.

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

### -ReturnType
The return type for results to be returned in.
(Object / JSON)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Object
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
