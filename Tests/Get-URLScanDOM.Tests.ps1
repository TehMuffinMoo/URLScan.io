Describe 'Get-URLScanDOM' {
    It 'Get DOM Object from URLScan.io Scan' {
        $Scan = Search-URLScan -Query 'domain:google.com' -Limit 1
        $Scan | Get-URLScanDOM -Path ../
        $TestPath = Test-Path "../$($Scan._id).html"
        Remove-Item "../$($Scan._id).html" -Force
        $TestPath | Should -Be $true
    }
}