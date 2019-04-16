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

" *** PLUGINS AND BITS ********************************************* {{{ *** "

" Plugins {{{
" Setup {{{
filetype off
set runtimepath^=~/.vim/bundle/vundle
call vundle#rc()
" }}}
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-repeat'
Bundle 'prendradjaja/vim-vertigo'
Bundle 'sk1418/Join'
Bundle 'kana/vim-submode'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'SirVer/ultisnips'
Bundle 'leafgarland/typescript-vim'
Bundle 'jason0x43/vim-js-indent'
Bundle 'ciaranm/detectindent'
Bundle 'junegunn/vim-easy-align'
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
runtime cygwin.vim
runtime numberentry.vim
runtime java.vim
runtime commands.vim
runtime functions.vim
runtime folds.vim
runtime colors.vim
runtime submodemappings.vim
runtime editbinary.vim
runtime oldenglish.vim
runtime german.vim
runtime s-exp.vim
" }}}

" }}}

" *** SETTINGS ***************************************************** {{{ *** "

" Miscellaneous {{{
filetype plugin indent on " required by Vundle
syntax on
set directory=~/.vim/temp/swap//
set mouse=a
set lazyredraw
" }}}
" File handling {{{
set hidden
set autochdir
set fileformat=unix
set wildmode=list:longest,full
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
if !exists('g:vimrc_loaded')
  set hlsearch
endif
" }}}

" Display {{{
set linebreak
set list
set display=lastline
set nowrap
" }}}
" Line numbering {{{
if exists('&relativenumber')
  set relativenumber
else
  set number
endif
" }}}
" Listchars {{{
set listchars=tab:¦\ ,trail:>
" }}}

" }}}

" *** MAPPINGS AND COMMANDS **************************************** {{{ *** "

" Miscellaneous {{{
inoremap <C-C> <Esc>
nnoremap <C-L> :nohlsearch<CR><C-L>
inoremap <M-w> <C-\><C-O>dB
nnoremap <Leader>sa ggVG
nnoremap <Leader>/ ggVGzO/
nnoremap ze zt8<C-Y>
nnoremap zy zb8<C-E>
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
" Fix annoying Vim behavior
nnoremap <C-W><C-C> <Nop>
nnoremap r<C-C> <Nop>
inoremap <C-@> <Space>
inoremap <LeftMouse> <Nop>
  " create new files with gf
nnoremap gf :e <cfile><CR>
nmap gh gf
  " don't zz0 on bufswitch
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
" Open curly-brace block -- open a new {} block and enter insert mode
nnoremap <Leader>oc A {<CR>}<Esc>O
" Use U for redo
nnoremap U <C-R>
" Hacky shift-tab to untab
inoremap <S-Tab> <Backspace><Backspace><Backspace><Backspace>
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
nnoremap <C-S> :w<CR>
" Save session
nnoremap <Leader>ws :mks! ~\vimsessions\
" Typo preventer!
command! -bang Q q<bang>
" Buffer control
nnoremap <C-N> <C-^>
nnoremap <C-H> :bn<CR>
nnoremap <C-G> :bp<CR>
" Window control
nnoremap <C-K> <C-W>k
nnoremap <C-J> <C-W>j
" }}}
" Quickly change some often-used settings {{{
" Indent size
nnoremap <silent> <Leader>i1 :set ts=1 sw=1<CR>:echo "  sw,ts=1"<CR>
nnoremap <silent> <Leader>i2 :set ts=2 sw=2<CR>:echo "  sw,ts=2"<CR>
nnoremap <silent> <Leader>i3 :set ts=3 sw=3<CR>:echo "  sw,ts=3"<CR>
nnoremap <silent> <Leader>i4 :set ts=4 sw=4<CR>:echo "  sw,ts=4"<CR>
nnoremap <silent> <Leader>i5 :set ts=5 sw=5<CR>:echo "  sw,ts=5"<CR>
nnoremap <silent> <Leader>i6 :set ts=6 sw=6<CR>:echo "  sw,ts=6"<CR>
nnoremap <silent> <Leader>i7 :set ts=7 sw=7<CR>:echo "  sw,ts=7"<CR>
nnoremap <silent> <Leader>i8 :set ts=8 sw=8<CR>:echo "  sw,ts=8"<CR>
nnoremap <silent> <Leader>i9 :set ts=9 sw=9<CR>:echo "  sw,ts=9"<CR>
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
" Ease-of-use maps and sawps {{{
" ` and '
noremap ' `
noremap ` '
" ~ and !
noremap ~ !
noremap ! ~
noremap g! g~
" , and :
noremap , :
" noremap : ,
" s for /
noremap s /
noremap S ?
" _ for ^
noremap _ ^
noremap ^ <nop>
" easier paste in insert mode
noremap! <C-R>' <C-R>"
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
vnoremap <Leader>ac :g/./norm I[ ] <CR>:nohl<CR>
command! CheckboxMode nnoremap <Leader>c mz0lrx`z
" }}}
" Number entry mode {{{
nnoremap <Leader>en :call NumberEntryModeOn()<CR>
nnoremap <Leader>dn :call NumberEntryModeOff()<CR>
" }}}
" like gf, but opens Chrome {{{
nnoremap <silent> <Leader>gf :silent !start C:\Users\Pandu\AppData\Local\Google\Chrome\Application\chrome.exe <C-R><C-A><CR>
" }}}
" Make {{{
nnoremap <Home> :w<CR>:!make<CR>
nnoremap ZM :w<CR>:!make<CR>
" }}}
" Markdown to clipboard {{{
command! MarkdownToClipboard %!markdown | xclip -selection clipboard
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

let g:vimrc_loaded = 1

" *** Sandbox area below this line ***************************************** "

nnoremap cif ggcG
nnoremap <leader>p :set paste!<CR>:set paste?<CR>
set breakindent
nnoremap <leader>sh :syntax off<CR>
nnoremap <leader>SH :syntax on<CR>
nnoremap <leader>sH :syntax on<CR>

" function! Only()
"   ? it(
"   normal! _la.only
"   write
" endfunction
" command! Only call Only()

hi Folded ctermbg=black ctermfg=yellow
hi Comment ctermfg=darkcyan

function! Todo()
  set sw=2
  set ts=2
  set fdm=indent
  set noacd
  e ~/c/notes/tickets/reg-prompt
  source ~/.vim/syntax-todo/syntax-todo.vim
endfunction
command! Todo call Todo()

nnoremap <scrollwheelup> <c-y>
nnoremap <scrollwheeldown> <c-e>
