syntax enable
syntax on
set background=dark
colorscheme gruvbox

filetype plugin indent on

" disable arrow keys
"cnoremap <Down> <Nop>
"cnoremap <Left> <Nop>
"cnoremap <Right> <Nop>
"cnoremap <Up> <Nop>
"
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>
"inoremap <Up> <Nop>
"
"nnoremap <Down> <Nop>
"nnoremap <Left> <Nop>
"nnoremap <Right> <Nop>
"nnoremap <Up> <Nop>

"vnoremap <Down> <Nop>
"vnoremap <Left> <Nop>
"vnoremap <Right> <Nop>
"vnoremap <Up> <Nop>

" map leader key to space
"nnoremap <SPACE> <Nop>
"let mapleader = " "

" pressing j and f together triggers <esc>
"   * only fj works for visual mode because we'd like to hold donw j
"   * timeoutlen is set to a small number so that only pressing f and j
"     together can trigger the mapping
set timeoutlen=1000
inoremap fj <esc>
inoremap jf <esc>
vnoremap fj <esc>
vnoremap jf <esc>

" let vim know that the termianl supports 256 colors
let &t_Co=256

" disable preset styles for certain filetypes
let g:python_recommended_style=0

set relativenumber
set number
set tabstop=2
set shiftwidth=2
set expandtab

" for insert mode, highlight current line
autocmd InsertEnter,InsertLeave * set cul!

" add a vertival line at column 80
set cc=100

"""" Key mappings """"
" Shift + TAB to remove tab in normal mode
nnoremap <S-Tab> <C-d>
" scroll more lines
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

" Keep cursor centered for search (n/N) and J
nnoremap n nzz
nnoremap N Nzzz
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
" Plug 'iamcco/markdown-preview.vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" better python syntax highlighting
Plug 'sheerun/vim-polyglot'

" fzf (requirs fzf to be installed)
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }

call plug#end()

""" source additional settings """
for f in split(glob('~/.vim/extra-plugins/*.vim'), '\n')
  exe 'source' f
endfor


