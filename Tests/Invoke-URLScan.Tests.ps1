Describe 'Invoke-URLScan' {
    It 'Query URLScan.io' {
        (Invoke-URLScan -Query 'domain:google.com').count | Should -Be 100
    }
    It 'Query URLScan.io with results size' {
        (Invoke-URLScan -Query 'domain:google.com' -Size 10).count | Should -Be 10
    }
    It 'Query URLScan.io with paging' {
        (Invoke-URLScan -Query 'domain:google.com' -Size 300 -PageSize 100).count | Should -Be 300
    }
}