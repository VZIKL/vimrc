#!/bin/bash
cd ~/.vim && git pull
mv ~/.vim/vimrc ~/.vimrc
cd ~ && vim -c "BundleUpdate" -c "q" -c "q"
echo "Success Update"
