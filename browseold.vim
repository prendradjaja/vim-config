function! BrowseOld()
  enew
  % delete
  redir => message
  silent oldfiles
  redir END
  silent put=message
  global/^$/d
  % normal dW
  call WriteBrowseMessage()
  set nomodified
  call MakeBrowseMappings()
endfunction
command! BrowseOld call BrowseOld()
command! BR call BrowseOld()

function! MakeBrowseMappings()
  nnoremap <buffer> <silent> <C-m> Vgf
  nnoremap <buffer> <C-s> :call FilterAllLines('v')<CR>
  nnoremap <buffer> <C-v> :call FilterAllLines('g')<CR>
endfunction

let s:browsemsg = "
\Browsing old files\n
\------------------\n
\  Press: <C-m> to go to a file\n
\         <C-s> to filter\n
\         <C-v> to filter out\n
\\n"
function! WriteBrowseMessage()
  1 put! = s:browsemsg
  +1
endfunction

function! FilterAllLines(method)
  let instring = input('Filter: ')
  if instring != ''
    if getline(1) ==# split(s:browsemsg, '\n')[0]
      1 normal dap
    endif

    execute a:method . '/' . instring . '/d'
    set nomodified
    redraw
  endif
endfunction

nnoremap <silent> <C-w><C-b> :BrowseOld<CR>
