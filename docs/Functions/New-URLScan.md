---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# New-URLScan

## SYNOPSIS
This function enables you to submit a new scan to URLScan.io

## SYNTAX

```
New-URLScan [-URL] <String> [[-Visibility] <String>] [[-SourceCountry] <String>] [[-Referer] <String>]
 [[-CustomAgent] <String>] [[-Tags] <Object[]>] [-OverrideSafety] [-WaitForScan] [[-APIKey] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
This function enables you to submit a new scan to URLScan.io

## EXAMPLES

### EXAMPLE 1
```powershell
New-URLScan -URL 'https://google.com/test' `
                -Visibility public `
                -SourceCountry gb `
                -Referer 'https://google.com/test2' `
                -CustomAgent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36' `
                -Tags @('test','test2')

message    : Submission successful
uuid       : 4f916fa4-10d9-495c-851d-c8496c7ef534
result     : https://urlscan.io/result/4f916fa4-10d9-495c-851d-c8496c7ef534/
api        : https://urlscan.io/api/v1/result/4f916fa4-10d9-495c-851d-c8496c7ef534/
visibility : public
options    : @{useragent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) 
            Chrome/83.0.4103.61 Safari/537.36; headers=}
url        : https://google.com/test
country    : gb
```

## PARAMETERS

### -URL
The URL to submit to URLScan.io for scanning

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Visibility
The visibility to use when submitting a new scan request (public/unlisted/private).
Default is 'public'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Public
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceCountry
The source country to use when submitting a new scan request.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Referer
The HTTP Referer to use when submitting a new scan request.

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

### -CustomAgent
The HTTP User-Agent to use when submitting a new scan request.

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

### -Tags
A list of tags to use when submitting a new scan request.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OverrideSafety
If the -OverrideSafety parameter is used, this will disable reclassification of URLs with potential PII in them.
Use with care!

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

### -WaitForScan
The -WaitForScan parameter will wait for the scan to complete, then return the results.

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
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
