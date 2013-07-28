let s:location=hostname()
let s:HOME='PANDU-HP'
let s:LAB='star'
let s:CYGWIN='Pandu-HP'

if s:location==#s:HOME
  set runtimepath^=~/dropbox/vim-plug
  set runtimepath^=~/dropbox/.vim
endif

" Plugins
execute pathogen#infect()
runtime next_motion_mapping.vim
runtime teleport/teleport.vim

let g:EasyMotion_leader_key = '<Leader>u'

map <Space> <Leader>

" Source me
nnoremap <leader>rc :source $MYVIMRC<CR>
nnoremap <leader>gc :source $MYGVIMRC<CR>

" Open me in new split
if s:location==#s:HOME
  noremap <Leader>erc :split $MYVIMRC<CR>
endif

" Save here
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
nnoremap <Leader>sh :w<CR>

" Delete (trailing) spaces
nnoremap <Leader>ds :s/\s\+$//<CR>
vnoremap <Leader>ds :s/\s\+$//<CR>

" Checkboxes
vnoremap <Leader>ac :g/./norm I[ ] <CR>

" For note-taking and prose
vnoremap <Leader>dr omaOmbomcOmd`br-`c`dr-k`ajr<Bar>`bj`dkr<Bar>
nnoremap <M-b> :call ToggleBullet()<CR>
nnoremap <Leader>lc ma0vw2hr:`a
nnoremap <Leader>le ma0vw2hr=`a
nnoremap <Leader>lo ma0vw2hr `a
inoremap <C-b> <Esc>:call ToggleBullet()<CR>:startinsert!<CR>
nnoremap <Leader>wa :set formatoptions+=a<CR>:set formatoptions?<CR>
nnoremap <Leader>wo :set formatoptions-=a<CR>:set formatoptions?<CR>
nnoremap <Leader>wy :set formatoptions-=a<CR>:SoftWrap<CR>:set formatoptions+=a<CR>ggvG$"*yu
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

" Java
let java_allow_cpp_keywords=1
ia jprint System.out.println
ia jmain public static void main(String[] args) {
" [o]pen [c]urly-brace block -- open a new {} block and enter insert mode
nnoremap <Leader>oc A {<CR>}<Esc>O<C-t>
" 'vim' selects inside of method
vnoremap im [mo]M

" Typo preventers!
command! -bang Q q<bang>

" Quit with right hand
nnoremap <Leader>wz :confirm q<CR>

" Open new line with no indent
  "below
nnoremap <Leader>od o<Esc>i
  "2 below
nnoremap <Leader>on o<Esc>o
  "above
nnoremap <Leader>oD O<Esc>i

" Open new lines but keep cursor position
nnoremap <Leader>os ma20o<Esc>`a

" Open new line, Lisp-style
nnoremap <Leader>ol :set lisp<CR>o <C-O>:set nolisp<CR><C-H>

" Scroll and move cursor
noremap <M-j> j<C-e>
noremap <M-k> k<C-y>

" Save session
nnoremap <Leader>ws :mks! ~\vimsessions\

" 80-char limit (actually 78)
map <silent> <Leader>8 :set cc=<CR>:set tw=0<CR>:echo "no!80char"<CR>
map <silent> <Leader>* :let &colorcolumn=join(range(79,999),",")<CR>:set textwidth=78<CR>:echo "  !80char"<CR>

" 72-char limit
map <silent> <Leader>7 :set cc=<CR>:set tw=0<CR>:echo "no!72char"<CR>
map <silent> <Leader>& :let &colorcolumn=join(range(73,999),",")<CR>:set textwidth=72<CR>:echo "  !72char"<CR>

" Change indentation settings
nnoremap <silent> <Leader>i1 :set ts=1<CR>:set sw=1<CR>:echo "  sw,tw=1"<CR>
nnoremap <silent> <Leader>i2 :set ts=2<CR>:set sw=2<CR>:echo "  sw,tw=2"<CR>
nnoremap <silent> <Leader>i3 :set ts=3<CR>:set sw=3<CR>:echo "  sw,tw=3"<CR>
nnoremap <silent> <Leader>i4 :set ts=4<CR>:set sw=4<CR>:echo "  sw,tw=4"<CR>
nnoremap <silent> <Leader>i5 :set ts=5<CR>:set sw=5<CR>:echo "  sw,tw=5"<CR>
nnoremap <silent> <Leader>i6 :set ts=6<CR>:set sw=6<CR>:echo "  sw,tw=6"<CR>
nnoremap <silent> <Leader>i7 :set ts=7<CR>:set sw=7<CR>:echo "  sw,tw=7"<CR>
nnoremap <silent> <Leader>i8 :set ts=8<CR>:set sw=8<CR>:echo "  sw,tw=8"<CR>
nnoremap <silent> <Leader>i9 :set ts=9<CR>:set sw=9<CR>:echo "  sw,tw=9"<CR>
" Toggle expandtab
nnoremap <Leader>et :set et!<CR>:set et?<CR>

" Retab
nnoremap <Leader><> :.retab!<CR>
nnoremap <Leader>>< :%retab!<CR>
vnoremap <Leader><> :retab!<CR>
vnoremap <Leader>>< :retab!<CR>

" General settings
syntax on
set lbr
if exists('&relativenumber')
  set relativenumber
else
  set number
endif
nnoremap <silent> <Leader>n :call ToggleRelativeNumber()<CR>
nnoremap <silent> <Leader>N :call ToggleNumber()<CR>
set ruler
set whichwrap=h,l
set expandtab
set tabstop=4
set shiftwidth=4
set list
if s:location==#s:LAB
  set listchars=tab:\|\ ,trail:>
else
  set listchars=tab:¦\ ,trail:>
endif
set autoindent
set showcmd
set display=lastline
set autochdir
set nojoinspaces
set backspace=start
set nrformats=hex
set pastetoggle=<F2>
set incsearch
set ignorecase
set smartcase
set wildmenu
" [s]witch high[l]ight
nnoremap <Leader>sl :set hlsearch!<CR>
" [b]racket [t]his
vnoremap <leader>bt di<><C-C>P
set laststatus=2
set hidden

" Search across newlines
" cnoremap <C-Space> \_s\+

" Show whitespace
nnoremap <Leader>lt :set list!<CR>:set list?<CR>

" Virtual edit
noremap <Leader>va :set virtualedit=all<CR>
noremap <Leader>vo :set virtualedit=<CR>

" Python calculator
vnoremap <M-.> !eval.py<CR>

" Buffer control
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bN<CR>

" Window control
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-j> <C-w>j<C-w>_

" Tab control
nnoremap <C-S-Tab> gT
nnoremap <C-Tab> gt
nnoremap <M-h> gT
nnoremap <M-t> gt
if s:location==#s:LAB
  set showtabline=2
  hi TabLineFill ctermfg=black
endif

" Buffer control
nnoremap <M-H> :bprevious<CR>
nnoremap <M-T> :bnext<CR>

" Escape insert mode
inoremap <C-c> <Esc>

" Misc mappings
nnoremap <Leader>ou O<Esc>O
nnoremap <Leader>oh :set ve=all<CR>mzo<Esc>`zji.<BS><C-O>:se ve=<CR>
noremap ~ !
noremap ! ~
noremap g! g~
noremap ' `
noremap ` '
map <C-@> @q
imap <M-w> <C-\><C-o>dB
map <M--> <C-w>-
map <M-=> <C-w>+
nnoremap <Leader>ls hs<C-m><Esc>
nnoremap gc :echo getchar()<CR>
nnoremap <Leader>sw :set wrap!<CR>

" Command line things
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" Easier access to unnamed register
noremap! <C-R>' <C-R>"

" System clipboard shortcuts and such nonsense
noremap <Leader>sa ggVG
noremap <Leader>sA "*pkdd
noremap <Leader>sp "*p
noremap <Leader>sP "*P
noremap <Leader>SP "*P
noremap <Leader>sgp "*gp
noremap <Leader>sgP "*gP
noremap <Leader>snp o<Esc>"*p
noremap <Leader>sc "*y
noremap <Leader>sC "*Y

" GUI save and open
nnoremap <M-w> :browse write<CR>
nnoremap <M-e> :browse edit<CR>

" Apply macro to all lines in visual
vnoremap <Leader>am :normal @q<CR>

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> <M-s> :call NextIndent(0, 0, 0, 1)<CR>^
nnoremap <silent> <M-n> :call NextIndent(0, 1, 0, 1)<CR>^
nnoremap <silent> <M-p> :call NextIndent(0, 0, 1, 1)<CR>^
nnoremap <silent> <M-P> :call NextIndent(0, 1, 1, 1)<CR>^
vnoremap <silent> <M-s> <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> <M-n> <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> <M-p> <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> <M-P> <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> <M-s> :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> <M-n> :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> <M-p> :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> <M-P> :call NextIndent(1, 1, 1, 1)<CR>

nmap <silent> <M-S> <M-s>zt
nmap <silent> <M-N> <M-n>zt

" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

function! DateStamp()
  execute "normal i### " . strftime("%Y %B %d (%A) - %I:%M %p ")
  normal g~BB
  call TrimLeadingZero()
  normal 3B
  call TrimLeadingZero()
  normal $
  call FillLine("#")
endfunction

function! TrimLeadingZero()
  if CurrChar() == '0'
    normal x
  endif
endfunction

function! FillLine(char)
  normal $
  let oldtw=&textwidth
  set textwidth=0
  execute "normal 81a" . a:char
  normal 81|D
  let &textwidth=oldtw
endfunction

function! CurrChar()
  let char = getline('.')[col('.') - 1]
  return char
endfunction

function! NewEntry()
  let hello = getline('.')
  if hello ==# 'Hello.'
    normal G2o
    call DateStamp()
    normal 2o
    startinsert
  endif
endfunction

function! ReCo() "Readable courses
  s/\[/\r[/g
endfunction

function! ToggleNumber()
  if &number || &relativenumber
    set nonumber
    set norelativenumber
  else
    set relativenumber
  endif
endfunction

function! ToggleRelativeNumber()
  if &relativenumber
    set number
    set number?
  else
    set relativenumber
    set relativenumber?
  endif
endfunction


function! CycleNumber()
  if &number
    set relativenumber
    set relativenumber?
  elseif &relativenumber
    set norelativenumber
    set number?
  else
    set number
    set number?
  endif
endfunction

function! BrowseOld()
  edit ~/_customvimold
  % delete
  redir => message
  silent oldfiles
  redir END
  silent put=message
  global/^$/d
  % normal dW
  call DrawBrowseMessage()
  write
  call MakeBrowseMappings()
endfunction
command! BrowseOld call BrowseOld()
command! BR call BrowseOld()

function! MakeBrowseMappings()
  nnoremap <buffer> <silent> <C-m> Vgf
  nnoremap <buffer> <C-s> :call FilterAllLines()<CR>
endfunction

" Not needed because of <buffer>?
function! ClearBrowseMappings()
  nunmap <buffer> <C-m>
  nunmap <buffer> <C-s>
endfunction
command! ClearBrowseMappings call ClearBrowseMappings()

let s:browsemsg = "
\Browsing old files\n
\------------------\n
\  Press: <C-m> to go to a file\n
\         <C-s> to filter\n
\\n"
function! DrawBrowseMessage()
  1 put! = s:browsemsg
  +1
endfunction

function! FilterAllLines()
  let instring = input('Filter: ')
  if instring != ''
    if getline(1) ==# split(s:browsemsg, '\n')[0]
      1 normal dap
    endif

    execute 'v/' . instring . '/d'
    write
    redraw
  endif
endfunction

nnoremap <silent> <C-w><C-b> :BrowseOld<CR>

function! Sum(start, end)
  execute a:start . "," . (a:end-1) . "normal A+"
  execute a:start . "," . a:end . "join"
  Eval
endfunction
command! -range=% Sum call Sum(<line1>, <line2>)

function! EvalLine()
  normal! 0D
  put =eval(@\")
  -1 delete _
endfunction

function! EvalRange(start, end)
  execute a:start . "," . a:end . " g/./call EvalLine()"
endfunction
command! -range Eval call EvalRange(<line1>, <line2>)

function! Reverse(start, end)
  let top=a:start-1
  execute a:start . "," . a:end . " g/^/m" . top
endfunction
command! -range Reverse call Reverse(<line1>, <line2>)

" [s]mart [j]oin lines like these:
"           goodbye
" hello
nnoremap <leader>sj :set ve=all<CR>$mav_yjv'ajpkdd:set ve=<CR>

" Number entry mode: aoeuidhtns = 1234567890, SPACE = hyphen
function! NumberEntryModeOn()
  inoremap a 1
  inoremap o 2
  inoremap e 3
  inoremap u 4
  inoremap i 5
  inoremap d 6
  inoremap h 7
  inoremap t 8
  inoremap n 9
  inoremap s 0
  inoremap <Space> -
  echo "  !numberEntryMode"
endfunction

function! NumberEntryModeOff()
  iunmap a
  iunmap o
  iunmap e
  iunmap u
  iunmap i
  iunmap d
  iunmap h
  iunmap t
  iunmap n
  iunmap s
  iunmap <Space>
  echo "no!numberEntryMode"
endfunction

nnoremap <leader>en :call NumberEntryModeOn()<CR>
nnoremap <leader>dn :call NumberEntryModeOff()<CR>

function! ReplaceWeirdCharacters()
  let replacements = {
    \ "\<C-[>": '<Esc>',
    \ "\<C-M>": '<CR>',
    \ "\u80kb": '<BS>'
    \}
  for [a, b] in items(replacements)
    execute "s/" . a . "/" . b . "/ge"
  endfor
endfunction
nnoremap <leader>rwc :call ReplaceWeirdCharacters()<CR>

" Teleport.vim
nnoremap <silent> <Leader>h :<C-U>TeleportDown n<CR>
nnoremap <silent> <Leader>t :<C-U>TeleportUp   n<CR>
vnoremap <silent> <Leader>h :<C-U>TeleportDown v<CR>
vnoremap <silent> <Leader>t :<C-U>TeleportUp   v<CR>
onoremap <silent> <Leader>h :<C-U>TeleportDown o<CR>
onoremap <silent> <Leader>t :<C-U>TeleportUp   o<CR>
