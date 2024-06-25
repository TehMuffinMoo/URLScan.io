function Get-URLScanUser {
        <#
    .SYNOPSIS
        This function returns details about the current user

    .DESCRIPTION
        This function returns details about the user associated with the current API Key

    .PARAMETER Submissions
        Return the submission statistics for the current user

    .PARAMETER APIKey
        The -APIKey parameter enables you to specify an API Key if you have an account with URLScan.io. This will enable higher query limits and larger page sizes.
        This is only necessary if your API Key has not been saved using Set-URLScanConfiguration

    .EXAMPLE
        PS> Get-URLScanUser

        createdAt     : 2/18/2023 4:56:36 AM
        firstname     : Me
        fullName      : Me Foo
        lastname      : Foo
        submissions   : @{total=328; private=74; unlisted=0; public=254; api=326; manual=2; lastSubmission=6/25/2024 10:57:58 AM}
        email         : me@foo.com
        title         : Solutions Architect
        isPro         : False
        activeTeam    : @{firstname=Me}
        limits        : @{private=; public=; retrieve=; search=; unlisted=; livescan=; liveshot=; maxRetentionPeriodDays=7; maxSearchRangeMonths=3; maxSearchResults=1000; products=System.Object[]; features=System.Object[]; queryableFields=System.Object[]; queryVisibility=System.Object[]}
        preferences   : @{defaultVisibility=private; enforceVisibility=False}
        maxVisibility : public

    .EXAMPLE
        PS> Get-URLScanUser -Submissions                               

        Total           : 324
        Public          : 251
        Private         : 73
        Unlisted        : 0
        API             : 
        Manual          : 2
        Last Submission : 6/25/2024 10:39:30 AM

    .FUNCTIONALITY
        URLScan.io
    #>
    param(
        [Switch]$Submissions,
        [String]$APIKey
    )
    $Headers = Get-URLScanHeaders -APIKey $($APIKey)
    try {
        $Results = Invoke-RestMethod -Method GET -Uri "https://urlscan.io/user/username/" -Headers $Headers
    } catch {
        Write-Error $_
        break
    }

    if ($Results) {
        if ($Submissions) {
            $ReturnProperties = @{
                Property =  @{n="Total";e={$_.total}},
                            @{n="Public";e={$_.public}},
                            @{n="Private";e={$_.private}},
                            @{n="Unlisted";e={$_.unlisted}},
                            @{n="API";e={$_.stats.api}},
                            @{n="Manual";e={$_.manual}},
                            @{n="Last Submission";e={[DateTime]"$($_.lastSubmission)"}}
            }
            $Results.submissions | Select @ReturnProperties
        } else {
            return $Results
        }
    }
}