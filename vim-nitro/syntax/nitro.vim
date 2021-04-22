" nitro.vim: Vim syntax file for Nitro.
"
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case match

syn region nitroBlock        start="{" end="}" transparent fold

syn keyword nitroConditional  if else 
hi def link nitroConditional  Conditional

syn keyword nitroRepeat     for while
hi def link nitroRepeat     Repeat

syn keyword nitroException  try catch
hi def link nitroException  Exception

syn keyword nitroStatement  return defer
hi def link nitroStatement  Statement

syn keyword nitroKeyword    func var not meta 
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

syn keyword nitroLib avg
syn keyword nitroLib close
syn keyword nitroLib cp
syn keyword nitroLib create
syn keyword nitroLib createtemp
syn keyword nitroLib duration
syn keyword nitroLib durationto
syn keyword nitroLib exec
syn keyword nitroLib fileexists
syn keyword nitroLib filter
syn keyword nitroLib formattime
syn keyword nitroLib fromjson
syn keyword nitroLib hasprefix
syn keyword nitroLib in
syn keyword nitroLib isdir
syn keyword nitroLib lines
syn keyword nitroLib log
syn keyword nitroLib logf
syn keyword nitroLib ls
syn keyword nitroLib map
syn keyword nitroLib mapreduce
syn keyword nitroLib match
syn keyword nitroLib max
syn keyword nitroLib min
syn keyword nitroLib now
syn keyword nitroLib open
syn keyword nitroLib out
syn keyword nitroLib parsetime
syn keyword nitroLib pathbase
syn keyword nitroLib pathclean
syn keyword nitroLib pathdir
syn keyword nitroLib pathext
syn keyword nitroLib pathfromslash
syn keyword nitroLib pathjoin
syn keyword nitroLib popout
syn keyword nitroLib print
syn keyword nitroLib printall
syn keyword nitroLib printf
syn keyword nitroLib pushout
syn keyword nitroLib read
syn keyword nitroLib replace
syn keyword nitroLib rm
syn keyword nitroLib rmall
syn keyword nitroLib shuffle
syn keyword nitroLib skip
syn keyword nitroLib sort
syn keyword nitroLib split
syn keyword nitroLib sprintf
syn keyword nitroLib take
syn keyword nitroLib timefromunix
syn keyword nitroLib timetounix
syn keyword nitroLib timetounixnano
syn keyword nitroLib toarray
syn keyword nitroLib tojson
syn keyword nitroLib trim
syn keyword nitroLib unique
syn keyword nitroLib write

syn keyword nitroLib args
syn keyword nitroLib delete
syn keyword nitroLib has
syn keyword nitroLib len
syn keyword nitroLib narg
syn keyword nitroLib push
syn keyword nitroLib range

hi def link nitroLib Identifier

syn sync minlines=500

let b:current_syntax = "nitro"
