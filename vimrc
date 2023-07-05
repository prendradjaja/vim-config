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
" Bundle 'kana/vim-submode'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
" Disabled bc of some bug urgh
" Bundle 'SirVer/ultisnips'
Bundle 'leafgarland/typescript-vim'
Bundle 'jason0x43/vim-js-indent'
Bundle 'ciaranm/detectindent'
Bundle 'junegunn/vim-easy-align'
Bundle 'neoclide/jsonc.vim'
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
" runtime submodemappings.vim
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
set tabstop=2
set shiftwidth=2
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
  set number
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
nnoremap <silent> <Leader>9 :CharLimit 100<CR>
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
nnoremap <Leader>sw :set wrap!<CR>:set wrap?<CR>
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
nnoremap <Home> :w<CR>:MyMake<CR>
nnoremap zm :w<CR>:MyMake<CR>
nnoremap zb :w<CR>:MyMake<CR>
nnoremap ZM :w<CR>:MyMake<CR>
nnoremap ZE :w<CR>:MyMake "example"<CR>
nnoremap ZU :w<CR>:!myrun %<CR>
" nnoremap ZM :w<CR>:!myrun %<CR>
" nnoremap ZB :w<CR>:!myrun %<CR>
nnoremap ZB :w<CR>:MyMake<CR>
nnoremap ZC :w<CR>:MyMake "copy-last"<CR>
nnoremap ZW :w<CR>:bd<CR>
nnoremap ZT :w<CR>:MyMake "test"<CR>
" }}}
" Markdown to clipboard {{{
command! MarkdownToClipboard %!markdown | xclip -selection clipboard
" }}}


" *** Implement complex behavior here ****************************** {{{ *** "

" command! -nargs=1 CharLimit let &colorcolumn=join(range(<args>+1,999),",")|set textwidth=<args>|echo "  ~<args>charLimit"
command! -nargs=1 CharLimit let &colorcolumn=<args>+1|set textwidth=<args>|echo "  ~<args>charLimit"

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
  " set fdm=indent
  set noacd
  e ~/notes/todo
  Todosyntax
  nnoremap ZM :w<CR>:!cd ~/notes; make<CR>
endfunction
command! Todo call Todo()

function! Todosyntax()
  source ~/.vim/syntax-todo/syntax-todo.vim
endfunction
command! Todosyntax call Todosyntax()

" function! Journal()
"   " set noacd
"   e ~/journal/README.md
"   nnoremap ZM :w<CR>:!cd ~/journal; make<CR>
" endfunction
" command! Journal call Journal()






nnoremap <scrollwheelup> <c-y>
nnoremap <scrollwheeldown> <c-e>

" Copy all
nnoremap <Leader>ca :w !pbcopy<CR>
" Copy line
nnoremap <Leader>cc 0"+y$

nnoremap ZP :!make push<CR>

command! -range Copy <line1>,<line2>w !pbcopy
vnoremap <Leader>ca :Copy<CR>

nnoremap ZV :w<CR>
nnoremap gt ,

function! CustomIndentFold()
  setlocal foldexpr=CustomIndentFoldExpr()
  setlocal foldmethod=expr
  setlocal foldignore=
endfunction
command! CustomIndentFold call CustomIndentFold()

func! CustomIndentFoldExpr() abort
  let line = getline(v:lnum)
  if line =~? '^\s*$'
    return -1
  endif

  let indent = indent(v:lnum) / &sw
  let indent_next = indent(nextnonblank(v:lnum+1))/&sw

  if indent_next > indent && line =~ ':\s*$'
    return ">" . indent_next
  else
    return indent
  endif
endfunc

function! ReorderMode()
  nnoremap K :m-2<CR>
  nnoremap J :m+1<CR>
endfunction
command! ReorderMode call ReorderMode()

function! VoteMode()
  Todosyntax
  nnoremap 1 0c2lx1<esc>
  nnoremap 2 0c2l-5<esc>
  nnoremap 3 0c2l/9<esc>
  nnoremap 4 0c2l. <esc>
endfunction
command! VoteMode call VoteMode()

set nofileignorecase

function! ConflictMode()
  setlocal filetype=
  runtime conflict.vim
endfunction
command! ConflictMode call ConflictMode()

nnoremap <Leader>ch :ConflictMode<CR>

function! MyMake(...)
  if filereadable("Makefile")
    exec '!make ' . join(a:000)
  else
    if a:0 == 0
      exec '!npm run start'
    else
      exec '!npm run ' . join(a:000)
    endif
  endif
endfunction
command! -nargs=? MyMake call MyMake(<args>)

command! Prettier silent %!npx prettier --stdin-filepath %

hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi MatchParen cterm=NONE ctermfg=grey ctermbg=green

nnoremap <Leader>vp `[v`]
nnoremap <Leader>Vp `[V`]

" Delete a function
nmap drf dt(dr(
" Change a function
nmap crf drfi

nnoremap <Leader>; ,

function! RearrangementMode()
  nnoremap J :m+1<CR>
  nnoremap K :m-2<CR>
endfunction
command! RearrangementMode call RearrangementMode()

function! Listify()
  normal! I['
  normal! A']
  s/ /', '/g
endfunction
command! Listify call Listify()

function! Pymain()
  append


if __name__ == '__main__':
    import doctest
    failures, tests = doctest.testmod()
    if failures:
        exit()
    main()
.
endfunction
command! Pymain call Pymain()

iabbr _ppt [print the periodic table]
