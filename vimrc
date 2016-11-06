"about vim
set shortmess=atI
set et
set lbr
set fo+=mB
set mousemodel=popup
set selection=inclusive
set sw=4
set smarttab
set smartindent
set sm
set ts=4
set wildmenu
set go=
set ruler
set showcmd
set laststatus=2
set foldenable
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number
set history=2000
" highlight
set hlsearch
set incsearch
" languages
set langmenu=zh_CN.UTF-8
set helplang=cn
set encoding=utf-8
set cmdheight=2
" filetype
"
filetype on
filetype plugin on
filetype plugin indent on

set viminfo+=!
set iskeyword+=_,$,@,%,#,-

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au BufRead,BufNewFile *.qml set filetype=qml
" NEW FILE TITLE
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.lua exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'lua'
        call setline(1,"#!/usr/bin/lua")
        call append(line("."),"")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/python")
        call append(line("."), "")
    else
        call setline(1, "//File Name: ".expand("%"))
        call append(line("."), "//Author: ")
        call append(line(".")+1, "//Mail: ")
        call append(line(".")+2, "//Created Time: ".strftime("%c"))
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+3, "#include<iostream>")
        call append(line(".")+4, "")
    endif
    if &filetype == 'c'
        call append(line(".")+3, "#include<stdio.h>")
        call append(line(".")+4, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+3, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+4, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+5, "#endif")
    endif
endfunc
autocmd BufNewFile * normal G

" Keyboard command
map <C-i> :call CompileRungcc()<CR>
func! CompileRungcc()
    exec "w"
    if &filetype=='c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -std=c++14"
        exec "!time ./%<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype=='python'
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time ./%<"
    elseif &filetype == 'lua'
        exec "!time lua %"
    elseif &filetype == 'qml'
        exec "!time qmlscene %"
    endif
endfunc
map <C-t> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

" F2 AutoFormat Code
noremap <F2> :Autoformat<CR>
" F3 Nerd树开关
map <F3> :NERDTreeToggle<CR>
" F8 Tagbar开关
map <F8> :TagbarToggle<CR>
" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


map <C-w> <C-w>w

" OpenVIM NO FIle auto start NERDTree
" autocmd vimenter * NERDTree
autocmd vimenter * Tagbar
" InstantMarkdownPreview
" 打开新的buffer时自动定位到主窗口
autocmd VimEnter * wincmd p
" Only NERDTree close vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set autoread
set autowrite
set magic
set guioptions-=T
set guioptions-=m
set noeb
set confirm
set nobackup
set noswapfile
set ignorecase
set linespace=0
set backspace=2
set whichwrap+=<,>,h,l
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set matchtime=1
set scrolloff=3



" 相对行号: 行号变成相对，可以用 C-x 进行跳转
" set relativenumber number
" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 命令模式下用相对
" autocmd InsertEnter * :set norelativenumber number
" autocmd InsertLeave * :set relativenumber
" function! NumberToggle()
" if(&relativenumber == 1)
" set norelativenumber number
" else
" set relativenumber
" endif
" endfunc
" nnoremap <C-x> :call NumberToggle()<cr>

" 自动定位到最后编辑的位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" 关闭方向键,用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Treat long lines as break lines (useful when moving around in them)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Go to home and end using capitalized directions H and L
noremap H ^
noremap L $

" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" kj 替换 Esc
inoremap kj <Esc>

" 滚动Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" remap U to <C-r> for easier redo
nnoremap U <C-r>
" leader映射
let mapleader = ','
let g:mapleader = ','

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Install Plugin
Bundle 'VundleVim/Vundle.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'wincent/command-t'
Bundle 'mattn/emmet-vim'
Bundle 'vim-scripts/L9'
" 如果nerdtree目录前面图标乱码https://github.com/scrooloose/nerdtree/issues/135 最后的评论应该是可以用的
Bundle 'scrooloose/nerdtree'
" Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'godlygeek/tabular'
Bundle 'majutsushi/tagbar'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'easymotion/vim-easymotion'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'Townk/vim-autoclose'
Bundle 'jiangmiao/auto-pairs'
" Bundle 'FredKSchott/CoVim'
Bundle 'plasticboy/vim-markdown'
Bundle 'suan/vim-instant-markdown'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'Shougo/vimproc.vim'
Bundle 'rstacruz/sparkup'
" Bundle 'tell-k/vim-autopep8'
Bundle 'tomasr/molokai'
Bundle 'peterhoeg/vim-qml'
Bundle 'Yggdroot/indentLine'
Bundle 'sukima/xmledit'
Bundle 'Chiel92/vim-autoformat'
Bundle 'mindriot101/vim-yapf'
" Bundle 'rhysd/vim-clang-format'

let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_theme="powerlineish"

let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" inentLine
let g:indentLine_leadingSpaceEnabled = 1

set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
" 上下左右键的行为 会显示其他信息
inoremap <expr> <C-n>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-p>       pumvisible() ? "\<C-p>" : "\<Up>"

let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
" let g:ycm_key_list_select_completion = ['<Down>'] 61键没有方向键
" let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_key_list_invoke_completion=""
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:UltiSnipsSnippetDirectories=["bundle/ultiSnips"]
let g:ycm_server_keep_logfiles=1
let g:ycm_server_log_level = 'debug'

let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_autofocus = 1

" Vim-yapf
scriptencoding utf-8
let g:yapf_style = "google"
nnoremap <Leader>y :call Yapf()<cr>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol='>>'       " 错误行使用'>>' 标记
let g:syntastic_warning_symbol='>'      " 警告行使用'>' 标记
let g:syntastic_check_on_open=1     " 打开文件时即开启语法检查
let g:syntastic_check_on_wq=0       " 保存时进行语法检查
let g:syntastic_enable_highlighting=1   " 提示内容高亮显示
" 设置Python检查规则为pyflakes和pep8
let g:syntastic_python_checkers=['pyflakes', 'pep8']
" 提示内容显示相关
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1


" NerdTree
let NERDTreeIgnore=['\.pyc$','\.pyo$','\.o$','\.so$','\.egg$'] "忽略文件


" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" rainbow pair
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
" map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" map <Leader>f <Plug>(easymotion-bd-f)
" map <Leader>f <Plug>(easymotion-overwin-f)


" autopep8
" let g:autopep8_disable_show_diff=1

" markdown 如果无法显示检查主目录下的.ctags文件对照https://github.com/majutsushi/tagbar/wiki#markdown自行修改
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }

let g:instant_markdown_autostart = 0


syntax on

set background=dark
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1
