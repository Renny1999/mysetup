syntax enable
syntax on

set background=dark
colorscheme solarized

filetype plugin indent on

set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab

" scroll more lines
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" always show file name
set laststatus=2
set statusline+=%F


command! Vb normal! <C-v>

call plug#begin('~/.vim/plugged')

call plug#end()
