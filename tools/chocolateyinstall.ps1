﻿$ErrorActionPreference = 'Stop'; 
$fullPackage = "3CXPhoneforWindows16.msi"
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://downloads.3cx.com/downloads/' + $fullPackage 

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'msi' 
  url            = $url
  softwareName   = '3CXPhone*'
  checksum       = '844f72d014921aac2a9974efd1e8ec5babfaadef43908b1ba7a406427bec2186'
  checksumType   = 'sha256' 
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" 
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs 