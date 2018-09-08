"vimrc

set ar
set autoread
set autowrite
set aw
set cmdheight=2
set confirm
set eb
set et
set expandtab
set fo+=mB
set foldenable
set history=1000
set iskeyword+=_,@,#,%,-
set laststatus=2
set lbr
set magic
set mouse=a
set number
set noswapfile
set nocompatible
set shm=atI
set smarttab
set sw=4
set tabstop=4
set ts=4
set viminfo+=!
set ww+=<,>,h,l
set fillchars=stl:^,stlnc:=,vert:\|,fold:-,diff:-

filetype plugin indent on

source ~/.vim/ui.vim

au filetype lisp source ~/.vim/lisp_config.vim

au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au BufRead,BufNewFile *.qml set filetype=qml

au filetype markdown source ~/.vim/markdown.vim
au filetype html,css,js source ~/.vim/web.vim
au filetype cpp,c source ~/.vim/c++_config.vim
au filetype python source ~/.vim/python_config.vim

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.lua,*.pl,*.rb exec ":call SetTitle()"
autocmd BufNewFile * normal G


augroup Mkdir
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

func SetTitle()
    if &filetype == 'sh'
        call setline(1,"#!/bin/bash")
        call append(line("."),"")
    elseif &filetype == 'lua'
        call setline(1,"#!/usr/bin/lua")
        call append(line("."),"")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/python")
        call append(line("."),"")
    elseif &filetype == 'perl'
        call setline(1,"#!/usr/bin/perl")
        call append(line("."),"")
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/ruby")
        call append(line("."),"")
    else
        call setline(1, "//File Name: ".expand("%"))
        call append(line("."), "//Author: ")
        call append(line(".")+1, "//Mail: ")
        call append(line(".")+2, "//Created Time: ".strftime("%c"))
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



map <F5> :call Compile()<CR>
func! Compile()
    exec "w"
    if &filetype == "c"
        if findfile("makefile", ".;") == "makefile"
            exec "!make rebuild"
            exec "!bash -c 'time ./%<'"
        else
            exec "!g++ % -o %<"
            exec "!bash -c 'time ./%<'"
        endif
    elseif &filetype == "cpp"
        if findfile("makefile", ".;") == "makefile"
            exec "!make rebuild"
            exec "!bash -c 'time ./%<'"
        else
            exec "!g++ % -o %< -std=c++14"
            exec "!bash -c 'time ./%<'"
        endif
    elseif &filetype == "asm"
        exec "!nasm -f elf ./% -o ./%<.o"
        exec "!gcc -m32 ./%<.o -o ./%<"
        exec "!bash -c 'time ./%<'"
    elseif &filetype == "sh"
        exec "!bash -c 'time bash %'"
    elseif &filetype == "python"
        exec "!bash -c 'time python %'"
    elseif &filetype == "go"
        exec "!bash -c 'time go build %<'"
        exec "!bash -c 'time ./%<'"
    elseif &filetype == "javascript"
        exec "!node %<"
    elseif &filetype == "lua"
        exec "!bash -c 'time lua %'"
    elseif &filetype == "perl"
        exec "!bash -c 'time perl %'"
    elseif &filetype == "ruby"
        exec "!bash -c 'time ruby %'"
    elseif &filetype == "qml"
        exec "!bash -c 'time qmlscene %'"
    elseif &filetype == "ebuild"
        exec "!ebuild % manifest"
    endif
endfunc

map <C-w> <C-w>w
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

nnoremap <C-h> :Autoformat<CR>
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap U <C-r>
noremap gk k
noremap gj j
noremap H ^
noremap L $

inoremap kj <Esc>

inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
inoremap <expr> <C-n>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-p>       pumvisible() ? "\<C-p>" : "\<Up>"


" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let mapleader=','
let g:mapleader=','

"Plugin List
packadd supertab
packadd YouCompleteMe
packadd auto-pairs
packadd gundo.vim
packadd molokai
packadd nerdcommenter
packadd rainbow_parentheses.vim
packadd tlib_vim
packadd ultisnips
packadd ale
packadd LeaderF
packadd denite.nvim
packadd vim-addon-mw-utils
packadd vim-autoclose
packadd vim-autoformat
packadd vim-closetag
packadd vim-easymotion
packadd vim-easy-align
packadd vim-fugitive
packadd vim-multiple-cursors
packadd vim-qml
packadd vim-snipmate
packadd vim-snippets
packadd vim-surround
packadd vimproc.vim
packadd xmledit
packadd vim-buffergator


set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:ycm_key_list_select_completion   = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:ycm_global_ycm_extra_conf        = '~/.ycm_extra_conf.py'

let g:ycm_key_list_invoke_completion                    = ""
let g:ycm_confirm_extra_conf                            = 0
let g:ycm_collect_identifiers_from_tags_files           = 1
let g:ycm_min_num_of_chars_for_completion               = 2
let g:ycm_cache_omnifunc                                = 0
let g:ycm_seed_identifiers_with_syntax                  = 1
let g:ycm_complete_in_comments                          = 1
let g:ycm_complete_in_strings                           = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_server_keep_logfiles                          = 1
let g:ycm_server_log_level                              = 'debug'
let g:ycm_show_diagnostics_ui                           = 0


let g:UltiSnipsExpandTrigger      = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsListSnippets       = "<c-e>"


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

let g:ale_sign_error   = 'X'
let g:ale_sign_warning = '!'


syntax on

set background=dark
let g:rehash256=1
let g:molokai_original=1
colorscheme molokai

set encoding=utf-8
