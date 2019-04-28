" === PLUGINS ===

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" A universal set of defaults that (hopefully) everyone can agree on
Plug 'tpope/vim-sensible'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'

" Syntastic is a syntax checking plugin that runs files through external syntax checkers
Plug 'vim-syntastic/syntastic'

" Multicursor for vim
Plug 'terryma/vim-multiple-cursors'

" Super searching with ctrl+p
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }

" Class outline viewer for Vim 
Plug 'majutsushi/tagbar'

" Atom Dark colorscheme
Plug 'gosukiwi/vim-atom-dark'

" Initialize plugin system
call plug#end()

" NERDTree config
let NERDTreeIgnore=['\.pyc$', '\.orig$']


" === GENERAL ===

syntax enable           " Enable syntax highlighting
colorscheme atom-dark-256

set tabstop=4           " numbers of spaces of tab character
set shiftwidth=4        " numbers of spaces to (auto)indent

"set wrap                " right border block
set hlsearch            " highlight searches
set number              " show line number
set cursorline          " highligh current line
set showmatch           " Show matching parenthesis
set nofoldenable        " disable folding

set fileencoding=utf-8  " UTF-8 by default
set encoding=utf-8



" === SHORTCUTS ===

let mapleader=","

map <C-x> :NERDTreeToggle<CR>
map <C-p> :CtrlP<CR>

nmap <leader>t :TagbarToggle<CR>

