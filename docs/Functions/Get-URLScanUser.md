---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Get-URLScanUser

## SYNOPSIS
This function returns details about the current user

## SYNTAX

```
Get-URLScanUser [-Submissions] [[-APIKey] <String>]
```

## DESCRIPTION
This function returns details about the user associated with the current API Key

## EXAMPLES

### EXAMPLE 1
```powershell
Get-URLScanUser

createdAt     : 2/18/2023 4:56:36 AM
firstname     : Me
fullName      : Me Foo
lastname      : Foo
submissions   : @{total=328; private=74; unlisted=0; public=254; api=326; manual=2; lastSubmission=6/25/2024 10:57:58 AM}
email         : me@foo.com
title         : Solutions Architect
isPro         : False
activeTeam    : @{firstname=Me}
limits        : @{private=; public=; retrieve=; search=; unlisted=; livescan=; liveshot=; maxRetentionPeriodDays=7; maxSearchRangeMonths=3; maxSearchResults=1000; products=System.Object[]; features=System.Object[]; queryableFields=System.Object[]; queryVisibility=System.Object[]}
preferences   : @{defaultVisibility=private; enforceVisibility=False}
maxVisibility : public
```

### EXAMPLE 2
```powershell
Get-URLScanUser -Submissions

Total           : 324
Public          : 251
Private         : 73
Unlisted        : 0
API             : 
Manual          : 2
Last Submission : 6/25/2024 10:39:30 AM
```

## PARAMETERS

### -Submissions
Return the submission statistics for the current user

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
