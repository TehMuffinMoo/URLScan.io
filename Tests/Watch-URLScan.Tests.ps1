Describe 'Watch-URLScan' {
    It 'Watch Live Scans' {
        (Watch-URLScan -BreakAfter 15 -Interval 1).count | Should -BeGreaterOrEqual 15
    }
}