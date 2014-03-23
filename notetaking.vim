" For note-taking and prose

vnoremap <Leader>dr omaOmbomcOmd`br-`c`dr-k`ajr<Bar>`bj`dkr<Bar>
"nnoremap <M-b> :call ToggleBullet()<CR>
"nnoremap <Leader>lc ma0vw2hr:`a
"nnoremap <Leader>le ma0vw2hr=`a
"nnoremap <Leader>lo ma0vw2hr `a
inoremap <C-Space><C-b> <Esc>:call ToggleBullet()<CR>:startinsert!<CR>
nnoremap <Leader>wa :set formatoptions+=a<CR>:set formatoptions?<CR>
nnoremap <Leader>wo :set formatoptions-=a<CR>:set formatoptions?<CR>
nnoremap <Leader>wy :set formatoptions-=a<CR>:SoftWrap<CR>:set formatoptions+=a<CR>ggvG$"+yu
nnoremap <Leader>mu Ypv$r-
inoremap <C-Space>u <Esc>Ypv$r-o  - 
nnoremap <Leader>mU gUUYpv$r=
nnoremap <Leader>r :so abbr.vim<cr>
vnoremap <Leader>c. <Esc>'>0v'<hhh<C-v>r.
" [e]mphasize [b]racketed
nnoremap <Leader>eb :set hlsearch<CR>/<\(.\<Bar>\n\)\{-}><CR>
" newline with bullets. [o]pen [b]ullet
inoremap <C-Space><C-M> <C-M>- 
nnoremap <Leader>ob o- 
nnoremap <Leader>Ob O- 
nnoremap <Leader>OB O- 
nnoremap <Leader>oB O- 
" [c]hange paren to [c]omma, because i overuse parentheses
nnoremap <Leader>cc va(<Esc>r,`<xhi,<Esc>
" indent bullets
inoremap <C-Space><C-T> <C-O>>><End>
inoremap <C-Space><C-D> <C-O><<<End>

function! CopyAndOpenPaint(name)
  let filename = a:name . ".png"
  execute "silent !copy C:\\Users\\Pandu\\Dropbox\\canvas.png " . filename
    \ . " && start mspaint " . filename
endfunction
command! -nargs=1 Paint call CopyAndOpenPaint("<args>")
nnoremap <Leader>op :Paint 

command! -range=% SoftWrap
            \ <line2>put _ |
            \ <line1>,<line2>g/.\+/ .;-/^$/ join |normal $x

function! ToggleBullet()
  normal _
  if CurrChar() == '-'
    normal r 
  else
    normal 2hr-
  endif
endfunction

function! CurrChar()
  let char = getline('.')[col('.') - 1]
  return char
endfunction

