" Check if basic functionality works

" Force-load these files *before* loading a file, so that we test
" the version in development (not the one installed).
source vim/syntax/metamath.vim
source vim/ftdetect/metamath.vim

edit test.mm

echom "Starting test"

" cursor takes line, column
let junk = cursor(1, 4)
if synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") != 'Comment'
  throw 'Test failure: Comment'
endif

let junk = cursor(11, 4)
if synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") != 'Statement'
  throw 'Test failure: Statement'
endif

messages
quit
