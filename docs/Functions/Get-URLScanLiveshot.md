---
external help file: URLScan.io-help.xml
Module Name: URLScan.io
online version:
schema: 2.0.0
---

# Get-URLScanLiveshot

## SYNOPSIS
This function enables you to retrieve a live screenshot for the specified URL taken by URLScan.io

## SYNTAX

```
Get-URLScanLiveshot [-URL] <Uri> [[-Path] <String>] [[-Height] <Int32>] [[-Width] <Int32>] [-Open]
 [<CommonParameters>]
```

## DESCRIPTION
This function enables you to retrieve a live screenshot for the specified URL taken by URLScan.io

## EXAMPLES

### EXAMPLE 1
```powershell
## Using -Open will open the screenshot in your default photo viewer
Get-URLScanLiveshot -URL 'bbc.co.uk' -Open

Saved Screenshot: "bbc.co.uk.png" to: "/User/Me/URLScan.io Images"
```

### EXAMPLE 2
```powershell
Get-URLScanLiveshot -URL 'bbc.co.uk' -Path '/User/Me/URLScan.io Images'

Saved Screenshot: "bbc.co.uk.png" to: "/User/Me/URLScan.io Images"
```

## PARAMETERS

### -URL
The URL or domain of the website to take a screenshot for.

```yaml
Type: Uri
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
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
Default value: $(if ($ENV:URLScanScreenshotPath) { $ENV:URLScanScreenshotPath } else { "$((Get-Location).path)" })
Accept pipeline input: False
Accept wildcard characters: False
```

### -Height
The height of the screenshot in pixels.
Defaults to 1080

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 1080
Accept pipeline input: False
Accept wildcard characters: False
```

### -Width
The width of the screenshot in pixels.
Defaults to 1920

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 1920
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
