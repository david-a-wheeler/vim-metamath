" Check if basic functionality works

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add to 'runtimepath' the directory of the software under test.
let &runtimepath = printf('%s/vim,%s,%s/after', s:portable, &runtimepath, s:portable)

echo 'New runtimepath = ' . &runtimepath

" Force-load this *before* loading a file.
source vim/ftdetect/metamath.vim

edit test.mm

echo 'Starting test'

function SpecificSyntaxName()
  return synIDattr(synID(line('.'),col('.'),0),'name')
endfunction

function MappedSyntaxName()
  return synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')
endfunction

function MyMoveTo(line,column)
  let junk = cursor(a:line, a:column)
endfunction

function! RunATest(actual, expected, testid) abort
  if a:actual != a:expected
    echo 'Test failure: ' . a:testid
    echo 'Expected: ' . a:expected
    echo 'Actual: ' . a:actual
    cq
  endif
endfunction

" Did we detect the filetype correctly?
call RunATest(&filetype, 'metamath', 'Filetype')

" Did we detect a comment?
call MyMoveTo(1,4)
call RunATest(SpecificSyntaxName(), 'metamathComment', 'Comment1')
call RunATest(MappedSyntaxName(), 'Comment', 'Comment2')

" Did we detect a statement?
call MyMoveTo(11,4)
call RunATest(MappedSyntaxName(), 'Statement', 'Statement1')

quit
