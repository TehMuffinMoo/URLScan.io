Describe 'Get-URLScanLiveshot' {
    It 'Get Liveshot from URLScan.io Scan' {
        $Liveshot = Get-URLScanLiveshot -URL 'google.com' -Path ../
        $TestPath = Test-Path "../google.com.png"
        Remove-Item "../google.com.png" -Force
        $TestPath | Should -Be $true
    }
}