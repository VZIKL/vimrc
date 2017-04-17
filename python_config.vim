packadd vim-yapf
scriptencoding utf-8
let g:yapf_style = "google"
nnoremap <Leader>y :call Yapf()<cr>

let g:syntastic_python_checkers=['pyflakes', 'pep8']
