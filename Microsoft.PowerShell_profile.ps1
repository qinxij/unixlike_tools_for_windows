# this file was located in `$HOME/Documents/WindowsPowerShell/`.
. (Join-Path $(split-Path $PROFILE) "profile.ps1")

$env:path += ";c:\tools"
set-alias ~ $home
set-alias gvim 'c:\Program files\Vim\vim74\gvim'

$ps_path = $(Split-Path $PROFILE)

if ( !(Test-Path "$ps_path\Modules") ) {
    mkdir "$ps_path\Modules"
}
ls $(Join-Path $(Split-Path $PROFILE) "Modules") | %{ ipmo $_.BaseName -Force }

if (!(Test-Path $HOME/workspace)) {
    mkdir $HOME/workspace -Force > $NULL
}

New-PSDrive -Name ws -PSProvider FileSystem -Root $Home/workspace > $null
New-PSDrive -Name hm -PSProvider FileSystem -Root $Home > $null
New-PSDrive -Name ps -PSProvider FileSystem -Root $(Split-Path $PROFILE) > $null
New-PSDrive -Name md -PSProvider FileSystem -Root $(Join-Path -Path $(Split-Path $PROFILE) -ChildPath "Modules") > $null

