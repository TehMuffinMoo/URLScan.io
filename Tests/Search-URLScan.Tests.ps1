Describe 'Search-URLScan' {
    It 'Query Domain' {
        (Search-URLScan -Query 'domain:google.com').count | Should -Be 100
    }
    It 'Query Domain with results size' {
        (Search-URLScan -Query 'domain:google.com' -Size 10).count | Should -Be 10
    }
    It 'Query Domain with paging' {
        (Search-URLScan -Query 'domain:google.com' -Size 300 -PageSize 100).count | Should -Be 300
    }
}