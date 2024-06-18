---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Get-URLScanQuota

## SYNOPSIS
This function returns your rate limiting quota.

## SYNTAX

```
Get-URLScanQuota [-Summary] [[-APIKey] <String>]
```

## DESCRIPTION
This function returns your rate limiting quota.

## EXAMPLES

### EXAMPLE 1
```powershell
Get-URLScanQuota

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
```

## PARAMETERS

### -Summary
Return a summary of quota usage

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
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
