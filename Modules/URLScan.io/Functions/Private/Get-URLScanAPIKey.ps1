function Get-URLScanAPIKey {
    <#
    .SYNOPSIS
        Retrieves the stored URLScan.io API Key from the local machine, if available.

    .DESCRIPTION
        This function will retrieve the saved URLScan.io API Key from the local user/machine if it has previously been stored.

    .EXAMPLE
        PS> Get-URLScanAPIKey

    .FUNCTIONALITY
        URLScan.io

    .FUNCTIONALITY
        Authentication
    #>
    $ApiKey = $ENV:URLScanAPIKey
    if (!$ApiKey) {
        break
    } else {
        try {
            $Bytes = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($ApiKey)) | ConvertTo-SecureString
            $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Bytes)
            $URLScanAPIKey = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($BSTR)
            [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
            if ($URLScanAPIKey) {
                return $URLScanAPIKey
            }
        } catch {
            Write-Colour 'Error. Unable to decode the API Key. Please set the API Key again using: ','Set-URLScanConfiguration -APIKey <apikey>' -Colour Red,Green
            break
        }
    }
}