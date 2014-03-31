" vim:fdm=marker
"
" Todo:
" - Better handling for different locations/compatibility
" - Improve bullets/notetaking (maybe a plugin?)
" - Lorem Ipsum (maybe a plugin?)
" - Better smart-join
" - Checkboxes?
" - Filetype
"
" Conventions:
" - Temporarily-commented-out mappings should be prefixed with: "?
" - Each group of such mappings should also be marked with the date they were
"   removed

let s:location=hostname()
let s:HOME='PANDU-HP'
let s:LAB='hive17.CS.Berkeley.EDU'
let s:CYGWIN='Pandu-HP'

" *** PLUGINS AND BITS ********************************************* {{{ *** "

" Plugins {{{
" Setup {{{
filetype off
set runtimepath^=~/.vim/bundle/vundle
call vundle#rc()
" }}}
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'prendradjaja/vim-vertigo'
Bundle 'tpope/vim-rsi'
Bundle 'sk1418/Join'
Bundle 'kana/vim-submode'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
" }}}
" Fix runtimepath on Windows {{{
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after
" }}}
" Plugin settings {{{
runtime pluginsettings.vim
" }}}
" .vimrc bits {{{
runtime notetaking.vim
runtime open.vim
runtime indentnav.vim
runtime browseold.vim
runtime cygwin.vim
runtime numberentry.vim
runtime java.vim
runtime commands.vim
runtime functions.vim
runtime foldtext.vim
" }}}

" }}}

" *** SETTINGS ***************************************************** {{{ *** "

" Miscellaneous {{{
filetype plugin indent on " required by Vundle
syntax on
set directory=~/.vim/temp/swap//
" }}}
" File handling {{{
set hidden
set autochdir
set fileformat=unix
" }}}
" Info {{{
set ruler
set showcmd
set laststatus=2
set wildmenu
" }}}

" Tabbing {{{
set expandtab
set tabstop=4
set shiftwidth=4
" }}}
" Other text manipulation {{{
set autoindent
set nojoinspaces
set backspace=start
set nrformats=hex
set pastetoggle=<F2>
" }}}
" Searching {{{
set incsearch
set ignorecase
set smartcase
set hlsearch
" }}}

" Display {{{
set linebreak
set list
set display=lastline
" }}}
" Line numbering {{{
if exists('&relativenumber')
  set relativenumber
else
  set number
endif
" }}}
" Listchars {{{
if s:location==#s:LAB
  set listchars=tab:\|\ ,trail:>
else
  set listchars=tab:¦\ ,trail:>
endif
" }}}

" }}}

" *** MAPPINGS AND COMMANDS **************************************** {{{ *** "

" Miscellaneous {{{
inoremap <C-C> <Esc>
nnoremap <C-L> :nohlsearch<CR><C-L>
inoremap <M-w> <C-\><C-O>dB
nnoremap gc :echo getchar()<CR>
nnoremap <Leader>sa ggVG
nnoremap <Leader>/ ggVGzO/
" Delete trailing spaces
nnoremap <Leader>ds :s/\s\+$//<CR>
vnoremap <Leader>ds :s/\s\+$//<CR>
" 78-char, 72-char limits
nnoremap <silent> <Leader>8 :CharLimit 78<CR>
nnoremap <silent> <Leader>7 :CharLimit 72<CR>
nnoremap <silent> <Leader>0 :set cc= tw=0<CR>:echo "no~charLimit"<CR>
" Emacs bindings for command line
cnoremap <C-N> <Down>
cnoremap <C-P> <Up>
" Easier accents
inoremap <M-'> `
inoremap <M-c> ^
" Unbind keys for filetype-specific use
nnoremap <Insert> <Nop>
nnoremap <Home> <Nop>
nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>
nnoremap <End> <Nop>
" }}}
" Space as leader {{{
" Use default (backslash) as leader, but map spacebar to it. This way, I can
" use space as my leader, but the backslash appears in the corner for showcmd.
" Since this is to be further expanded into other mappings, it must be :map
" instead of :noremap.
map <Space> <Leader>
" }}}
" vimrc-related {{{
" Reload vimrc
nnoremap <Leader>rc :source $MYVIMRC<CR>
nnoremap <Leader>gc :source $MYGVIMRC<CR>
" Open vimrc in new split
noremap <Leader>erc :edit $MYVIMRC<CR>
noremap <Leader>egc :edit $MYGVIMRC<CR>
" }}}

" Core file-handling {{{
" Save this file
nnoremap <Leader>st :w<CR>
" Save session
nnoremap <Leader>ws :mks! ~\vimsessions\
" Typo preventer!
command! -bang Q q<bang>
" Buffer control
nnoremap <C-N> <C-^>
nnoremap <C-H> :bn<CR>
" Window control
nnoremap <C-K> <C-W>k<C-W>_
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <M--> <C-W>-
nnoremap <M-=> <C-W>+
" }}}
" Quickly change some often-used settings {{{
" Indent size
nnoremap <silent> <Leader>i1 :set ts=1 sw=1<CR>:echo "  sw,tw=1"<CR>
nnoremap <silent> <Leader>i2 :set ts=2 sw=2<CR>:echo "  sw,tw=2"<CR>
nnoremap <silent> <Leader>i3 :set ts=3 sw=3<CR>:echo "  sw,tw=3"<CR>
nnoremap <silent> <Leader>i4 :set ts=4 sw=4<CR>:echo "  sw,tw=4"<CR>
nnoremap <silent> <Leader>i5 :set ts=5 sw=5<CR>:echo "  sw,tw=5"<CR>
nnoremap <silent> <Leader>i6 :set ts=6 sw=6<CR>:echo "  sw,tw=6"<CR>
nnoremap <silent> <Leader>i7 :set ts=7 sw=7<CR>:echo "  sw,tw=7"<CR>
nnoremap <silent> <Leader>i8 :set ts=8 sw=8<CR>:echo "  sw,tw=8"<CR>
nnoremap <silent> <Leader>i9 :set ts=9 sw=9<CR>:echo "  sw,tw=9"<CR>
" Toggle expandtab
nnoremap <Leader>et :set et!<CR>:set et?<CR>
" Toggle wrapping
nnoremap <Leader>sw :set wrap!<CR>
" Toggle list (show whitespace)
nnoremap <Leader>lt :set list!<CR>:set list?<CR>
" Virtual edit
noremap <Leader>va :set virtualedit=all<CR>
noremap <Leader>vo :set virtualedit=<CR>
" Line numbering
nnoremap <silent> <Leader>n :call ToggleRelativeNumber()<CR>
nnoremap <silent> <Leader>N :call ToggleNumber()<CR>
vnoremap <silent> <Leader>n :<C-U>call ToggleRelativeNumber()<CR>gv
vnoremap <silent> <Leader>N :<C-U>call ToggleNumber()<CR>gv
" Quick Unicode (UTF-8) switch
command! Unicode set encoding=utf-8
"}}}
" Ease-of-use swaps {{{
" ` and '
noremap ' `
noremap ` '
" ~ and !
noremap ~ !
noremap ! ~
noremap g! g~
" , and :
noremap , :
noremap : ,
" }}}

" System clipboard {{{
noremap <Leader>sc "+y
noremap <Leader>sC "+Y
noremap <Leader>sp "+p
noremap <Leader>sP "+P
noremap <Leader>sgp "+gp
noremap <Leader>sgP "+gP
noremap <Leader>sop o<Esc>"+p
noremap <Leader>soP O<Esc>"+P
" }}}
" Quick automation via Q macro {{{
" Apply to all lines in visual
vnoremap <Leader>am :normal @q<CR>
vnoremap <Delete> :normal @q<CR>
" One-press mappings
nnoremap <Delete> @q
" Edit Q register
nnoremap <Leader>em :call EditQ()<CR>
" }}}
" Split line on separator {{{
nnoremap <Leader>sl :s//\r/g<Left><Left><Left><Left><Left>
" ... or just on the previous character
nnoremap <Leader>ls hs<C-M><Esc>
" }}}

" Smart join {{{
" example:
    "           goodbye
    " hello
" becomes
    " hello     goodbye
nnoremap <Leader>sj :set ve=all<CR>$mav_yjv'ajpkdd:set ve=<CR>
" }}}
" Checkboxes {{{
vnoremap <Leader>ac :g/./norm I[ ] <CR>
command! CheckboxMode nnoremap <Leader>c mz0lrx`z
" }}}
" Number entry mode {{{
nnoremap <Leader>en :call NumberEntryModeOn()<CR>
nnoremap <Leader>dn :call NumberEntryModeOff()<CR>
" }}}
" like gf, but opens Chrome {{{
nnoremap <silent> <Leader>gf :silent !start C:\Users\Pandu\AppData\Local\Google\Chrome\Application\chrome.exe <C-R><C-A><CR>
" }}}


" *** Implement complex behavior here ****************************** {{{ *** "

command! -nargs=1 CharLimit let &colorcolumn=join(range(<args>+1,999),",")|set textwidth=<args>|echo "  ~<args>charLimit"

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

function! EditQ()
  " Open up a 1-line window to edit the Q macro in. Pressing <CR> closes it
  " and saves the macro.
  1new
  norm "qp
  nnoremap <buffer> <CR> 0"qD:bd!<CR>
  inoremap <buffer> <CR> <Esc>0"qD:bd!<CR>
  let &l:statusline="[Q Register] Press <CR> to save changes"
endfunction
" }}}

" }}}

runtime local.vim

" *** Sandbox area below this line ***************************************** "
