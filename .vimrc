if filereadable('/usr/share/vim/google/google.vim')
  source /usr/share/vim/google/google.vim
endif

set autoread
set backspace=indent,eol,start
set cino=l1g1h1N-si2s(0W2sj1J1+2s
set colorcolumn=+0
set completeopt=
set expandtab
set fo=tcqwa
set guioptions=ac
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:>-,trail:~
set nocompatible
set noequalalways
set nowritebackup
set path=.
set number
set relativenumber
set number
set ruler
set shiftwidth=2
set smartindent
set statusline=%<%f\ %h%m%r%=%-20.(%l/%L\ %c%V%)\ %P
set tabstop=2
set shiftwidth=2
set tags=./localtags,./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags,./../../../../../../../tags,./../../../../../../../../tags,./../../../../../../../../../tags,./../../../../../../../../../../tags
set textwidth=80
set virtualedit=all
set wrap
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildmode=list:longest,full
set scrolloff=20

" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

syntax on
set background=light
color solarized

if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ "^darwin"
    if has("gui_running")
      set guifont=Monaco:h13
    endif
  endif
endif


filetype plugin indent on

" Commands
command! Cdf :execute "cd " . expand("%:p:h")

function! s:ToggleHeader()
  let currentExtension = expand("%:e")
  if currentExtension ==? "h"
    let path = findfile(expand("%:t:r") . ".c")
    if path == ""
      let path = findfile(expand("%:t:r") . ".cc")
      if path == ""
        let path = findfile(expand("%:t:r") . ".cpp")
        if path == ""
          let path = findfile(expand("%:t:r") . ".m")
          if path == ""
            let path = findfile(expand("%:t:r") . ".mm")
          endif
        endif
      endif
    endif
  else
    let path = findfile(expand("%:t:r") . ".h")
  endif
  if path != ""
    execute "edit " . path
  endif
endfunction

command! ToggleHeader :call <SID>ToggleHeader()

function! s:PrintName()
  let name = expand("%:p")
  let @+ = name
  echo name
endfunction

command! PrintName :call <SID>PrintName()

function! s:UpdateLocalTags()
  let wd = getcwd()
  execute "cd " . expand("%:p:h")
  execute "!" . 'ctags --extra=+fq --exclude="_test.*" -o localtags *'
  execute "cd " . wd
endfunction

command! UpdateLocalTags :call <SID>UpdateLocalTags()

function! s:Setup()
  set columns=180
  set lines=62
  exe "normal \<c-w>="
endfunction

command! Setup :call <SID>Setup()

command! Noindent :setl noai nocin nosi inde=<CR>

function! s:ExactSearch()
  let @/=escape(@", './\*$^')
endfunction

command! S :call <SID>ExactSearch()

command! -nargs=+ F vim/\C<args>/ **/*.c **/*.cc **/*.h **/*.m **/*.mm | copen

cabbrev <expr> %% expand("%:p:h")

" Auto commands
augroup Daniel
  au!
  au BufWritePost,FileWritePost * %s/\s\+$//ge
augroup END

" Keyboard shortcuts
noremap <C-H> <C-W><C-H>
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-LEFT> :tabprev<CR>
noremap <C-RIGHT> :tabnext<CR>
noremap <C-UP> :copen\|cprevious<CR>
noremap <C-DOWN> :copen\|cnext<CR>
vnoremap <C-C> "+y
noremap <C-V> "+P
noremap! <C-V> <C-R>+

noremap ,h :nohlsearch<CR>
noremap ,t :ToggleHeader<CR>
noremap <TAB> :b#<CR>
noremap ,n :PrintName<CR>
noremap ,s :set spell!<CR>
