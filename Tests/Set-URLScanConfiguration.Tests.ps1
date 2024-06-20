Describe 'Set-URLScanConfiguration' {
    It 'Set URLScan.io Default Page Size' {
        Set-URLScanConfiguration -DefaultPageLimit 1000
        (Get-URLScanConfiguration).'Page Size' | Should -Be 1000
    }
    It 'Set URLScan.io API Key' {
        Set-URLScanConfiguration -APIKey 'PesterTest'
        (Get-URLScanConfiguration -IncludeAPIKey).'API Key' | Should -Be 'PesterTest'
    }
    It 'Set URLScan.io Screenshot Path Key' {
        $PesterDir = New-Item -Type Directory -Name 'PesterTest' -Path ./
        Set-URLScanConfiguration -ScreenshotPath $PesterDir.ResolvedTarget
        $GetURLConfiguration = Get-URLScanConfiguration
        Remove-Item -Path $PesterDir.ResolvedTarget -Force
        $GetURLConfiguration.'Screenshot Path' | Should -Be $($PesterDir.ResolvedTarget)
    }
}