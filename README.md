<h1 align="center">
  <br>
  <!--<a href=""><img src="" alt="Markdownify" width="200"></a>-->
  <br>
  URLScan.io Powershell Module
  <br>
</h1>

<p align="center">
  <a href="https://www.powershellgallery.com/packages/URLScan.io"><img src="https://img.shields.io/powershellgallery/v/URLScan.io?label=Powershell%20Gallery"></a>
  <a href="https://github.com/TehMuffinMoo/URLScan.io"><img src="https://img.shields.io/github/v/release/TehMuffinMoo/URLScan.io.svg?label=Github Release"></a>
  <a href="https://github.com/TehMuffinMoo/URLScan.io"><img src="https://img.shields.io/github/languages/code-size/TehMuffinMoo/URLScan.io.svg?label=Code%20Size"></a>
  <a href="https://www.powershellgallery.com/packages/URLScan.io"><img src="https://img.shields.io/powershellgallery/dt/URLScan.io?label=Downloads"></a>
  <a href="https://www.powershellgallery.com/packages/URLScan.io"><img src="https://img.shields.io/powershellgallery/p/URLScan.io?label=Supported Platforms&color=%236600bf"></a>
  <img src="https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2FTehMuffinMoo%2FURLScan.io%2Fdev%2Fdocs%2Fmanifest.json&query=%24.Count&label=Available%20Functions&color=orange"</img>
  <a href="https://github.com/TehMuffinMoo/URLScan.io/releases"><img src="https://img.shields.io/github/release-date/tehmuffinmoo/URLScan.io?label=Latest%20Release"></a>
  <a href="https://psurlscanio.readthedocs.io"><img src="https://img.shields.io/readthedocs/psurlscanio?label=Docs"></a>
  <a href="https://github.com/TehMuffinMoo/URLScan.io/actions/workflows/Run%20Pester%20Tests.yaml"><img src="https://img.shields.io/github/actions/workflow/status/TehMuffinMoo/URLScan.io/Run%20Pester%20Tests.yaml?label=Dev Pester Tests&branch=dev&color=%230072c6"></a>
  <a href="https://github.com/TehMuffinMoo/URLScan.io/actions/workflows/Run%20Pester%20Tests%20(PS%20Gallery).yaml"><img src="https://img.shields.io/github/actions/workflow/status/TehMuffinMoo/URLScan.io/Run%20Pester%20Tests%20(PS%20Gallery).yaml?label=Latest Pester Tests&branch=main&color=%230072c6"></a>
</p>

<h4 align="center">A series of PowerShell Cmdlets used to interact with the URLScan.io APIs.</h4>

<p align="center">
  <a href="#how-to-use">How To Use</a> •
  <a href="https://psurlscanio.readthedocs.io" target="_blank">Documentation</a> •
  <a href="https://www.powershellgallery.com/packages/URLScan.io/" target="_blank">Powershell Gallery</a>
</p>

# URLScan.io
URLScan.io is a PowerShell Wrapper for URLScan.io. It does what it says on the tin!

This module enables you to Search, Scan & Retrieve Results or Screenshots from the URLScan.io APIs. It includes support for paging and their rate limiting system.

## How To Use
The easiest option to install the URLScan.io Module is to use the PowerShell Gallery.

Once installed, you can set your API Key using [`Set-URLScanConfiguration`](https://psurlscanio.readthedocs.io/en/latest/Functions/Set-URLScanConfiguration/)

### Installing URLScan.io Module
You can either load the module directly, or Install it as a PowerShell Module.

#### Installing from Powershell Gallery
```powershell
# Install for all users (Requires run as administrator)
Install-Module -Name URLScan.io -Scope AllUsers

# Install for current user
Install-Module -Name URLScan.io -Scope CurrentUser
```

#### Installing from Github
You can install from source directly from Github using the command below.
```powershell
iex "& {$(irm https://raw.githubusercontent.com/TehMuffinMoo/URLScan.io/main/Install.ps1)} s"
```

You can optionally also append the branch name at the end, as shown below
```powershell
iex "& {$(irm https://raw.githubusercontent.com/TehMuffinMoo/URLScan.io/main/Install.ps1)} s dev"
```

#### Import Module
```powershell
Import-Module ./Modules/URLScan.io/URLScan.io.psm1
```

### Documentation
All documentation is now available here: [URLScan.io Documentation](https://psurlscanio.readthedocs.io)
