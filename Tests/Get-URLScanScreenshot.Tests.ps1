Describe 'Get-URLScanScreenshot' {
    It 'Get Screenshot from URLScan.io Scan' {
        $Scan = Search-URLScan -Query 'domain:google.com' -Limit 1
        $Scan | Get-URLScanScreenshot -Path ../
        $TestPath = Test-Path "../$($Scan._id).png"
        Remove-Item "../$($Scan._id).png" -Force
        $TestPath | Should -Be $true
    }
}