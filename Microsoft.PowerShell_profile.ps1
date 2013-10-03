# this file was located in `$HOME/Documents/WindowsPowerShell/`.
. (Resolve-Path $(split-Path $PROFILE) "profile.ps1")

$env:path += ";c:\tools"
set-alias ~ $home
set-alias gvim 'c:\Program files\Vim\vim74\gvim'


ls $(Join-Path $(Split-Path $PROFILE) "Modules") | %{ ipmo $_.BaseName -Force }


if (Test-Path $HOME/workspace) {
    mkdir $HOME/workspace -Force > $NULL
}

New-PSDrive -Name ws -PSProvider FileSystem -Root $Home/workspace > $null
New-PSDrive -Name hm -PSProvider FileSystem -Root $Home > $null
New-PSDrive -Name ps -PSProvider FileSystem -Root $(Split-Path $PROFILE) > $null
New-PSDrive -Name md -PSProvider FileSystem -Root $(Join-Path -Path $(Split-Path $PROFILE) -ChildPath "Modules") > $null

