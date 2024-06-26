Describe 'Get-URLScanQuota' {
    It 'Get Quota' {
        (Get-URLScanQuota -APIKey $ENV:URLSCAN_IO).maxSearchResults | Should -BeGreaterOrEqual 100
    }
    It 'Get Quota Summary' {
        (Get-URLScanQuota -Summary | Where-Object {$_.scope -eq 'private'}).Scope | Should -Be 'Private'
    }
}