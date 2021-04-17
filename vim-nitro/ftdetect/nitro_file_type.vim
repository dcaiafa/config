" We take care to preserve the user's fileencodings and fileformats,
" because those settings are global (not buffer local), yet we want
" to override them for loading nitro files, which should be UTF-8.
let s:current_fileformats = ''
let s:current_fileencodings = ''

" define fileencodings to open as utf-8 encoding even if it's ascii.
function! s:nitrofiletype_pre()
  let s:current_fileformats = &g:fileformats
  let s:current_fileencodings = &g:fileencodings
  set fileencodings=utf-8 fileformats=unix
  setlocal filetype=nitro tabstop=2 shiftwidth=2 expandtab
endfunction

" restore fileencodings as others
function! s:nitrofiletype_post()
  let &g:fileformats = s:current_fileformats
  let &g:fileencodings = s:current_fileencodings
endfunction

au BufNewFile *.n setlocal filetype=nitro fileencoding=utf-8 fileformat=unix tabstop=2 shiftwidth=2 expandtab
au BufRead *.n call s:nitrofiletype_pre()
au BufReadPost *.n call s:nitrofiletype_post()
