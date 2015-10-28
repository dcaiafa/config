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
set expandtab
set tabstop=2
set shiftwidth=0
set completeopt=menu,preview,menuone

if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

set t_co=256

syntax on
filetype plugin indent on

call plug#begin('~/.nvim/plugged')

Plug 'fatih/vim-go'
Plug 'jlanzarotta/bufexplorer'
Plug 'nsf/gocode', { 'rtp': 'vim' }
Plug 'tpope/vim-fugitive'

call plug#end()

color desert

command! Cdf :execute "cd " . expand("%:p:h")

let g:bufExplorerDefaultHelp=0

noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>

noremap <TAB> :b#<CR>
noremap ,h :nohlsearch<CR>
noremap ,s :set spell!<CR>
noremap ,w :wq<CR>
noremap ,th :tabprev<CR>
noremap ,tl :tabnext<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-v>a <C-\><C-n>"aPi
tnoremap <C-v>b <C-\><C-n>"bPi
tnoremap <C-v>c <C-\><C-n>"cPi
tnoremap <C-v>d <C-\><C-n>"dPi

cabbrev <expr> %% expand("%:p:h")
