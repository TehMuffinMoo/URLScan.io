---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Set-URLScanConfiguration

## SYNOPSIS
Used to set URLScan.io specific configuration

## SYNTAX

```
Set-URLScanConfiguration [[-APIKey] <String>] [[-DefaultPageLimit] <String>] [-Persist]
```

## DESCRIPTION
This function is used to set URLScan.io specific configuration, such as the BloxOne CSP API Key, Region/URL and enabling/disabling development or debug mode

## EXAMPLES

### EXAMPLE 1
```powershell
Set-URLScanConfiguration -APIKey '<APIKey>' -Persist
                                                                                                          
URLScan.io key has been stored permanently for user on MAC-DSD984HG
```

### EXAMPLE 2
```powershell
Set-ibPSConfiguration -DefaultPageLimit 1000
```

## PARAMETERS

### -APIKey
Use this parameter to save the API Key for URLScan.io.
If an API Key is not saved, you will be bound by the rate limits of a free user.

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

### -DefaultPageLimit
Optionally set the default page size to be returned when performing queries to URLScan.io.
This is set to 100 by default, which aligns with the Free Tier.
If you have an account or subscription with URLScan.io, you can specify this value in line with your account limits.

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

### -Persist
Setting the -Persist parameter will save the configuration permanently for your user on this device.
Without using this switch, the settings will only be saved for the duration of the PowerShell session.

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
