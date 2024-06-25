function Get-URLScanDOM {
    <#
    .SYNOPSIS
        This function enables you to return the raw HTML DOM object for the scanned domain using URLScan.io

    .DESCRIPTION
        This function enables you to return the raw HTML DOM object for the scanned domain using URLScan.io

    .PARAMETER UUID
        The UUID for the scan you want to retrieve the HTML DOM for. This also accepts input as 'id' and '_id'

    .PARAMETER Path
        The path to save the HTML DOM(s) to. Defaults to the current directory.

    .PARAMETER Open
        Use the -Open parameter to display the HTML Page(s) in the default browser once saved. These are opened individually, so it is strongly recommended to only use this if viewing a few pages at a time.

    .EXAMPLE
        Search-URLScan -Query 'page.domain:(/.*tiktok.*/ AND NOT tiktok.com AND NOT www.tiktok.com AND NOT shop.tiktok.com)' -Limit 5 | Get-URLScanDOM -Path '/User/Me/URLScan.io Webpages'

        (5/5): URLScan.io Results Returned.                                                                                     

        Saved HTML DOM: "7112abab-3347-4ca8-a224-906a8c357229.png" to: "/User/Me/URLScan.io Webpages"
        Saved HTML DOM: "490b0d3f-094d-42a6-bab0-ce0ceed579e1.png" to: "/User/Me/URLScan.io Webpages"
        Saved HTML DOM: "953d2812-e1b4-4823-8174-0926b761b9b6.png" to: "/User/Me/URLScan.io Webpages"
        Saved HTML DOM: "529f9fbd-1609-4a3b-8b7f-3014fddd695f.png" to: "/User/Me/URLScan.io Webpages"
        Saved HTML DOM: "4d8dc59f-2baa-42cb-8ece-72f24721b032.png" to: "/User/Me/URLScan.io Webpages"

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
        [String]$Path,
        [Switch]$Open
    )

    process {
        if (Test-Path $Path -PathType Container) {
            try {
                $DOMPath = Join-Path $($Path) "$($UUID).html"
                Invoke-WebRequest -Method GET -Uri "https://urlscan.io/dom/$($UUID)/" -OutFile $DOMPath
                if (Test-Path $DOMPath -PathType Leaf) {
                    Write-Host "Saved HTML DOM: `"$($UUID).html`" to: `"$($Path)`"" -ForegroundColor Green
                    if ($Open) {
                        $ResolvedTarget = "file://$((Get-Item $($DOMPath)).ResolvedTarget)"
                        Start-Process $ResolvedTarget
                    }
                }
            } catch {
                Write-Error $_
                break
            }
        } else {
            Write-Error "File Path $($Path) does not exist."
            break
        }
    }
}