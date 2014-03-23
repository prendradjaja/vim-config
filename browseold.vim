nnoremap <silent> <C-w><C-b> :BrowseOld<CR>
nnoremap <silent> <C-w>b :BrowseOld<CR>
command! BrowseOld call BrowseOld()
command! BR call BrowseOld()

function! BrowseOld()
  " Fill a new buffer with the contents of :oldfiles
  enew
  redir => fileinfo
  silent oldfiles
  redir END
  silent put=fileinfo
  global/^$/d
  % normal dW

  " Put help text at the top of the buffer. This is done in a slightly
  " convoluted way (instead of just :0read) so that the cursor can be placed
  " at the first filename without reference to the length of the text in
  " the 'browsetext' file
  "
  " Three assumptions are made about this text:
  " - It begins with the line 'Commands:'
  " - It consists of a single paragraph, ending with at least one whitespace
  "   line.
  " - It should accurately describe the mappings made below.
  read ~/.vim/browsetext
  .,$ move 0
  +1
  redraw
  set nomodified

  setlocal statusline=Browsing\ old\ files
  setlocal cursorline

  nnoremap <buffer> e Vgf
  nnoremap <buffer> i :call FilterAllLines('v')<CR>
  nnoremap <buffer> o :call FilterAllLines('g')<CR>
  nnoremap <buffer> s /.*.*<Left><Left>
endfunction

function! FilterAllLines(method)
  let pattern = input('Filter: ')
  if getline(1) ==# 'Commands:'
    1 normal dap
  endif

  execute a:method . '/' . pattern . '/d'
  set nomodified
  redraw

  1
endfunction
