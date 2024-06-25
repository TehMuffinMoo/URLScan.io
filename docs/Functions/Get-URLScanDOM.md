---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Get-URLScanDOM

## SYNOPSIS
This function enables you to return the raw HTML DOM object for the scanned domain using URLScan.io

## SYNTAX

```
Get-URLScanDOM [-UUID] <Object> [[-Path] <String>] [-Open] [<CommonParameters>]
```

## DESCRIPTION
This function enables you to return the raw HTML DOM object for the scanned domain using URLScan.io

## EXAMPLES

### EXAMPLE 1
```powershell
Search-URLScan -Query 'page.domain:(/.*tiktok.*/ AND NOT tiktok.com AND NOT www.tiktok.com AND NOT shop.tiktok.com)' -Limit 5 | Get-URLScanDOM -Path '/User/Me/URLScan.io Webpages'

(5/5): URLScan.io Results Returned.                                                                                     

Saved HTML DOM: "7112abab-3347-4ca8-a224-906a8c357229.png" to: "/User/Me/URLScan.io Webpages"
Saved HTML DOM: "490b0d3f-094d-42a6-bab0-ce0ceed579e1.png" to: "/User/Me/URLScan.io Webpages"
Saved HTML DOM: "953d2812-e1b4-4823-8174-0926b761b9b6.png" to: "/User/Me/URLScan.io Webpages"
Saved HTML DOM: "529f9fbd-1609-4a3b-8b7f-3014fddd695f.png" to: "/User/Me/URLScan.io Webpages"
Saved HTML DOM: "4d8dc59f-2baa-42cb-8ece-72f24721b032.png" to: "/User/Me/URLScan.io Webpages"
```

## PARAMETERS

### -UUID
The UUID for the scan you want to retrieve the HTML DOM for.
This also accepts input as 'id' and '_id'

```yaml
Type: Object
Parameter Sets: (All)
Aliases: id, _id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
The path to save the HTML DOM(s) to.
Defaults to the current directory.

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

### -Open
Use the -Open parameter to display the HTML Page(s) in the default browser once saved.
These are opened individually, so it is strongly recommended to only use this if viewing a few pages at a time.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
