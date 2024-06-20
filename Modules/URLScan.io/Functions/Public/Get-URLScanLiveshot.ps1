function Get-URLScanLiveshot {
    <#
    .SYNOPSIS
        This function enables you to retrieve a live screenshot for the specified URL taken by URLScan.io

    .DESCRIPTION
        This function enables you to retrieve a live screenshot for the specified URL taken by URLScan.io

    .PARAMETER URL
        The URL or domain of the website to take a screenshot for.

    .PARAMETER Path
        The path to save the screenshot(s) to. Defaults to the current directory.

    .PARAMETER Height
        The height of the screenshot in pixels. Defaults to 1080

    .PARAMETER Width
        The width of the screenshot in pixels. Defaults to 1920

    .PARAMETER Open
        Use the -Open parameter to display the screenshot(s) in the default photo viewer once saved. These are opened individually, so it is strongly recommended to only use this if viewing a few images at one time.

    .EXAMPLE
        ## Using -Open will open the screenshot in your default photo viewer
        Get-URLScanLiveshot -URL 'bbc.co.uk' -Open

        Saved Screenshot: "bbc.co.uk.png" to: "/User/Me/URLScan.io Images"

    .EXAMPLE
        Get-URLScanLiveshot -URL 'bbc.co.uk' -Path '/User/Me/URLScan.io Images'

        Saved Screenshot: "bbc.co.uk.png" to: "/User/Me/URLScan.io Images"

    .FUNCTIONALITY
        URLScan.io
    #>
    param(
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [uri]$URL,
        [String]$Path = $(if ($ENV:URLScanScreenshotPath) { $ENV:URLScanScreenshotPath } else { "$((Get-Location).path)" }),
        [Int]$Height = 1080,
        [Int]$Width = 1920,
        [Switch]$Open
    )

    process {
        if ($URL -notmatch 'http(s)?\:\/\/.*') {
            $URL = "https://$($URL)"
        }
        if (Test-Path $Path -PathType Container) {
            try {
                $PNGPath = "$($Path)/$($URL.Authority).png"
                Invoke-WebRequest -Method GET -Uri "https://urlscan.io/liveshot/?height=$($Height)&width=$($Width)&url=$($URL.OriginalString)" -OutFile $PNGPath
                if (Test-Path $PNGPath -PathType Leaf) {
                    Write-Host "Saved Screenshot: `"$($URL.Authority).png`" to: `"$($Path)`"" -ForegroundColor Green
                    if ($Open) {
                        $ResolvedTarget = "file://$((Get-Item $($PNGPath)).ResolvedTarget)"
                        Start-Process $ResolvedTarget
                    }
                }
            } catch {
                Write-Error $_.Exception.Message
            }
        } else {
            Write-Error "File Path $($Path) does not exist."
            break
        }
    }
}