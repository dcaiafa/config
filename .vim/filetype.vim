" my filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au BufNewFile,BufRead *.cc setf cpp
augroup END
