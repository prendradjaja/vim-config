" Deal with some Cygwin-specific things

function! ToCygwinPath()
  " Turn paths like this
  " C:\Users\Pandu\Dropbox\
  " Into paths like this
  " /cygdrive/c/Users/Pandu/Dropbox/
  " Not quite complete -- doesn't work for paths containing parens and other
  " weird things
  s,\\,/,g
  s,C:/,/cygdrive/c/
  s/ /\\ /ge
endfunction
command! ToCygwinPath call ToCygwinPath()

function! CygwinPipe(mode)
  if a:mode ==# 'v'
    normal! gv
    let range="'<,'>"
  elseif a:mode ==# 'n'
    let range="%"
  endif
  let promptstr = "cygwin> " . range . "!"
  let program=input(promptstr)
  if program ==# ''
    return | endif
  let binpath="C:/cygwin/bin/"
  exe range . "!" . binpath . program
endfunction

" [C]ygwin [p]ipe
nnoremap <Leader>cp :call CygwinPipe('n')<CR>
vnoremap <Leader>cp :<C-U>call CygwinPipe('v')<CR>
