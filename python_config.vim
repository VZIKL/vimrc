packadd vim-yapf
scriptencoding utf-8
let g:yapf_style = "google"

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let b:ale_warn_about_trailing_whitespace = 0

nnoremap <Leader>y :call Yapf()<cr>
