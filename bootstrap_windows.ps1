echo "Download ivim ..."
git clone https://github.com/kepbod/ivim.git $HOME/ivimgvim


echo "Installing Vundle..."
git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "Installing hybrid theme..."
git clone git://github.com/w0ng/vim-hybrid.git $HOME/.vim/bundle/vim-hybrid

echo "Installing font for powerline..."
mkdir $HOME/.fonts -Force
wget -O $HOME/.fonts/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf --no-check-certificate
mkdir $HOME/.fonts.conf.d -Force
wget -O $HOME/.fonts.conf.d/10-powerline-symbols.conf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf --no-check-certificate 


## link _vim and _vimrc in windows.
ln --unroll --recursive $Home/.vim $HOME/_vim
ln --symbolic $HOME/ivim/vimrc $HOME/_vimrc

echo "Installing plugins using Vundle..."
gvim +'set nospell' +BundleInstall! +BundleClean! +qa! $HOME/ivim/tools/info.txt

echo "ivim has been installed. Just enjoy vimming!"
