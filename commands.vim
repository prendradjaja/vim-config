" Some useful general-purpose commands

" Math: Sum and Eval
command! -range=% Sum call Sum(<line1>, <line2>)
command! -range Eval call EvalRange(<line1>, <line2>)

" Reverse
command! -range Reverse call Reverse(<line1>, <line2>)

" Dummy text: Range
command! -nargs=1 Range call append(line('.'), range(1, <args>))



" *** Implement complex behavior below this line *************************** "

function! Sum(start, end)
  execute a:start . "," . (a:end-1) . "normal A+"
  execute a:start . "," . a:end . "join"
  Eval
endfunction

function! EvalRange(start, end)
  execute a:start . "," . a:end . " g/./call EvalLine()"
endfunction

function! EvalLine()
  normal! 0D
  put =eval(@\")
  -1 delete _
endfunction

function! Reverse(start, end)
  let top=a:start-1
  execute a:start . "," . a:end . " g/^/m" . top
endfunction
