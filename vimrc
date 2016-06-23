"about vim
"set cul
"set cuc
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
"highlight
set hlsearch
set incsearch
"languages
set langmenu=zh_CN.UTF-8
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
set cmdheight=2
"filetype
"
filetype on
filetype plugin on
filetype plugin indent on

set viminfo+=!
set iskeyword+=_,$,@,%,#,-

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
nmap tt :%s /\t/    /g<CR>
"NEW FILE TITLE
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
		call append(line(".")+4, "using namespace std;")
		call append(line(".")+5, "")
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

"Keyboard command
map <C-i> :call CompileRungcc()<CR>
func! CompileRungcc()
    exec "w"
    if &filetype=='c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
    elseif &filetype == 'cpp'
            exec "!g++ % -o %< -std=c++11"
            exec "!time ./%<"
    elseif &filetype == 'sh'
            :!time bash %
    elseif &filetype=='python'
            exec "!time python2.7 %"
    elseif &filetype == 'html'
            exec "!firefox % &"
    elseif &filetype == 'go'
            exec "!go build %<"
            exec "!time go run %"
    elseif &filetype == 'lua'
            exec "!time lua %"
    endif
endfunc
map <C-t> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc

"F3 Nerd树开关
map <F3> :NERDTreeToggle<CR>
"F8 Tagbar开关
map <F8> :TagbarToggle<CR>
" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>


map <C-w> <C-w>w

"OpenVIM NO FIle auto start NERDTree
autocmd vimenter * NERDTree
autocmd vimenter * Tagbar
"InstantMarkdownPreview
"打开新的buffer时自动定位到NerdTree
autocmd VimEnter * wincmd p
"Only NERDTree close vim
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



" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-x> :call NumberToggle()<cr>

" 自动定位到最后编辑的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" 关闭方向键,用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 分屏窗口移动, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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
"leader映射
let mapleader = ','
let g:mapleader = ','

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"Plugin 一堆插件
Bundle 'VundleVim/Vundle.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'mattn/emmet-vim'
Bundle 'vim-scripts/L9'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
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
Bundle 'msanders/snipmate.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'Townk/vim-autoclose'
Bundle 'jiangmiao/auto-pairs'
Bundle 'FredKSchott/CoVim'
Bundle 'plasticboy/vim-markdown'
Bundle 'suan/vim-instant-markdown'
Bundle 'SirVer/ultisnips'
Bundle 'Shougo/vimproc.vim'
Bundle 'rstacruz/sparkup'


let g:airline_detect_whitespace=0
let g:airline#extensions#tabline#enabled=1
let g:airline_theme="tomorrow"

set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <C-n>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-p>       pumvisible() ? "\<C-p>" : "\<Up>"

let g:ycm_key_list_select_completion=['<c-n>']
"let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion=['<c-p>']
"let g:ycm_key_list_previous_completion = ['<Up>']
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

let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_autofocus = 1


"MarkDown

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
"Makefile

let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}
"CSS

let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

let g:instant_markdown_autostart = 0

let g:solarized_termcolors=256
set background=dark
colorscheme solarized
