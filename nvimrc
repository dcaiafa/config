set runtimepath+=~/config/nvim

set autoread
set backspace=indent,eol,start
set colorcolumn=+0
set completeopt=menu,preview,menuone
set expandtab
set formatoptions=tcqwa
set guioptions=ac
set hidden
set hlsearch
set ignorecase
set incsearch
set nocompatible
set noequalalways
set nowritebackup
set nowritebackup
set number
set relativenumber
set ruler
set scrolloff=3
set shiftwidth=0
set showmatch
set smartcase
set smartindent
set tabstop=2
set tags=./localtags,./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags,./../../../../../../../tags,./../../../../../../../../tags,./../../../../../../../../../tags,./../../../../../../../../../../tags
set textwidth=80
set virtualedit=all
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=longest:full,full
set wrap

" Disable beeps
set vb t_vb=

let g:go_textobj_include_function_doc = 1

if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif
if has("gui_running")
  if has('windows')
    set guifont=Consolas:h10:cANSI
  endif
endif

set t_co=256

syntax on
filetype plugin indent on

call plug#begin('~/.nvim/plugged')

Plug 'fatih/vim-go'
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nsf/gocode', { 'rtp': 'vim' }
Plug 'tpope/vim-fugitive'

call plug#end()

color morning

let g:bufExplorerDefaultHelp=0

noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

noremap <S-Up> :lprev<CR>
noremap <S-Down> :lnext<CR>

noremap <TAB> :b#<CR>
noremap ,s :nohlsearch<CR>
noremap ,n :nohlsearch<CR>
noremap ,s :set spell!<CR>
noremap ,w :w<CR>
noremap ,th :tabprev<CR>
noremap ,tl :tabnext<CR>
noremap ,h :ToggleHeader<CR>
noremap ,, :tabprev<CR>
noremap ,. :tabnext<CR>

au FileType go nmap ,b :wall<CR><Plug>(go-build)
au FileType go nmap ,gt :wall<CR><Plug>(go-test)
au FileType go nmap ,gr :wall<CR><Plug>(go-rename)
au FileType go nmap ,gi :wall<CR>:GoImports<CR>
au FileType go nmap ,ga :wall<CR>:GoAlternate<CR>
au FileType go nmap ,gd :wall<CR>:GoDeclsDir<CR>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  tnoremap <C-v>a <C-\><C-n>"aPi
  tnoremap <C-v>b <C-\><C-n>"bPi
  tnoremap <C-v>c <C-\><C-n>"cPi
  tnoremap <C-v>d <C-\><C-n>"dPi
endif

cabbrev <expr> %% expand("%:p:h")

function! s:ToggleHeader()
  let cext = expand("%:e")
  if cext ==? "h"
    let exts = [ 'c', 'cc', 'cpp', 'm', 'mm', 'inl' ]
  else
    let exts = [ 'h' ]
  endif
  for ext in exts
    let path = findfile(expand("%:t:r") . "." . ext)
    if path != ""
      execute "edit " . path
      break
    endif
  endfor
endfunction

function! s:SetupText()
  set formatoptions=
  noremap j gj
  noremap k gk
  set wrap
  set linebreak
  set norelativenumber
endfunction

command! Cdf :execute "cd " . expand("%:p:h")
command! ToggleHeader :call <SID>ToggleHeader()
command! SetupText :call <SID>SetupText()

augroup Daniel
  au! Daniel
augroup END

" Terminal settings
function! s:SetupTerminal()
  au Daniel BufEnter <buffer> call <SID>OnEnterTerminal()
endfunction
au TermOpen * call <SID>SetupTerminal()

function! s:OnEnterTerminal()
  if !&insertmode
    normal i
  endif
endfunction
