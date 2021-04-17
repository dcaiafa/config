" nitro.vim: Vim syntax file for Nitro.
"
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case match

syn region nitroBlock        start="{" end="}" transparent fold

syn keyword nitroConditional  if else end for while func try catch 
hi def link nitroConditional  Conditional

syn keyword nitroStatement  return defer
hi def link nitroStatement  Statement

syn keyword nitroKeyword    var not 
hi def link nitroKeyword    Keyword

syn keyword nitroBoolean    true false 
hi def link nitroBoolean    Boolean

syn region nitroComment     start="#" end="$"
hi def link nitroComment    Comment

syn region nitroString      start=+"+ skip=+\\"+ end=+"+
syn region nitroString      start="r\?`" end="`"
hi def link nitroString     String

syn match nitroDecimalInt   "\<-\=\(0\|[1-9]_\?\(\d\|\d\+_\?\d\+\)*\)\%([Ee][-+]\=\d\+\)\=\>"
hi def link nitroDecimalInt Number

syn match nitroFloat        "\<-\=\d\+\.\d*\%([Ee][-+]\=\d\+\)\=\>"
syn match nitroFloat        "\<-\=\.\d\+\%([Ee][-+]\=\d\+\)\=\>"
hi def link nitroFloat      Number


syn keyword nitroLib len range push has delete
syn keyword nitroLib close exec fcopy fcreate fcreatetemp filter flist fopen
syn keyword nitroLib fpathbase fpathclean fpathdir fpathfromslash fpathjoin
syn keyword nitroLib fpathjoin fremove fremoveall fromjson in lines map match
syn keyword nitroLib out popout print printall printf pushout readall sort split
syn keyword nitroLib sprintf toarray tojson yield
hi def link nitroLib Identifier

syn sync minlines=500

let b:current_syntax = "nitro"
