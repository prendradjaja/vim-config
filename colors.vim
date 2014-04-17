function! Autumn()
  set t_Co=256
  set t_ut=
  color autumn
endfunction
command! Autumn call Autumn()

function! DefaultColors()
  set t_Co=8
  color default
endfunction
command! DefaultColors call DefaultColors()

Autumn
