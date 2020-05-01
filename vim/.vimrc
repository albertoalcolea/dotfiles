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

" Multicursor for vim
Plug 'terryma/vim-multiple-cursors'

" fzf fuzzy finder wrapper for vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all', 'on': 'FZF' }
Plug 'junegunn/fzf.vim'

" Class outline viewer for Vim
Plug 'majutsushi/tagbar',  { 'on': 'TagbarToggle' }

" Atom Dark colorscheme
Plug 'gosukiwi/vim-atom-dark'

" Support for editorconfig global file
Plug 'editorconfig/editorconfig-vim'

" Initialize plugin system
call plug#end()

" NERDTree config
let NERDTreeIgnore=['.git$', '\.pyc$', '\.orig$']
let NERDTreeShowHidden=1

" EditorConfig default core is super slow compared with the core written in c
let g:EditorConfig_exec_path='/usr/bin/editorconfig'
let g:EditorConfig_core_mode='external_command'


" === GENERAL ===

" Color
syntax enable           " Enable syntax highlighting
colorscheme atom-dark-256

" Other settings
"set nowrap              " Do not split lines
set hlsearch            " Highlight searches
set number              " Show line number
set cursorline          " Highligh current line
set showmatch           " Show matching parenthesis
set nofoldenable        " Disable folding
set colorcolumn=120     " Ruler at 120 characters

" Clipboard
set clipboard=unnamed
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif


" === SHORTCUTS ===

let mapleader=","

map <C-x> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>

nmap <leader>t :TagbarToggle<CR>
nmap <leader>T :Tags<CR>
nmap <leader>b :call fzf#vim#tags(expand('<cword>'))<CR>
nmap <leader>p :Buffer<CR>
