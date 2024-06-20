Describe 'Get-URLScanConfiguration' {
    It 'Get URLScan.io Module Version' {
        $Manifest = (Test-ModuleManifest -Path "./Modules/URLScan.io/URLScan.io.psd1")
        (Get-URLScanConfiguration).Version | Should -Be $Manifest.Version
    }
    It 'Get URLScan.io Default Page Size' {
        (Get-URLScanConfiguration).'Page Size' | Should -Be 100
    }
    It 'Get URLScan.io API Key' {
        (Get-URLScanConfiguration).'API Key' | Should -Be 'API Key Not Set'
    }
    It 'Get URLScan.io Screenshot Path' {
        (Get-URLScanConfiguration).'Screenshot Path' | Should -Be 'Not Set'
    }
}