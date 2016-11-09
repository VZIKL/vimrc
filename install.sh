#!/bin/bash
if which apt-get >/dev/null; then
    sudo apt-get update
    sudo apt-get install vim ctags curl python-dev python3-dev xclip astyle xdg-utils nodejs git cmake build-essential nodejs-legacy python-setuptools libpython2.7-dbg libpython2.7-dev libpython-dev monodevelop cargo mono-devel mono-xbild mono-complete pyflakes
elif which pacman >/dev/null; then
    sudo pacman -Syu
    sudo pacman -S go cargo nodejs npm monodevelop base-level python2 python
elif which emerge >/dev/null; then
    sudo emerge -av dev-util/ctags vim net-misc/curl x11-misc/xclip dev-util/astyle x11-misc/xdg-utils net-libs/nodejs dev-vcs/git dev-util/cmake dev-python/setuptools dev-util/monodevelop dev-util/cargo pyflakes
fi
sudo pip install yapf
mv -f ~/.vim ~/vim_old && mv ~/.vimrc ~/vim_old/vimrc
cd ~ && git clone https://github.com/VZIKL/vimrc
mv ~/vimrc/vimrc ~/.vimrc && mv -f ~/vimrc ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/Valloric/YouCompleteMe ~/.vim/bunle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer
vim -c "BundleInstall" -c "q" -c "q"
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~
cp ~/.vim/bundle/vim-instant-markdown/after/ftplugin/markdown/instant-markdown.vim ~/.vim/plugin/instant-markdown.vim
sudo npm -g install instant-markdown-d && cd ~
chmod +x update.sh
echo 安装完成
echo "如果需要YCM支持python go rust等补全请cd ~/.vim/bundle/YouCompleteMe && ./install.py -all"
