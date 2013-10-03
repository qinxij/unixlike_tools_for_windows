$tools_path = $(Split-Path $MyInvocation.MyCommand.Path)
$ps_path = $(Split-Path $PROFILE)

$env:path += $tools_path

# reg add ConEmu configration
reg import $(Join-Path $tools_path "ConEmu_configuration.reg")

Write-Host -ForegroundColor green "Download ivim ..."
git clone https://github.com/kepbod/ivim.git $HOME/ivim


Write-Host -ForegroundColor green "Installing Vundle..."
git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

Write-Host -ForegroundColor green "Installing hybrid theme..."
git clone git://github.com/w0ng/vim-hybrid.git $HOME/.vim/bundle/vim-hybrid

Write-Host -ForegroundColor green "Installing font for powerline..."
mkdir $HOME/.fonts -Force
wget -O $HOME/.fonts/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf --no-check-certificate
mkdir $HOME/.fonts.conf.d -Force
wget -O $HOME/.fonts.conf.d/10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf --no-check-certificate 


$more_vimrc_lines = @(cat $(Join-Path -Path $tools_path -ChildPath "more_vimrc.vim"))
$more_vimrc_lines |
    % { $_ -replace '##HOME##', $HOME -replace '##TOOLS##', $tools_path } |
    Add-Content "$HOME/_vimrc"

# get the contents and replace line breaks by U+000A
$contents = [IO.File]::ReadAllText("$HOME/_vimrc") -replace "`r`n?", "`n"
# create UTF-8 encoding without signature
$utf8 = New-Object System.Text.UTF8Encoding $false
# write the text back
[IO.File]::WriteAllText("$HOME/_vimrc", $contents, $utf8)


#     Add-Content $(Join-Path -Path $tools_path -ChildPath "more_vimrc.vim.tmp")
# cat $(Join-Path -Path $tools_path -ChildPath "more_vimrc.vim.tmp") | Add-Content $HOME/ivim/vimrc
# rm $(Join-Path -Path $tools_path -ChildPath "more_vimrc.vim.tmp")

## link _vim and _vimrc in windows.
ln --symbolic $Home/.vim $HOME/_vim
ln --symbolic $HOME/ivim/vimrc $HOME/_vimrc


mkdir $HOME/.vim/bundle/VimIM/plugin/ -Force
if (!(Test-Path "$HOME/.vim/bundle/VimIM/plugin/vimim.wubi.txt")) {
    wget -O $HOME/.vim/bundle/VimIM/plugin/vimim.wubi.txt http://vimim-data.googlecode.com/svn/trunk/data/vimim.wubi.txt --no-check-certificate
}


Write-Host -ForegroundColor green "Installing plugins using Vundle..."
gvim +'set nospell' +BundleInstall! +BundleClean! +qa! $HOME/ivim/tools/info.txt

Write-Host -ForegroundColor green "ivim has been installed. Just enjoy vimming!"

## configration for powerhsll:
Copy-Item $(Join-path -Path $tools_path -ChildPath "profile.ps1") `
    $(Join-Path -Path $ps_path -ChildPath "profile.ps1")
Copy-Item $(Join-path -Path $tools_path -ChildPath "gitutils.ps1") `
    $(Join-Path -Path $ps_path -ChildPath "gitutils.ps1")
Copy-Item $(Join-path -Path $tools_path -ChildPath "Microsoft.PowerShell_profile.ps1") `
    $PROFILE
