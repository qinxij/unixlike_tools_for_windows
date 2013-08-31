# this file was located in `$HOME/Documents/WindowsPowerShell/`.
. (Resolve-Path ~/Documents/WindowsPowerShell/profile.ps1)

$env:path += ";$home\tools;c:\tools"
set-alias ~ $home
set-alias gvim 'C:\Program Files (x86)\Vim\vim74\gvim'
set-alias curl C:\Users\qij\tools\curl-openssl-libssh2\bin\curl
import-module posh-git

New-PSDrive -Name ws -PSProvider FileSystem -Root $Home/workspace > $null
New-PSDrive -Name ps -PSProvider FileSystem -Root $Home/workspace/powershell > $null
New-PSDrive -Name in -PSProvider FileSystem -Root $Home/workspace/powershell/install_remove_software > $null
New-PSDrive -Name dcm -PSProvider FileSystem -Root $Home/Documents > $null
New-PSDrive -Name hm -PSProvider FileSystem -Root $Home > $null
