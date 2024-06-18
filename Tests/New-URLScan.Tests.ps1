Describe 'New-URLScan' {
    It 'Scan Domain' {
        (New-URLScan -URL 'google.com' -APIKey $ENV:URLSCAN_IO).message | Should -Be 'Submission successful'
    }
    It 'Scan Domain with Private Visibility' {
        (New-URLScan -URL 'google.com' -Visibility private -APIKey $ENV:URLSCAN_IO).visibility | Should -Be 'private'
    }
    It 'Scan Domain with Source Country' {
        (New-URLScan -URL 'google.com' -SourceCountry 'nl' -APIKey $ENV:URLSCAN_IO).country | Should -Be 'nl'
    }
    ## This is also used to test Get-URLScan as a dependency
    It 'Scan Domain and wait for results' {
        (New-URLScan -URL 'google.com' -WaitForScan -APIKey $ENV:URLSCAN_IO).task.domain | Should -Be 'google.com'
    }
}