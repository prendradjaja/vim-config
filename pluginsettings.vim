" Vertigo
nnoremap <silent> <Leader>h :<C-U>VertigoDown n<CR>
vnoremap <silent> <Leader>h :<C-U>VertigoDown v<CR>
onoremap <silent> <Leader>h :<C-U>VertigoDown o<CR>
nnoremap <silent> <Leader>t :<C-U>VertigoUp n<CR>
vnoremap <silent> <Leader>t :<C-U>VertigoUp v<CR>
onoremap <silent> <Leader>t :<C-U>VertigoUp o<CR>

let g:Vertigo_homerow = 'aoeuidhtns'
" let g:Vertigo_onedigit_method = 'smart4'

" TComment
call tcomment#DefineType('twoslashes', '// %s' )
nnoremap <C-_>/ :TCommentAs twoslashes<CR>
vnoremap <C-_>/ :TCommentAs twoslashes<CR>
nnoremap <Leader>_/ :TCommentAs twoslashes<CR>
vnoremap <Leader>_/ :TCommentAs twoslashes<CR>

" CtrlP
" nnoremap <C-E> :CtrlPBuffer<CR>
nnoremap <C-B> :CtrlPBuffer<CR>
nnoremap <C-W>b :CtrlPBuffer<CR>
nnoremap <C-W><C-B> :CtrlPBuffer<CR>
nnoremap <C-W>b :CtrlPBuffer<CR>
nnoremap <C-W><C-M> :CtrlPMRU<CR>
nnoremap <C-W>m :CtrlPMRU<CR>
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>', '<c-]>', '<c-h>'],
  \ 'PrtDelete()':          ['<del>'],
  \ 'PrtDeleteWord()':      ['<c-w>'],
  \ 'PrtClear()':           ['<c-u>'],
  \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
  \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
  \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
  \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
  \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
  \ 'PrtHistory(-1)':       ['<c-n>'],
  \ 'PrtHistory(1)':        ['<c-p>'],
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
  \ 'ToggleFocus()':        ['<s-tab>'],
  \ 'ToggleRegex()':        ['<c-r>'],
  \ 'ToggleByFname()':      ['<c-d>'],
  \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
  \ 'PrtExpandDir()':       ['<tab>'],
  \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
  \ 'PrtInsert()':          ['<c-\>'],
  \ 'PrtCurStart()':        ['<c-a>'],
  \ 'PrtCurEnd()':          ['<c-e>'],
  \ 'PrtCurLeft()':         ['<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-l>', '<right>'],
  \ 'PrtClearCache()':      ['<F5>'],
  \ 'PrtDeleteEnt()':       ['<F7>'],
  \ 'CreateNewFile()':      ['<c-y>'],
  \ 'MarkToOpen()':         ['<c-z>'],
  \ 'OpenMulti()':          ['<c-o>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
  \ }

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["custom-snippets", "UltiSnips"]

" Surround
let g:surround_no_mappings=1
nmap dr  <Plug>Dsurround
nmap cr  <Plug>Csurround
nmap yr  <Plug>Ysurround
nmap yR  <Plug>YSurround
nmap yrr <Plug>Yssurround
nmap yRr <Plug>YSsurround
nmap yRR <Plug>YSsurround
xmap R   <Plug>VSurround
xmap gR  <Plug>VgSurround
imap <C-S>  <Plug>Isurround
imap <C-G>s <Plug>Isurround
imap <C-G>S <Plug>ISurround

" typescript-tools
au BufRead,BufNewFile *.ts        setlocal filetype=typescript
set rtp+=/usr/local/lib/node_modules/typescript-tools

" RSI
" iunmap <C-D>

" detectindent
nnoremap <Leader>ia :DetectIndent<CR>

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Ordinary ga still available
nnoremap <Leader>ga ga
