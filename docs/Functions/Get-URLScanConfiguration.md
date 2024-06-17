---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Get-URLScanConfiguration

## SYNOPSIS
Used to get the current configuration for the URLScan.io Module

## SYNTAX

```
Get-URLScanConfiguration [-IncludeAPIKey]
```

## DESCRIPTION
This function is used to get the current configuration for the URLScan.io Module

## EXAMPLES

### EXAMPLE 1
```powershell
Get-ibPSConfiguration

CSP Url          : https://csp.infoblox.com
CSP API User     : svc-csp
CSP Account      : ACME Corp
CSP API Key      : ********
ibPS Version     : 1.9.4.4
ibPS Branch      : main
Debug Mode       : Disabled
Development Mode : Disabled
```

## PARAMETERS

### -IncludeAPIKey
The -IncludeAPIKey indicates whether the API Key should be returned in the response

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