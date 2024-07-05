Describe 'Get-URLScanUser' {
    It 'Get the URLScan.io User Details' {

        $Failed = $false

        $CheckObjects = @(
            'createdAt'
            'firstname'
            'fullName'
            'lastname'
            'submissions'
            'email'
            'title'
            'isPro'
            'activeTeam'
            'limits'
            'preferences'
            'maxVisibility'
        )

        $User = Get-URLScanUser -APIKey $ENV:URLSCAN_IO
        $CheckObjects | %{
            if ($_ -notin $User.PSObject.Properties.Name) {
                $Failed = $true
            }
        }

        $Failed | Should -Be $false
    }
}