#!/bin/bash
if which emerge &> /dev/null;then
sudo emerge -av dev-util/ctags vim net-misc/curl x11-misc/xclip dev-util/astyle x11-misc/xdg-utils net-libs/nodejs dev-vcs/git dev-util/cmake dev-python/setuptools dev-util/monodevelop dev-util/cargo pyflakes dev-python/pip clang llvm gcc
elif which apt-get &> /dev/null;then
sudo apt-get install ctags vim curl xclip astyle xdg-utils nodejs git cmake python-setuptools monodevelop cargo pyflakes python-pip clang llvm gcc
fi
git clone https://github.com/VZIKL/vimrc ~/.vim
cd ~/.vim && git submodule update --init --recursive
cp ~/.vim/vimrc ~/.vimrc 
cp ~/.vim/pack/plugin/opt/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~
cp ~/.vim/pack/plugin/opt/slimv/syntax/lisp/slimv-syntax-lisp.vim ~/.vim/syntax/

cp ~/.vim/pack/plugin/opt/vim-airline-themes/autoload/airline/themes/* ~/.vim/pack/plugin/opt/vim-airline/autoload/airline/themes/

rm ~/install.sh
