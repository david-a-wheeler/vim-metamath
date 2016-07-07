" Check if basic functionality works

" Force-load these files *before* loading a file, so that we test
" the version in development (not the one installed).
source vim/syntax/metamath.vim
source vim/ftdetect/metamath.vim

edit test.mm

echom "Starting test"

function SpecificSyntaxName()
  return synIDattr(synID(line("."),col("."),0),"name")
endfunction

function MappedSyntaxName()
  return synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
endfunction

function MyMoveTo(line,column)
  let junk = cursor(a:line, a:column)
endfunction

function! RunATest(actual, expected, testid) abort
  if a:actual != a:expected
    echom 'Test failure: ' . a:testid
    cq
  endif
endfunction


call MyMoveTo(1,4)
call RunATest(SpecificSyntaxName(), 'metamathComment', 'Comment1')
call RunATest(MappedSyntaxName(), 'Comment', 'Comment2')

call MyMoveTo(11,4)
call RunATest(MappedSyntaxName(), 'Statement', 'Statement1')

messages
quit
