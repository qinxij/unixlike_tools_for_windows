Write-Host -ForegroundColor green "Download ivim ..."
git clone https://github.com/kepbod/ivim.git $HOME/ivimgvim


Write-Host -ForegroundColor green "Installing Vundle..."
git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

Write-Host -ForegroundColor green "Installing hybrid theme..."
git clone git://github.com/w0ng/vim-hybrid.git $HOME/.vim/bundle/vim-hybrid

Write-Host -ForegroundColor green "Installing font for powerline..."
mkdir $HOME/.fonts -Force
wget -O $HOME/.fonts/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf --no-check-certificate
mkdir $HOME/.fonts.conf.d -Force
wget -O $HOME/.fonts.conf.d/10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf --no-check-certificate 


## link _vim and _vimrc in windows.
ln --unroll --recursive $Home/.vim $HOME/_vim
ln --symbolic $HOME/ivim/vimrc $HOME/_vimrc

Write-Host -ForegroundColor green "Installing plugins using Vundle..."
gvim +'set nospell' +BundleInstall! +BundleClean! +qa! $HOME/ivim/tools/info.txt

Write-Host -ForegroundColor green "ivim has been installed. Just enjoy vimming!"
