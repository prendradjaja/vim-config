" Vertigo
nnoremap <silent> <Leader>h :<C-U>VertigoDown n<CR>
vnoremap <silent> <Leader>h :<C-U>VertigoDown v<CR>
onoremap <silent> <Leader>h :<C-U>VertigoDown o<CR>
nnoremap <silent> <Leader>t :<C-U>VertigoUp n<CR>
vnoremap <silent> <Leader>t :<C-U>VertigoUp v<CR>
onoremap <silent> <Leader>t :<C-U>VertigoUp o<CR>

let g:Vertigo_homerow = 'aoeuidhtns'
let g:Vertigo_onedigit_method = 'smart4'

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

" Submode
let g:submode_timeoutlen = 3000

call submode#enter_with('ge', 'n', '', 'ge', 'ge')
call submode#enter_with('ge', 'n', '', 'gE', 'gE')
call submode#map('ge', 'n', '', 'e', 'ge')
call submode#map('ge', 'n', '', 'l', 'e')
call submode#map('ge', 'n', '', 'E', 'gE')
call submode#map('ge', 'n', '', 'L', 'E')

call submode#enter_with('wrap-scroll', 'n', '', 'zl', 'zl')
call submode#enter_with('wrap-scroll', 'n', '', 'zh', 'zh')
call submode#enter_with('wrap-scroll', 'n', '', 'z<c-l>', '5zl')
call submode#enter_with('wrap-scroll', 'n', '', 'z<c-h>', '5zh')
call submode#enter_with('wrap-scroll', 'n', '', 'zL', 'zL')
call submode#enter_with('wrap-scroll', 'n', '', 'zH', 'zH')
call submode#map('wrap-scroll', 'n', '', 'l', 'zl')
call submode#map('wrap-scroll', 'n', '', 'h', 'zh')
call submode#map('wrap-scroll', 'n', '', '<c-l>', '5zl')
call submode#map('wrap-scroll', 'n', '', '<c-h>', '5zh')
call submode#map('wrap-scroll', 'n', '', 'L', 'zL')
call submode#map('wrap-scroll', 'n', '', 'H', 'zH')

call submode#enter_with('section-nav', 'n', '', ']]', ']]zt')
call submode#enter_with('section-nav', 'n', '', '[[', '[[zt')
call submode#map('section-nav', 'n', '', ']', ']]zt')
call submode#map('section-nav', 'n', '', '[', '[[zt')

call submode#enter_with('resize-window', 'n', '', '<c-w>-', '<c-w>-')
call submode#enter_with('resize-window', 'n', '', '<c-w>+', '<c-w>+')
call submode#map('resize-window', 'n', '', '-', '<c-w>-')
call submode#map('resize-window', 'n', '', '+', '<c-w>+')
