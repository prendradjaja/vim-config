set guioptions=i

" GUI save and open
nnoremap <M-w> :browse write<CR>
nnoremap <M-e> :browse edit<CR>

" Alt-arrows for resize font
if  has("gui_running") && (has("win32") || has("win64"))
  nnoremap <silent> <M-Up> :call SizeUp()<CR>
  nnoremap <silent> <M-Down> :call SizeDown()<CR>
  inoremap <silent> <M-Up> <C-O>:call SizeUp()<CR>
  inoremap <silent> <M-Down> <C-O>:call SizeDown()<CR>
endif

function! SizeUp()
  let &guifont=substitute(&guifont, ':h\zs\d\+', '\=submatch(0)+1', '')
  call ResizeWindow()
  " set guifont
endfunction

function! SizeDown()
  let &guifont=substitute(&guifont, ':h\zs\d\+', '\=max([submatch(0)-1,1])', '')
  call ResizeWindow()
  " set guifont
endfunction

function! ResizeWindow()
  if &guifont=='Consolas:h1'
    set lines=174 columns=646
  endif
  if &guifont=='Consolas:h2'
    set lines=139 columns=323
  endif
  if &guifont=='Consolas:h3'
    set lines=116 columns=323
  endif
  if &guifont=='Consolas:h4'
    set lines=99 columns=215
  endif
  if &guifont=='Consolas:h5'
    set lines=77 columns=161
  endif
  if &guifont=='Consolas:h6'
    set lines=69 columns=161
  endif
  if &guifont=='Consolas:h7'
    set lines=63 columns=129
  endif
  if &guifont=='Consolas:h8'
    set lines=49 columns=107
  endif
  if &guifont=='Consolas:h9'
    set lines=46 columns=92
  endif
  if &guifont=='Consolas:h10'
    set lines=43 columns=92
  endif
  if &guifont=='Consolas:h11'
    set lines=36 columns=80
  endif
  if &guifont=='Consolas:h12'
    set lines=34 columns=71
  endif
  if &guifont=='Consolas:h13'
    set lines=33 columns=71
  endif
  if &guifont=='Consolas:h14'
    set lines=30 columns=64
  endif
  if &guifont=='Consolas:h15'
    set lines=29 columns=58
  endif
  if &guifont=='Consolas:h16'
    set lines=27 columns=53
  endif
  if &guifont=='Consolas:h17'
    set lines=24 columns=49
  endif
  if &guifont=='Consolas:h18'
    set lines=24 columns=49
  endif
  if &guifont=='Consolas:h19'
    set lines=23 columns=46
  endif
  if &guifont=='Consolas:h20'
    set lines=21 columns=43
  endif
  if &guifont=='Consolas:h21'
    set lines=20 columns=43
  endif
  if &guifont=='Consolas:h22'
    set lines=19 columns=40
  endif
  if &guifont=='Consolas:h23'
    set lines=18 columns=38
  endif
  if &guifont=='Consolas:h24'
    set lines=18 columns=35
  endif
  if &guifont=='Consolas:h25'
    set lines=17 columns=35
  endif
  if &guifont=='Consolas:h26'
    set lines=16 columns=34
  endif
  if &guifont=='Consolas:h27'
    set lines=16 columns=32
  endif
  if &guifont=='Consolas:h28'
    set lines=15 columns=32
  endif
  winpos 683 0
endfunction

function! BigFont()
  let &guifont='Consolas:h28'
  set lines=15 columns=32
  winpos 683 0
  set nonumber
  set norelativenumber
  set laststatus=0
  set noruler
endfunction

command! BigFont call BigFont()

runtime local-gui.vim
