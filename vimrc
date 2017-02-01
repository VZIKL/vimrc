"vimrc

set ar
set aw
set cmdheight=2
set eb
set encoding=utf-8
set et
set expandtab
set fillchars=stl:^,stlnc:=,vert:\|,fold:-,diff:-
set fo+=mB
set history=1000
set iskeyword+=_,@,#,%,-
set laststatus=2
set lbr
set mouse=a
set number
set shm=atI
set smarttab
set sw=4
set tabstop=4
set ts=4
set viminfo+=!
set ww+=<,>,h,l

filetype on
filetype plugin on
filetype indent on


au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
au BufRead,BufNewFile *.qml set filetype=qml
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.lua exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1,"#!/bin/bash")
        call append(line("."),"")
        "elseif &filetype == 'lua'
        "    call setline(1,"#!/usr/bin/lua")
        "    call append(line("."),"")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/python")
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

autocmd BufNewFile * normal G

map <C-i> :call CompileRungcc()<CR>
func! CompileRungcc()
    exec "w"
    if &filetype == "c"
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == "cpp"
        exec "!g++ % -o %< -std=c++14"
        exec "!time ./%<"
    elseif &filetype == "sh"
        :!time bash %
    elseif &filetype == "python"
        exec "!time python %"
    elseif &filetype == "html"
        exec "!time firefox % &"
        "elseif &filetype == "go"
        "    exec "!time go build %<"
        "    exec "!time ./%<"
    elseif &filetype == "javascript"
        exec "!node %<"
    elseif &filetype == "lua"
        exec "!time lua %"
    elseif &filetype == "qml"
        exec "!time qmlscene %"
    endif
endfunc

map <F3> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
nnoremap <C-h> :Autoformat<CR>
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap U <C-r>

autocmd vimenter * Tagbar
"autocmd vimenter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

map <C-w> <C-w>w
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
noremap k gk
noremap gk k
noremap j gj
noremap gj j
noremap H ^
noremap L $

cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap kj <Esc>

let mapleader=','
let g:mapleader=','

"Plugin List
packadd L9
packadd YouCompleteMe
packadd auto-pairs
packadd ctrlp.vim
packadd molokai
packadd nerdtree
packadd nerdcommenter
packadd indentLine
packadd rainbow_parentheses.vim
packadd supertab
packadd syntastic
packadd tagbar
packadd vim-airline
packadd vim-airline-themes
packadd tabular
packadd tlib_vim
packadd ultisnips
packadd vim-addon-mw-utils
packadd vim-autoclose
packadd vim-autoformat
packadd vim-easymotion
packadd vim-fugitive
packadd vim-snipmate
packadd vim-snippets
packadd vim-surround
packadd vimproc.vim
packadd emmet-vim
packadd sparkup
packadd vim-instant-markdown
packadd vim-markdown
packadd vim-qml
packadd vim-yapf
packadd xmledit
packadd vim-coloresque
packadd vim-closetag
" packadd MatchTagAlways
packadd vim-jsbeautify
packadd gundo.vim
packadd tern_for_vim
packadd vim-multiple-cursors

let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_theme="powerlineish"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:indentLine_leadingSpaceEnabled = 1

set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
inoremap <expr> <C-n>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-p>       pumvisible() ? "\<C-p>" : "\<Up>"

let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_semantic_triggers = {
            \   'javascript': ['.', 're!(?=[a-zA-Z]{3,4})'],
            \   'css': [ 're!^\s{2,4}', 're!:\s+'   ],
            \   'html': [ '</'  ],
            \}
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
let g:ycm_server_keep_logfiles=1
let g:ycm_server_log_level = 'debug'
let g:ycm_show_diagnostics_ui = 0

let g:tagbar_ctags_bin="/usr/bin/ctags"
let g:tagbat_autofocus=1

scriptencoding utf-8 
let g:yapf_style = "google" 
nnoremap <Leader>y :call Yapf()<cr>

let g:UltiSnipsExpandTrigger="<C-c>"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
let g:syntastic_check_on_open=1     " 打开文件时即开启语法检查
let g:syntastic_check_on_wq=0       " 保存时进行语法检查
let g:syntastic_enable_highlighting=1   " 提示内容高亮显示
let g:syntastic_python_checkers=['pyflakes', 'pep8']
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = '-std=c++14'
let g:syntastic_cpp_check_header = 1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "lacks \"action", "is not recognized!", "discarding unexpected"]

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

let NERDTreeIgnore=['\.pyc$','\.pyo$','\.o$','\.so$','\.egg$'] "忽略文件
let g:NERDTrimTrailingWhitespace = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'   }   }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

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

let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
            \ ]
            \ }
let g:vim_markdown_folding_disabled = 1
let g:instant_markdown_autostart = 0

syntax on

set background=dark
colorscheme molokai
let g:molokai_original=1
let g:rehash256=1

