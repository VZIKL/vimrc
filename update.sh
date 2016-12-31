#!/bin/bash
mv ~/.vimrc ~/.vim/vimrc
cd ~/.vim && git pull
mv ~/.vim/vimrc ~/.vimrc
vim_info=$(vim --version|head -1|cut -d ' ' -f 5)
if  [vim_info >=8.0];then
    cd ~/.vim/pack/plugin/opt
    ls | xargs -I{} git -C {} pull
else
    cd ~ && vim -c "BundleUpdate" -c "q" -c "q"
fi
echo "Success Update"
echo "Maybe you should complete ycm"
