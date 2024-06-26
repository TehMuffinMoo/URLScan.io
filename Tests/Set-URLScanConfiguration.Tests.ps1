Describe 'Set-URLScanConfiguration' {
    It 'Set URLScan.io Default Page Size' {
        Set-URLScanConfiguration -DefaultPageLimit 1000
        (Get-URLScanConfiguration).'Page Size' | Should -Be 1000
    }
    It 'Set URLScan.io API Key' {
        Set-URLScanConfiguration -APIKey 'PesterTest'
        (Get-URLScanConfiguration -IncludeAPIKey).'API Key' | Should -Be 'PesterTest'
    }
    It 'Set URLScan.io Screenshot Path' {
        $PesterDir = New-Item -Type Directory -Name 'PesterTest' -Path ../
        Set-URLScanConfiguration -ScreenshotPath $PesterDir.ResolvedTarget
        $ScreenshotPath = $PesterDir.ResolvedTarget
        Remove-Item -Path $PesterDir.ResolvedTarget -Force
        (Get-URLScanConfiguration).'Screenshot Path' | Should -Be $($ScreenshotPath)
    }
}