#!/bin/bash
mv ~/.vimrc ~/.vim/vimrc
cd ~/.vim && git pull
mv ~/.vim/vimrc ~/.vimrc
cd ~ && vim -c "BundleUpdate" -c "q" -c "q"
echo "Success Update"
echo "Maybe you will complete ycm"
