packadd indentLine
packadd nerdtree
packadd tagbar
packadd vim-airline
packadd vim-airline-themes

map <F3> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

autocmd vimenter * Tagbar
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" let g:indentLine_leadingSpaceEnabled = 1

let g:tagbar_ctags_bin="/usr/bin/ctags"
let g:tagbat_autofocus=1

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
