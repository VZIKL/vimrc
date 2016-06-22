#!/bin/bash
if which apt-get >/dev/null; then
        sudo apt-get install vim ctags curl python-dev python3-dev xclip astyle xdg-utils nodejs git cmake build-essential
        sudo npm -g install instant-markdown-d
elif which emerge >/dev/null;then
        sudo emerge -av vim curl python-dev python3-dev astyle ctags xdg-utils nodejs git cmake build-essential
fi
sudo easy_install -ZU autopep8
mv -f ~/.vim ~/vim_old
mv ~/.vimrc ~/vim_old/vimrc
cd ~/ && git clone https://github.com/VZIKL/vimrc.git
mv ~/vimrc/vimrc ~/.vimrc
mv -f ~/vimrc ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "安装vim插件中" > VZIKL
vim VZIKL -c "BundleInstall" -c "q" -c "q"
cd ~/.vim/bundle/YouCompleteMe
./install.py --all
rm VZIKL
echo “安装完成
