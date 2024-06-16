<style>
  .paramName {
    white-space: nowrap;
  }
</style>

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
  <a href="https://PSURLScanio.readthedocs.io"><img src="https://img.shields.io/readthedocs/PSURLScanio?label=Docs"></a>
</p>

<h4 align="center">A series of PowerShell Cmdlets used to interact with the InfoBlox BloxOne APIs.</h4>

<p align="center">
  <a href="#how-to-use">How To Use</a> •
  <a href="https://github.com/TehMuffinMoo/URLScan.io" target="_blank">Github</a> •
  <a href="https://www.powershellgallery.com/packages/URLScan.io/" target="_blank">Powershell Gallery</a>
</p>

# URLScan.io
A PowerShell Wrapper for URLScan.io

## How To Use
The easiest option to install the URLScan.io Module is to use the PowerShell Gallery.

### Loading URLScan.io Module
You can either load the module directly, or Install it as a PowerShell Module.

#### Installing from Powershell Gallery
```powershell
# Install for all users (Requires run as administrator)
Install-Module -Name URLScan.io -Scope AllUsers

# Install for current user
Install-Module -Name URLScan.io -Scope CurrentUser
```

## Import Module
```powershell
Import-Module ./Modules/URLScan.io/URLScanIO.psm1
```