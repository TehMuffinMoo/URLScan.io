function Get-URLScanScreenshot {
    <#
    .SYNOPSIS
        This function enables you to retrieve screenshots taken by URLScan.io

    .DESCRIPTION
        This function enables you to retrieve screenshots taken by URLScan.io

    .PARAMETER UUID
        The UUID for the scan you want to retrieve the screenshot for. This also accepts input as 'id' and '_id'

    .PARAMETER Path
        The path to save the screenshot(s) to. Defaults to the current directory.

    .PARAMETER Open
        Use the -Open parameter to display the screenshot(s) in the default photo viewer once saved. These are opened individually, so it is strongly recommended to only use this if viewing a few images at one time.

    .PARAMETER APIKey
        The -APIKey parameter enables you to specify an API Key if you have an account with URLScan.io. This will enable higher query limits and larger page sizes.
        This is only necessary if your API Key has not been saved using Set-URLScanConfiguration

    .EXAMPLE
        Search-URLScan -Query 'page.domain:(/.*tiktok.*/ AND NOT tiktok.com AND NOT www.tiktok.com AND NOT shop.tiktok.com)' -Limit 5 | Get-URLScanScreenshot -Path '/User/Me/URLScan.io Images'

        (5/5): URLScan.io Results Returned.                                                                                     
        Saved Screenshot: "7112abab-3347-4ca8-a224-906a8c357229.png" to: "/User/Me/URLScan.io Images"
        Saved Screenshot: "490b0d3f-094d-42a6-bab0-ce0ceed579e1.png" to: "/User/Me/URLScan.io Images"
        Saved Screenshot: "953d2812-e1b4-4823-8174-0926b761b9b6.png" to: "/User/Me/URLScan.io Images"
        Saved Screenshot: "529f9fbd-1609-4a3b-8b7f-3014fddd695f.png" to: "/User/Me/URLScan.io Images"
        Saved Screenshot: "4d8dc59f-2baa-42cb-8ece-72f24721b032.png" to: "/User/Me/URLScan.io Images"

    .FUNCTIONALITY
        URLScan.io
    #>
    param(
        [Parameter(
            Mandatory=$true,
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidatePattern('^\w{8}\-\w{4}\-\w{4}\-\w{4}\-\w{12}$')]
        [Alias('id','_id')]
        $UUID,
        [String]$Path = "$((Get-Location).path)",
        [Switch]$Open
    )
    begin {
        $Headers = Get-URLScanHeaders -APIKey $($APIKey)
    }

    process {
        if (Test-Path $Path -PathType Container) {
            try {
                $PNGPath = "$($Path)/$($UUID).png"
                Invoke-WebRequest -Method GET -Uri "https://urlscan.io/screenshots/$($UUID).png" -Headers $Headers -OutFile $PNGPath
                if (Test-Path $PNGPath -PathType Leaf) {
                    Write-Host "Saved Screenshot: `"$($UUID).png`" to: `"$($Path)`"" -ForegroundColor Green
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