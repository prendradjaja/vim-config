" This is really a fork of Vertigo. TODO merge the two MAYBE?
" https://github.com/prendradjaja/vim-vertigo
" Branched at 01595aef31100716e7a2c046fe201808036189a4

" Load user settings
if !exists('g:QuickOpen_homerow')
  let s:homerow = 'asdfghjkl;'
else
  let s:homerow = g:QuickOpen_homerow
endif

function! QuickOpen()
  call s:PromptAbsoluteJump('n')
endfunction
command! QuickOpen call QuickOpen()

function! s:PromptAbsoluteJump(mode)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"* ARGUMENTS: See Vertigo() for the description of 'mode'.
"* EFFECTS:
"    Prompts the user to jump to a specific line. After this function exits,
"    the cursor is moved. (if the user doesn't cancel)
"    Returns nothing.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let promptstr = 'Jump: '
  let lineno = ''

  let m = s:GetUserInput(promptstr)
  while m[0] == 1
    let lineno .= m[1]
    let m = s:GetUserInput(promptstr . lineno)
  endwhile

  if m[0] == 2
    exec lineno
  endif
endfunction

function! s:GetUserInput(promptstr)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"* ARGUMENTS:
"    promptstr:  A string to prompt the user for input. When first called,
"                this will be something like 'Jump: ', but after the user
"                enters a digit, this will be something like 'Jump: 3'. (to
"                simulate typing)
"* EFFECTS:
"    Prompts the user to jump. Only accepts input from the home row keys or ^C
"    or <Esc> to cancel.
"* RETURNS:
"    A list describing the user's input, as follows.
"    - [0] for canceling
"    - [1, n] for a digit
"    - [2] for completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  redraw
  echohl Question
  echo a:promptstr
  echohl None
  while 1
    let c = nr2char(getchar())
    if c == '' || c == ''
      return [0]
    elseif c == '' || c == ' '
      return [2]
    elseif has_key(s:keymap, c)
      return [1,
            \ s:keymap[c]]
    endif
    call s:BadInput(a:promptstr)
  endwhile
endfunction

" TODO only one dict now
" These dictionaries are used by GetUserInput() to turn home-row keys into
" numbers.
let s:keymap = {}
for i in range(0, 9)
  let s:keymap[s:homerow[i]] = (i+1)%10
endfor

let s:helpmsg = '(<Esc> or CTRL-C to cancel)'
function! s:BadInput(promptstr)
  redraw
  echohl Question
  if a:promptstr[len(a:promptstr)-1] == ' '
    echo a:promptstr . s:helpmsg
  else
    echo a:promptstr . ' ' . s:helpmsg
  endif
  echohl None
endfunction

function! s:DoJump(lines, motion, msg, mode)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"* ARGUMENTS:
"    lines:   How many lines to jump.
"    See Vertigo() for the descriptions of 'motion' and 'mode'.
"* EFFECTS:
"    Jumps 'lines' lines up or down, according to 'motion'.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let lines_nr = str2nr(a:lines)
  if lines_nr ==# 0
    redraw | echo | return | endif
  " Set mark for jumplist.
  normal! m'
  " In operator-pending mode, force a linewise motion.
  if a:mode == 'o'
    normal! V
  endif
  execute 'normal! ' . lines_nr . a:motion
  redraw | echo a:msg
endfunction

function! s:DoAbsoluteJump(twodigit, msg, mode)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"* ARGUMENTS:
"    twodigit:  A number from 0-99 -- the last two digits of the line we're
"               jumping to.
"    See Vertigo() for the description of 'mode'.
"* EFFECTS:
"    Jumps to the first line on screen with line number ending in 'twodigit',
"    or display an error message if there is no such line.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let twodigit_nr = str2nr(a:twodigit)
  let linenr = s:GetAbsJumpLineNumber(twodigit_nr)
  if linenr ==# -1
    redraw
    echohl ErrorMsg
    echo '[Vertigo.vim] Bad line number: ' . a:twodigit
    echohl None
    return | endif
  let curline = line('.')
  if linenr ==# curline
    redraw | echo | return
  elseif linenr < curline
    let lines = curline - linenr
    let motion = 'k'
  else
    let lines = linenr - curline
    let motion = 'j'
  endif
  call s:DoJump(lines, motion, a:msg.' --> '.linenr, a:mode)
endfunction

function! s:GetAbsJumpLineNumber(twodigit)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"* ARGUMENTS:
"    twodigit:  A number from 0-99 -- the last two digits of the line we're
"               jumping to.
"* RETURNS:
"    The number of the first line on screen with line number ending in
"    'twodigit'. If no such number exists, return -1.
"
"    For example, if the window is showing lines 273-319:
"    s:AbsJump(74) = 274
"    s:AbsJump(99) = 299
"    s:AbsJump(12) = 312
"    s:AbsJump(22) = -1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let start = line('w0')
  let end = line('w$')
  let hundreds = start / 100 * 100
  let try = hundreds + a:twodigit
  if try >= start && try <= end
    return try
  endif
  let try = try + 100
  if try <= end
    return try
  endif
  return -1
endfunction

function! s:UsingAbsoluteNumbering()
" Returns whether or not the user is currently using absolute numbering.
  return &number && (!exists('+relativenumber') || !&relativenumber)
endfunction

