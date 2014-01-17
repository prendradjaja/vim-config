nnoremap <silent> <C-w><C-b> :BrowseOld<CR>
command! BrowseOld call BrowseOld()
command! BR call BrowseOld()

function! BrowseOld()
  enew

  redir => fileinfo
  silent oldfiles
  redir END
  silent put=fileinfo
  global/^$/d
  % normal dW

  call WriteBrowseMessage()
  set nomodified
  setlocal statusline=Browsing\ old\ files
  setlocal cursorline

  nnoremap <buffer> <silent> <C-m> Vgf
  nnoremap <buffer> <C-s> :call FilterAllLines('v')<CR>
  nnoremap <buffer> <C-v> :call FilterAllLines('g')<CR>
endfunction

let s:browsemsg = "
\Press CTRL-M to go to a file\n
\      CTRL-S to filter\n
\      CTRL-V to filter out\n
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
