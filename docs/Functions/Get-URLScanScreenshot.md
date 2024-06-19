---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Get-URLScanScreenshot

## SYNOPSIS
This function enables you to retrieve screenshots taken by URLScan.io

## SYNTAX

```
Get-URLScanScreenshot [-UUID] <Object> [[-Path] <String>] [-Open] [<CommonParameters>]
```

## DESCRIPTION
This function enables you to retrieve screenshots taken by URLScan.io

## EXAMPLES

### EXAMPLE 1
```powershell
Search-URLScan -Query 'page.domain:(/.*tiktok.*/ AND NOT tiktok.com AND NOT www.tiktok.com AND NOT shop.tiktok.com)' -Limit 5 | Get-URLScanScreenshot -Path '/User/Me/URLScan.io Images'

(5/5): URLScan.io Results Returned.                                                                                     
Saved Screenshot: "7112abab-3347-4ca8-a224-906a8c357229.png" to: "/User/Me/URLScan.io Images"
Saved Screenshot: "490b0d3f-094d-42a6-bab0-ce0ceed579e1.png" to: "/User/Me/URLScan.io Images"
Saved Screenshot: "953d2812-e1b4-4823-8174-0926b761b9b6.png" to: "/User/Me/URLScan.io Images"
Saved Screenshot: "529f9fbd-1609-4a3b-8b7f-3014fddd695f.png" to: "/User/Me/URLScan.io Images"
Saved Screenshot: "4d8dc59f-2baa-42cb-8ece-72f24721b032.png" to: "/User/Me/URLScan.io Images"
```

## PARAMETERS

### -UUID
The UUID for the scan you want to retrieve the screenshot for.
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
The path to save the screenshot(s) to.
Defaults to the current directory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: "$((Get-Location).path)"
Accept pipeline input: False
Accept wildcard characters: False
```

### -Open
Use the -Open parameter to display the screenshot(s) in the default photo viewer once saved.
These are opened individually, so it is strongly recommended to only use this if viewing a few images at one time.

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
