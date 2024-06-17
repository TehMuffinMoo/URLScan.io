$URLScanCountries = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    $(Invoke-RestMethod -Method GET -Uri 'https://urlscan.io/api/v1/availableCountries/').countries | Where-Object {$_ -like "$($wordToComplete)*"}
}
Register-ArgumentCompleter -CommandName Invoke-URLScan -ParameterName SourceCountry -ScriptBlock $URLScanCountries