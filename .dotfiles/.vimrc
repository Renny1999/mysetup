syntax enable
syntax on

"set background=dark
colorscheme gruvbox

filetype plugin indent on

set relativenumber
set number
"set tabstop=2
"set shiftwidth=2
set tabstop=4
set shiftwidth=4
set expandtab

"""" Key mappings """"
" scroll more lines
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" Keep cursor centered for search (n/N) and J
nnoremap n nzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" set break points for undo
"   <c-g>u sets undo break point
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap <SPACE> <SPACE><c-g>u

" always show file name
set laststatus=2
set statusline+=%F

"Disable function highlighting (affects both C and C++ files)
"let g:cpp_function_highlight = 0

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1



command! Vb normal! <C-v>

call plug#begin('~/.vim/plugged')
" modern cpp syntax highlighting
Plug 'https://github.com/bfrg/vim-cpp-modern.git'
" airline (prettier vim status bar)
Plug 'https://github.com/vim-airline/vim-airline.git'
" better vim syntax highlighting
Plug 'https://github.com/justinmk/vim-syntax-extra.git'
" said to be the best colorscheme
Plug 'morhetz/gruvbox'
" real-time markdown
"   MarkdownPreview -> opens preview window
"   MarkdownPreviewStop -> closes preview window and server
Plug 'iamcco/markdown-preview.vim'
call plug#end()
