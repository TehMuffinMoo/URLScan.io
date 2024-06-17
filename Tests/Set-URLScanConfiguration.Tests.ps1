Describe 'Set-URLScanConfiguration' {
    It 'Set URLScan.io Default Page Size' {
        Set-URLScanConfiguration -DefaultPageLimit 1000
        (Get-URLScanConfiguration).'Page Size' | Should -Be 1000
    }
    It 'Set URLScan.io API Key' {
        Set-URLScanConfiguration -APIKey 'PesterTest'
        (Get-URLScanConfiguration -IncludeAPIKey).'API Key' | Should -Be 'PesterTest'
    }
}