if filereadable('/usr/share/vim/google/google.vim')
  source /usr/share/vim/google/google.vim
endif

set runtimepath+=~/config/vim
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
set scrolloff=5
set showmatch
set completeopt=menuone

syntax on

if has("gui_running")
  set background=light
  color solarized
else
  color torte
  "hi Normal ctermbg=none
  "hi NonText ctermbg=none
  "hi LineNR ctermbg=none
endif

if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~? "darwin"
    if has("gui_running")
      set guifont=Menlo\ Regular:h14
    endif
  endif
endif

execute pathogen#infect()

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
  let @a = name
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
vnoremap S y:S<CR>

command! SetSourceRoot :let g:SourceRoot=getcwd()

function! s:InsertHeaderGuard()
  let path = expand("%:p")
  let components = []
  while !empty(path) && path != g:SourceRoot
    let component = fnamemodify(path, ":t")
    let component = substitute(component, "\\.", "_", "g")
    call add(components, component)
    let newpath = fnamemodify(path, ":h")
    if newpath == path
      break
    endif
    let path = newpath
  endwhile
  call reverse(components)

  let guard = ""
  for component in components
    if !empty(guard)
      let guard .= "_"
    endif
    let guard .= toupper(component)
  endfor
  let guard .= "_"

  let l = line(".")
  call append(l+0, "#ifndef " . guard)
  call append(l+1, "#define " . guard)
  call append(l+2, "#endif  // " . guard)
endfunction

command! InsertHeaderGuard :call <SID>InsertHeaderGuard()

cabbrev <expr> %% expand("%:p:h")

" Auto commands
augroup Daniel
  au!
  " au BufReadPost,FileChangedRO * let &modifiable=!(&readonly)
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
" noremap <C-K> :pyf /usr/lib/clang-format/clang-format.py<CR>
" inoremap <C-K><C-O> :pyf /usr/lib/clang-format/clang-format.py<CR>

noremap ,h :nohlsearch<CR>
noremap ,t :ToggleHeader<CR>
noremap <TAB> :b#<CR>
noremap ,n :PrintName<CR>
noremap ,s :set spell!<CR>
