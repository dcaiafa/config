set runtimepath+=~/config/nvim

set autoread
set backspace=indent,eol,start
"set colorcolumn=+0
set completeopt=menu,preview,menuone
set expandtab
set formatoptions=cq
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

" Swap files are annoying. Save often.
set noswapfile 

" Disable beeps
set vb t_vb=

let g:go_textobj_include_function_doc = 1

if has('nvim')
	set termguicolors
  set ttimeout
  set ttimeoutlen=0

  let g:terminal_color_0  = '#2e3436'
  let g:terminal_color_1  = '#cc0000'
  let g:terminal_color_2  = '#4e9a06'
  let g:terminal_color_3  = '#c4a000'
  let g:terminal_color_4  = '#3465a4'
  let g:terminal_color_5  = '#75507b'
  let g:terminal_color_6  = '#0b939b'
  let g:terminal_color_7  = '#d3d7cf'
  let g:terminal_color_8  = '#555753'
  let g:terminal_color_9  = '#ef2929'
  let g:terminal_color_10 = '#8ae234'
  let g:terminal_color_11 = '#fce94f'
  let g:terminal_color_12 = '#729fcf'
  let g:terminal_color_13 = '#ad7fa8'
  let g:terminal_color_14 = '#00f5e9'
  let g:terminal_color_15 = '#eeeeec'
endif

if has("gui_running") && has('windows')
  set guifont=Consolas:h12:cANSI

  " Maximize windows on start-up if in diff mode.
  if &diff
    au GUIEnter * simalt ~x  
  endif
endif

syntax on
filetype plugin indent on

call plug#begin('~/.nvim/plugged')

Plug 'fatih/vim-go', { 'tag': 'v1.9' }
Plug 'fatih/molokai'
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nsf/gocode', { 'rtp': 'vim' }
Plug 'tpope/vim-fugitive'
Plug 'ekalinin/Dockerfile.vim'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

call plug#end()

"color molokai
color solarized

let g:bufExplorerDefaultHelp=0

noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

noremap <S-Up> :cprev<CR>
noremap <S-Down> :cnext<CR>

noremap <TAB> :b#<CR>
noremap ,s :nohlsearch<CR>
noremap ,n :nohlsearch<CR>
noremap ,s :set spell!<CR>
noremap ,w :w<CR>
noremap ,h :ToggleHeader<CR>
noremap ,, :tabprev<CR>
noremap ,. :tabnext<CR>

noremap <F2> :call <SID>OpenTerminal(1)<CR>
noremap <F3> :call <SID>OpenTerminal(2)<CR>
noremap <F4> :call <SID>OpenTerminal(3)<CR>
noremap <F5> :call <SID>OpenTerminal(4)<CR>
noremap <F9> :call <SID>ToggleBackground()<CR>
noremap <F10> :BufExplorer<CR>

inoremap <F2> <ESC>:call <SID>OpenTerminal(1)<CR>
inoremap <F3> <ESC>:call <SID>OpenTerminal(2)<CR>
inoremap <F4> <ESC>:call <SID>OpenTerminal(3)<CR>
inoremap <F5> <ESC>:call <SID>OpenTerminal(4)<CR>
inoremap <F9> <ESC>:call <SID>ToggleBackground()<CR>
inoremap <F10> :BufExplorer<CR>

au FileType go nmap ,b :wall<CR><Plug>(go-build)
au FileType go nmap ,gt :wall<CR><Plug>(go-test)
au FileType go nmap ,gr :wall<CR><Plug>(go-rename)
au FileType go nmap ,gi :wall<CR>:GoImports<CR>
au FileType go nmap ,ga :wall<CR>:GoAlternate<CR>
au FileType go nmap ,gd :wall<CR>:GoDeclsDir<CR>
au FileType go nmap ,go :wall<CR>:GoDoc<CR>

if has('nvim')
  tnoremap <ESC><ESC> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  tnoremap <C-v>a <C-\><C-n>"aPi
  tnoremap <C-v>b <C-\><C-n>"bPi
  tnoremap <C-v>c <C-\><C-n>"cPi
  tnoremap <C-v>d <C-\><C-n>"dPi

  tnoremap <F2> <C-\><C-n>:call <SID>OpenTerminal(1)<CR>
  tnoremap <F3> <C-\><C-n>:call <SID>OpenTerminal(2)<CR>
  tnoremap <F4> <C-\><C-n>:call <SID>OpenTerminal(3)<CR>
  tnoremap <F5> <C-\><C-n>:call <SID>OpenTerminal(4)<CR>
  tnoremap <F9> <C-\><C-n>:call <SID>ToggleBackground()<CR>
  tnoremap <F10> <C-\><C-n>:BufExplorer<CR>
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

function! s:OpenTerminal(i)
  let tn = "t" . a:i
  if !bufexists(tn)
    terminal
    execute "file " . tn
    return
  endif
  execute "buffer " . tn
  normal i
endfunction

function! s:SetupText()
  set formatoptions=
  noremap j gj
  noremap k gk
  set wrap
  set linebreak
  set norelativenumber
endfunction

func! s:ToggleBackground()
  if &background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction

command! Cdf :execute "cd " . expand("%:p:h")
command! ToggleHeader :call <SID>ToggleHeader()
command! SetupText :call <SID>SetupText()

augroup Daniel
  au! Daniel
augroup END

if has('nvim')
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
endif
