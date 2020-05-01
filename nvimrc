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
set number
set relativenumber
set ruler
"set scrolloff=3
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set tabstop=2
set tags=./.localtags,./.tags,./../.tags,./../../.tags,./../../../.tags,./../../../../.tags,./../../../../../.tags,./../../../../../../.tags,./../../../../../../../.tags,./../../../../../../../../.tags,./../../../../../../../../../.tags,./../../../../../../../../../../.tags
set textwidth=80
set virtualedit=all
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmenu
set wildmode=longest:full,full
set wrap
set foldmethod=syntax
set foldlevelstart=99
set cino=l1,g1,h1,N-s,i2s,+2s,(0,u0,U1,W4,m1,:0
set conceallevel=0
set noshowmode

let g:ctrlp_custom_ignore = '\vvendor\/|third_party\/'

" Swap files are annoying. Save often.
set noswapfile 

" Disable beeps
set vb t_vb=

let mapleader = '\'

let g:go_echo_go_info = 1
let g:go_textobj_include_function_doc = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_rename_command = 'gopls'

" Prevent vim-go plugin from "auto-detecting" the wrong GOPATH.
let g:go_autodetect_gopath = 0

let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_filetype_blacklist = {
  \ 'go': 1,
  \}

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
    au Daniel GUIEnter * simalt ~x  
  endif
endif

syntax on
filetype plugin indent on

let g:bufExplorerDefaultHelp=0

call plug#begin('~/.nvim/plugged')

Plug 'digitaltoad/vim-pug'
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/molokai'
"Plug 'fatih/vim-go', { 'commit': '007b69c27b63fbcbe2e0766073b09281274b0231' }
Plug 'fatih/vim-go', { 'tag': 'v1.22' }
Plug 'jlanzarotta/bufexplorer'
Plug 'leafgarland/typescript-vim'
Plug 'ngg/vim-gn'
Plug 'posva/vim-vue'
Plug 'rhysd/vim-clang-format'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'NLKNguyen/papercolor-theme'
Plug 'hashivim/vim-terraform'
Plug 'Valloric/YouCompleteMe'
Plug 'lepture/vim-jinja'

call plug#end()

"set t_Co=256
"let g:rehash256=1
"set background=dark
"let g:molokai_original=1
"color molokai

set t_Co=256
set background=dark
color PaperColor

noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l

noremap <S-Up> :cprev<CR>
noremap <S-Down> :cnext<CR>

noremap <TAB> :b#<CR>
noremap ,n :nohlsearch<CR>
noremap ,s :setlocal spell!<CR>
noremap ,w :w<CR>
noremap ,h :ToggleHeader<CR>
noremap ,, :tabprev<CR>
noremap ,. :tabnext<CR>
noremap ,cf :call <SID>CopyFilename()<CR>

noremap <F2> :call <SID>OpenTerminal(2)<CR>
noremap <F3> :call <SID>OpenTerminal(3)<CR>
noremap <F4> :call <SID>OpenTerminal(4)<CR>
noremap <F5> :call <SID>OpenTerminal(5)<CR>
noremap <F6> :call <SID>OpenTerminal(5)<CR>
noremap <F9> :call go#lsp#Restart()<CR>
noremap <F10> :BufExplorer<CR>

inoremap <F2> <ESC>:call <SID>OpenTerminal(2)<CR>
inoremap <F3> <ESC>:call <SID>OpenTerminal(3)<CR>
inoremap <F4> <ESC>:call <SID>OpenTerminal(4)<CR>
inoremap <F5> <ESC>:call <SID>OpenTerminal(5)<CR>
inoremap <F6> <ESC>:call <SID>OpenTerminal(6)<CR>
inoremap <F10> :BufExplorer<CR>

au FileType go nmap ,b :wall<CR><Plug>(go-build)
au FileType go nmap ,gtt :wall<CR><Plug>(go-test)
au FileType go nmap ,gtf :wall<CR><Plug>(go-test-func)
au FileType go nmap ,gr :wall<CR><Plug>(go-rename)
au FileType go nmap ,gi :wall<CR>:GoImports<CR>
au FileType go nmap ,ga :wall<CR>:GoAlternate<CR>
au FileType go nmap ,gd :wall<CR>:GoDeclsDir<CR>
au FileType go nmap ,go :wall<CR>:GoDoc<CR>

au FileType c,cpp nmap ,gd :YcmCompleter GoToDeclaration<CR>
au FileType c,cpp nmap ,fi :YcmCompleter FixIt<CR>

"au FileType c,cpp ClangFormatAutoEnable

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
  tnoremap <C-v>+ <C-\><C-n>"+Pi

  tnoremap <F2> <C-\><C-n>:call <SID>OpenTerminal(2)<CR>
  tnoremap <F3> <C-\><C-n>:call <SID>OpenTerminal(3)<CR>
  tnoremap <F4> <C-\><C-n>:call <SID>OpenTerminal(4)<CR>
  tnoremap <F5> <C-\><C-n>:call <SID>OpenTerminal(5)<CR>
  tnoremap <F6> <C-\><C-n>:call <SID>OpenTerminal(6)<CR>
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
    normal i
    return
  endif
  execute "buffer " . tn
  "  split
  "close
  "vsplit
  "close
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

function! s:CopyFilename()
  let @d=expand('%:p')
  echo @d
endfunction

command! Cdf :execute "cd " . expand("%:p:h")
command! ToggleHeader :call <SID>ToggleHeader()
command! SetupText :call <SID>SetupText()

" Helper for searching things that have characters that would need to be
" escaped.
command! -nargs=1 Ss let @/ = escape(<q-args>, '/')|normal! /<C-R>/<CR>

augroup Daniel
  au! Daniel
augroup END

if has('nvim')
    " Terminal settings
    function! s:SetupTerminal()
      "au Daniel BufEnter <buffer> call <SID>OnEnterTerminal()
      setlocal nonumber
      setlocal relativenumber
      setlocal isk=@,48-57,_,192-255,#,.,-,/
    endfunction

    au Daniel TermOpen * call <SID>SetupTerminal()

    "function! s:OnEnterTerminal()
    "  if !&insertmode
    "    normal i
    "  endif
    "endfunction
endif

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'Fira Code 16')
endif

"=====================================================
"===================== STATUSLINE ====================
"Copied from https://github.com/fatih/dotfiles/blob/master/vimrc

 let s:modes = {
      \ 'n': 'NORMAL', 
      \ 'i': 'INSERT', 
      \ 'R': 'REPLACE', 
      \ 'v': 'VISUAL', 
      \ 'V': 'V-LINE', 
      \ "\<C-v>": 'V-BLOCK',
      \ 'c': 'COMMAND',
      \ 's': 'SELECT', 
      \ 'S': 'S-LINE', 
      \ "\<C-s>": 'S-BLOCK', 
      \ 't': 'TERMINAL'
      \}

let s:prev_mode = ""
function! StatusLineMode()
  let cur_mode = get(s:modes, mode(), '')

  " do not update higlight if the mode is the same
  if cur_mode == s:prev_mode
    return cur_mode
  endif

  if cur_mode == "NORMAL"
    exe 'hi! StatusLine ctermfg=236 guifg=236 guibg=#3E3D32'
    exe 'hi! myModeColor cterm=bold ctermbg=148 ctermfg=22 guibg=#FFE792 guifg=#000000 gui=bold'
  elseif cur_mode == "INSERT"
    exe 'hi! myModeColor cterm=bold ctermbg=23 ctermfg=231'
  elseif cur_mode == "VISUAL" || cur_mode == "V-LINE" || cur_mode == "V_BLOCK"
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor cterm=bold ctermbg=208 ctermfg=88'
  endif

  let s:prev_mode = cur_mode
  return cur_mode
endfunction

function! StatusLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! StatusLinePercent()
  return (100 * line('.') / line('$')) . '%'
endfunction

function! StatusLineLeftInfo()
 let branch = fugitive#head()
 let filename = '' != expand('%:t') ? expand('%:t') : '[No Name]'
 let changed = getbufinfo('%')[0]['changed'] ? ' *' : ''
 let filename = filename . changed
 if branch !=# ''
   return printf("%s | %s", branch, filename)
 endif
 return filename
endfunction

exe 'hi! myInfoColor ctermbg=240 ctermfg=252'

" start building our statusline
set statusline=

" mode with custom colors
set statusline+=%#myModeColor#
set statusline+=%{StatusLineMode()}               
set statusline+=%*

" left information bar (after mode)
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineLeftInfo()}
set statusline+=\ %*

" go command status (requires vim-go)
set statusline+=%#goStatuslineColor#
set statusline+=%{go#statusline#Show()}
set statusline+=%*

" right section seperator
set statusline+=%=

" filetype, percentage, line number and column number
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineFiletype()}\ %{StatusLinePercent()}\ %l:%v
set statusline+=\ %*
