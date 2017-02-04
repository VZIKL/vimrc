#!/bin/bash
sudo emerge -av dev-util/ctags vim net-misc/curl x11-misc/xclip dev-util/astyle x11-misc/xdg-utils net-libs/nodejs dev-vcs/git dev-util/cmake dev-python/setuptools dev-util/monodevelop dev-util/cargo pyflakes dev-python/pip clang llvm
git clone https://github.com/VZIKL/vimrc ~/.vim
mv ~/.vim/vimrc ~/.vimrc 
