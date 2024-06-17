Describe 'Invoke-URLScan' {
    Context 'Query' {
        It 'Query Domain' {
            (Invoke-URLScan -Query 'domain:google.com').count | Should -Be 100
        }
        It 'Query Domain with results size' {
            (Invoke-URLScan -Query 'domain:google.com' -Size 10).count | Should -Be 10
        }
        It 'Query Domain with paging' {
            (Invoke-URLScan -Query 'domain:google.com' -Size 300 -PageSize 100).count | Should -Be 300
        }
    }
    Context 'Scan' {
        It 'Scan Domain' {
            (Invoke-URLScan -Scan 'google.com' -APIKey $ENV:URLSCAN_IO).message | Should -Be 'Submission successful'
        }
        It 'Scan Domain with Private Visibility' {
            (Invoke-URLScan -Scan 'google.com' -Visibility private -APIKey $ENV:URLSCAN_IO).visibility | Should -Be 'private'
        }
        It 'Scan Domain with Source Country' {
            (Invoke-URLScan -Scan 'google.com' -SourceCountry 'nl' -APIKey $ENV:URLSCAN_IO).country | Should -Be 'nl'
        }
        It 'Scan Domain and wait for results' {
            (Invoke-URLScan -Scan 'google.com' -WaitForScan -APIKey $ENV:URLSCAN_IO).task.domain | Should -Be 'google.com'
        }
    }
    Context 'Results' {
        It 'Retrieve Results' {
            $Submission = Invoke-URLScan -Scan 'google.com' -APIKey $ENV:URLSCAN_IO
            while (!($Complete)) {
                $Complete = Invoke-URLScan -UUID $Submission.uuid -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
                Wait-Event -Timeout 3
            }
            $Complete.task.domain | Should -Be 'google.com'
        }
    }
}