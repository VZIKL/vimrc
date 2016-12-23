#!/bin/bash
if which apt-get >/dev/null; then
    sudo apt-get update
    sudo apt-get install vim ctags curl python-dev python3-dev xclip astyle xdg-utils nodejs git cmake build-essential nodejs-legacy python-setuptools libpython2.7-dbg libpython2.7-dev libpython-dev monodevelop cargo mono-devel mono-xbuild mono-complete pyflakes clang-format python-pep8 python-jedi pyflakes 
elif which pacman >/dev/null; then
    sudo pacman -Syu
    sudo pacman -S go cargo nodejs npm monodevelop base-level python2 python
elif which emerge >/dev/null; then
    sudo emerge -av dev-util/ctags vim net-misc/curl x11-misc/xclip dev-util/astyle x11-misc/xdg-utils net-libs/nodejs dev-vcs/git dev-util/cmake dev-python/setuptools dev-util/monodevelop dev-util/cargo pyflakes dev-python/pip clang llvm dev-python/pep8 jedi
fi
vim_info=$(vim --version|head -1|cut -d ' ' -f 5)
sudo pip install yapf
mv -f ~/.vim ~/vim_old && mv ~/.vimrc ~/vim_old/vimrc
cd ~ && git clone https://github.com/VZIKL/vimrc
git clone https://github.com/powerline/fonts
cd fonts && sudo ./install.sh
mv ~/vimrc/tern-config ~/.tern-config
mv ~/vimrc/vimrc ~/.vimrc && mv -f ~/vimrc ~/.vim
if [vim_info >=8.0];then
    mkdir ~/.vim/pack
    mkdir ~/.vim/pack/plugin
    cd ~/.vim/pack/plugin
    git clone https://github.com/vim-scripts/L9
    git clone https://github.com/jiangmiao/auto-pairs
    git clone https://github.com/kien/ctrlp.vim
    git clone https://github.com/tomasr/molokai
    git clone https://github.com/scrooloose/nerdtree
    git clone https://github.com/Yggdroot/indentLine
    git clone https://github.com/kien/rainbow_parentheses.vim
    git clone https://github.com/ervandew/supertab
    git clone https://github.com/vim-syntastic/syntastic
    git clone https://github.com/majutsushi/tagbar
    git clone https://github.com/vim-airline/vim-airline
    git clone https://github.com/vim-airline/vim-airline-themes
    git clone https://github.com/godlygeek/tabular
    git clone https://github.com/tomtom/tlib_vim
    git clone https://github.com/SirVer/ultisnips
    git clone https://github.com/MarcWeber/vim-addon-mw-utils
    git clone https://github.com/Townk/vim-autoclose
    git clone https://github.com/Chiel92/vim-autoformat
    git clone https://github.com/easymotion/vim-easymotion
    git clone https://github.com/tpope/vim-fugitive
    git clone https://github.com/garbas/vim-snipmate
    git clone https://github.com/tpope/vim-surround
    git clone https://github.com/Shougo/vimproc.vim
    git clone https://github.com/mattn/emmet-vim
    git clone https://github.com/rstacruz/sparkup
    git clone https://github.com/suan/vim-instant-markdown
    git clone https://github.com/plasticboy/vim-markdown
    git clone https://github.com/peterhoeg/vim-qml
    git clone https://github.com/mindriot101/vim-yapf
    git clone https://github.com/sukima/xmledit
    git clone https://github.com/alvan/vim-closetag
    git clone https://github.com/gorodinskiy/vim-coloresque
    git clone https://github.com/Valloric/MatchTagAlways
    git clone https://github.com/ternjs/tern_for_vim
    git clone https://github.com/Chiel92/vim-autoformat
    git clone https://github.com/maksimr/vim-jsbeautify
    git clone https://github.com/sjl/gundo.vim
    git clone https://github.com/ternjs/tern_for_vim
    git clone https://github.com/terryma/vim-multiple-cursors
    git clone --recursive https://github.com/Valloric/YouCompleteMe
    cd ~/.vim/pack/plugin/opt/YouCompleteMe
    ./install.py --clang-completer
    cp ~/.vim/pack/plugin/opt/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~
    cp ~/.vim/pack/plugin/opt/vim-instant-markdown/after/ftplugin/markdown/instant-markdown.vim ~/.vim/plugin/instant-markdown.vim
    cd ~/.vim/pack/plugin/opt/tern_for_vim
    sudo npm install -g
    sudo npm -g install instant-markdown-d && cd ~
    sudo npm -g install js-beautify
    sudo npm -g install jshint
    sudo npm -g install csslint
    clang-format  -style=google -dump-config > .clang-format
else
    mkdir ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    git clone --recursive https://github.com/Valloric/YouCompleteMe ~/.vim/bundle/YouCompleteMe
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
    vim -c "BundleInstall" -c "q" -c "q"
    cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~
    cp ~/.vim/bundle/vim-instant-markdown/after/ftplugin/markdown/instant-markdown.vim ~/.vim/plugin/instant-markdown.vim
    cd ~/.vim/pack/plugin/opt/tern_for_vim
    sudo npm install -g
    sudo npm -g install instant-markdown-d && cd ~
    sudo npm -g install js-beautify
    sudo npm -g install jshint
    sudo npm -g install csslint
    clang-format  -style=google -dump-config > .clang-format
    chmod +x update.sh
    echo 安装完成
    echo "编译ycm cd ~/.vim/bundle/YouCompleteMe && ./install.py -all"
fi
