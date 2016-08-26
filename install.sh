#!/bin/bash
if which apt-get >/dev/null; then
    sudo apt-get update
    sudo apt-get install vim ctags curl python-dev python3-dev xclip astyle xdg-utils nodejs git cmake build-essential nodejs-legacy python-setuptools libpython2.7-dbg libpython2.7-dev libpython-dev
elif which pacman >/dev/null; then
    sudo pacman -Syu
    sudo pacman -S go cargo nodejs npm monodevelop base-level python2 python
fi
mv -f ~/.vim ~/vim_old && mv ~/.vimrc ~/vim_old/vimrc
cd ~ && git clone https://github.com/VZIKL/vimrc
mv ~/vimrc/vimrc ~/.vimrc && mv -f ~/vimrc ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/
git clone https://github.com/Valloric/YouCompleteMe ~/.vim/bunle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
echo "安装vim插件中" > VZIKL
vim VZIKL -c "BundleInstall" -c "q" -c "q"
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~
cp ~/.vim/bundle/vim-instant-markdown/after/ftplugin/markdown/instant-markdown.vim ~/.vim/plugin/instant-markdown.vim
rm VZIKL
sudo npm -g install instant-markdown-d
cd ~
echo “安装完成
