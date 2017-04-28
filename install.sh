#!/bin/bash
if which emerge &> /dev/null;then
sudo emerge -av dev-util/ctags vim net-misc/curl x11-misc/xclip dev-util/astyle x11-misc/xdg-utils net-libs/nodejs dev-vcs/git dev-util/cmake dev-python/setuptools dev-util/monodevelop dev-util/cargo pyflakes dev-python/pip clang llvm
elif which apt-get &> /dev/null;then
sudo apt-get install ctags vim curl xclip astyle xdg-utils nodejs git cmake setuptools monodevelop cargo pyflakes pip clang llvm
fi
git clone https://github.com/VZIKL/vimrc ~/.vim
cd ~/.vim && git submodule update --init
mv ~/.vim/vimrc ~/.vimrc 
