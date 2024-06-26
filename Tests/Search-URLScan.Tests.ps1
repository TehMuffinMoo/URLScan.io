Describe 'Search-URLScan' {
    It 'Query Domain' {
        (Search-URLScan -Query 'domain:google.com').count | Should -Be 100
    }
    It 'Query Domain with results size' {
        (Search-URLScan -Query 'domain:google.com' -Limit 10).count | Should -Be 10
    }
    It 'Query Domain with paging' {
        (Search-URLScan -Query 'domain:google.com' -Limit 300 -PageSize 100).count | Should -Be 300
    }
    It 'Query Domain with -ReturnAll parameter' {
        (Search-URLScan -Query 'domain:ns1.google.com' -ReturnAll).count | Should -BeGreaterOrEqual 1
    }
}