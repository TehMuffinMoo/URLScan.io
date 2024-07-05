## 1.0.5
- Add additional error checking & formatting
- Add `Install.ps1` for installing directly from source
- Add `Get-URLScanUser` function for retrieving details about the current user
- Add `Get-URLScanDOM` function for retrieving HTML DOM webpage content from scans

## 1.0.4
- Add additional error checking & formatting
- Add `Install.ps1` for installing directly from source
- Add `Get-URLScanUser` function for retrieving details about the current user
- Add `Get-URLScanDOM` function for retrieving HTML DOM webpage content from scans

## 1.0.3
- Return Saved Screenshot Path when using `Get-URLScanConfiguration`
- Add additional Return Types to `Get-URLScan`
- Enable pipeline support for `-URL` parameter using the `Get-URLScanLiveshot` function

## 1.0.2
- Add missing `-APIKey` parameter to `Get-URLScan`
- Add new `Get-URLScanScreenshot` function for retrieiving screenshots from URLScan.io
- Add new `Get-URLScanLiveshot` function for retrieving live screenshots using URLScan.io
- Added new `-ScreenshotPath` parameter to `Set-URLScanConfiguration` for setting a default path for screenshots to be saved when using `Get-URLScanScreenshot` & `Get-URLScanLiveshot`

## 1.0.1
- Add `-Domain`, `-IP`, `-Country`, `-Server`, `-Hash`, `-FileName`, `-ASN`, `-ASNName`, `-Strict` & `-Silent` parameters to `Search-URLScan`
- Add `-ReturnAll` parameter to `Search-URLScan` to return all related results via paging
- Rename `-Size` parameter to `-Limit` to avoid overlapping parameter names when using pipeline

## 1.0.0.6
- Fix minor bug with New-URLScan

## 1.0.0.5
- Add specific `Watch-URLScan` function for watching/tailing the live feed of URLScan.io submissions
- Add specific `New-URLScan` function to improve new URLScan.io submissions
- Add specific `Get-URLScan` function to improve retrieving URLScan.io submissions
- Add `Get-URLScanQuota` function for checking Rate Limit Quota

## 1.0.0.4
- Improve version checking when multiple versions are installed
- Add missing misc function for detecting OS

## 1.0.0.3
- Fix issue with `Set-URLScanConfiguration -DefaultPageLimit`

## 1.0.0.2
- Fix issue with `Invoke-URLScan` when using Powershell v5

## 1.0.0.1
- Add `Get-URLScanConfiguration` & `Set-URLScanConfiguration` functions to enable storing/retrieving module related configuration.

## 1.0.0.0
- Initial Publication













