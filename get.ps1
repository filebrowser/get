#Requires -RunAsAdministrator 
#
#           File Browser Installer Script
#
#   GitHub: https://github.com/filebrowser/filebrowser
#   Issues: https://github.com/filebrowser/filebrowser/issues
#
#   Usage:
#
#   	iwr -useb https://filebrowser.github.io/get.ps1 | iex
#
#	You should run it as administrator so it can add filemanager to 
#	the PATH.
#
function Install-FileManager {
	$ErrorActionPreference = "Stop"

	$resource = "https://api.github.com/repos/filebrowser/filebrowser/releases/latest"
	$tag = Invoke-RestMethod -Method Get -Uri $resource | select -Expand tag_name
	$arch = "386"

	If ((Get-WmiObject Win32_OperatingSystem).OSArchitecture -eq "64-bit") {
		$arch = "amd64"
	}

	$file = "windows-$arch-filebrowser.zip"
	$url = "https://github.com/filebrowser/filebrowser/releases/download/$tag/$file"
	$temp =  New-TemporaryFile
	$folder = "${env:ProgramFiles}\filebrowser"

	Write-Host "Downloading" $url
		$WebClient = New-Object System.Net.WebClient 
		$WebClient.DownloadFile( $url, $temp ) 
	
	Write-Host "Extracting $temp.zip"
		Move-Item $temp "$temp.zip"
		Expand-Archive "$temp.zip" -DestinationPath $temp

	Write-Host "Installing filebrowser on $folder"
		If (-not (Test-Path $folder)) {
			New-Item -ItemType "directory" -Path $folder | Out-Null
		}
		if (Test-Path "$folder\filebrowser.exe") {
			Write-Host "Removing the old version"
			Remove-Item -Force "$folder\filebrowser.exe"
		}
		Move-Item "$temp\filebrowser.exe" "$folder\filebrowser.exe"

	Write-Host "Cleaning temporary files"
		Remove-Item -Force "$temp.zip"
		Remove-Item -Force -Recurse "$temp"

	Write-Host "Adding filemanager to the PATH"
		if ((Get-Command "pandoc.exe" -ErrorAction SilentlyContinue) -eq $null) { 
			$path = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).Path
			$path = $path + ";$folder"
			Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH –Value $path
		}

	Write-Host "filemanager successfully installed!" -ForegroundColor Green 
}

Install-FileManager
