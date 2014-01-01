let s:location=hostname()
let s:HOME='PANDU-HP'
let s:LAB='hive17.CS.Berkeley.EDU'
let s:CYGWIN='Pandu-HP'

" Plugins (Vundle)
filetype off
set runtimepath^=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-surround'
Bundle 'prendradjaja/vim-vertigo'
Bundle 'tpope/vim-rsi'
Bundle 'sk1418/Join'

" First thing in RTP should be ~/.vim
set runtimepath^=~/.vim

" Plugin settings
runtime pluginsettings.vim

" Scripts in ~/.vim
runtime notetaking.vim
runtime open.vim
runtime indentnav.vim
runtime browseold.vim
runtime cygwin.vim
runtime numberentry.vim

map <Space> <Leader>

" Source me
nnoremap <leader>rc :source $MYVIMRC<CR>
nnoremap <leader>gc :source $MYGVIMRC<CR>

" Open me in new split
if s:location==#s:HOME
  noremap <Leader>erc :split $MYVIMRC<CR>
endif

" Save here
nnoremap <Leader>st :w<CR>

" Delete (trailing) spaces
nnoremap <Leader>ds :s/\s\+$//<CR>
vnoremap <Leader>ds :s/\s\+$//<CR>

" Checkboxes
vnoremap <Leader>ac :g/./norm I[ ] <CR>
command! CheckboxMode nnoremap <Leader>c mz0lrx`z

" Java
let java_allow_cpp_keywords=1
ia jprint System.out.println
ia jmain public static void main(String[] args) {
" [o]pen [c]urly-brace block -- open a new {} block and enter insert mode
nnoremap <Leader>oc A {<CR>}<Esc>O<C-t>
" 'vim' selects inside of method
vnoremap im [mo]M

" Typo preventer!
command! -bang Q q<bang>

" Save session
nnoremap <Leader>ws :mks! ~\vimsessions\

" 80-char limit (actually 78)
map <silent> <Leader>8 :set cc=<CR>:set tw=0<CR>:echo "no~80char"<CR>
map <silent> <Leader>* :let &colorcolumn=join(range(79,999),",")<CR>:set textwidth=78<CR>:echo "  ~80char"<CR>

" 72-char limit
map <silent> <Leader>7 :set cc=<CR>:set tw=0<CR>:echo "no~72char"<CR>
map <silent> <Leader>& :let &colorcolumn=join(range(73,999),",")<CR>:set textwidth=72<CR>:echo "  ~72char"<CR>

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
filetype plugin indent on " required for Vundle
syntax on
set lbr
if exists('&relativenumber')
  set relativenumber
else
  set number
endif
nnoremap <silent> <Leader>n :call ToggleRelativeNumber()<CR>
nnoremap <silent> <Leader>N :call ToggleNumber()<CR>
vnoremap <silent> <Leader>n :<C-U>call ToggleRelativeNumber()<CR>gv
vnoremap <silent> <Leader>N :<C-U>call ToggleNumber()<CR>gv
set ruler
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
set fileformat=unix

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
nnoremap <Leader>ss :%s//
nnoremap <M-F12> :confirm q<CR>

" Command line things
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>

" System clipboard shortcuts and such nonsense
noremap <Leader>sa ggVG
noremap <Leader>sA "*pkdd
noremap <Leader>sp "*p
noremap <Leader>sP "*P
noremap <Leader>SP "*P
noremap <Leader>sgp "*gp
noremap <Leader>sgP "*gP
noremap <Leader>sop o<Esc>"*p
noremap <Leader>sc "*y
noremap <Leader>sC "*Y

" GUI save and open
nnoremap <M-w> :browse write<CR>
nnoremap <M-e> :browse edit<CR>

" Apply macro to all lines in visual
vnoremap <Leader>am :normal @q<CR>

function! CurrChar()
  let char = getline('.')[col('.') - 1]
  return char
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

" Append range
nnoremap <Leader>ar :call append(line('.'), range(1, str2nr(input('Range from 1-? '))))<CR>

" Date stamp
inoremap <C-Space>cd <C-R>=strftime('%Y-%m-%d')<CR>

" Python: create init function for classes where instance variables are
" determined by __init__ arguments
"
" Use this after writing a line def __init__(self, blah, blah2...):
" It will create the self.blah = blah, etc.
function! CreatePythonInitFunction()
  let start = line('.')+1
  normal! Yp<<0df,xf)D
  s/, /\r/g
  let end = line('.')
  execute start . ',' . end "norm y$>>.iself.\<Esc>A = \<Esc>p"
endfunction
nnoremap <Leader>mi :call CreatePythonInitFunction()<CR>

" like gf, but opens Chrome
nnoremap <silent> <Leader>gf :silent !start C:\Users\Pandu\AppData\Local\Google\Chrome\Application\chrome.exe <C-R><C-A><CR>

" Easier accents
inoremap <M-'> `
inoremap <M-c> ^

" Quick Unicode (UTF-8) switch
command! Unicode set encoding=utf-8
