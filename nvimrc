set runtimepath+=~/config/nvim

set hidden
set ignorecase
set nowritebackup
set number
set relativenumber
set ruler
set showmatch
set smartcase
set virtualedit=all

if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

set t_co=256

syntax on
filetype plugin indent on

call plug#begin('~/.nvim/plugged')

Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'

call plug#end()

color seoul256

command! Cdf :execute "cd " . expand("%:p:h")

let g:bufExplorerDefaultHelp=0

noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>

noremap <TAB> :b#<CR>
noremap ,h :nohlsearch<CR>
noremap ,s :set spell!<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
noremap <C-l> <C-w>l
