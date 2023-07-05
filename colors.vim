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

function! Solarized()
  set background=dark
  colorscheme solarized
endfunction
command! Solarized call Solarized()

if has('gui_running')
  " colorscheme 8-bit-autumn
  Solarized
else
  " Autumn
  DefaultColors
endif

" Some local (crunchbase-bertino) changes in vimrc
