#!/bin/bash

$ErrorActionPreference = 'Stop'

$SrcDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$DestDir   = Join-Path $env:APPDATA 'alacritty'

New-Item -ItemType Directory -Path $DestDir -Force | Out-Null

function New-Symlink {
    param(
        [Parameter(Mandatory)][string]$LinkPath,
        [Parameter(Mandatory)][string]$TargetPath
    )
    if (Test-Path $LinkPath) { Remove-Item $LinkPath -Force }
    try {
        New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath -Force | Out-Null
    } catch {
        Write-Warning "Symlink failed (no admin/Dev Mode?). Falling back to copy for $LinkPath"
        Copy-Item -Path $TargetPath -Destination $LinkPath -Force
    }
}

New-Symlink -LinkPath (Join-Path $DestDir 'alacritty-base.toml') -TargetPath (Join-Path $SrcDir 'alacritty-base.toml')
New-Symlink -LinkPath (Join-Path $DestDir 'alacritty.toml') -TargetPath (Join-Path $SrcDir 'alacritty-windows.toml')
