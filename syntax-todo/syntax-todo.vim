" https://github.com/vim-scripts/TODO-List
"
" Vim syntax file
" Language: TODO

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" So do these names have to be prefixed to avoid name collisions with other
" syntax files?
syn match todolink        /^ *\(https\|http\):\/\/.*$/
syn match todoheader      /^ *\zs.*:$/
syn match todonote        /-.*/
syn match tododone        /x.*/
syn match todoinprogress  /\/.*/
syn match todotodo        /\..*/
syn match todosuper        /\*/
syn match todoplus   /+/
" syn region done start=/\*\*DONE/ end=/\*\*/
" syn region inprogress start=/\*\*INPROGRESS/ end=/\*\*/
" syn region matttodo start=/\*\*TODO/ end=/\*\*/

if !exists("did_todo_syntax_inits")
  let did_todo_syntax_inits = 1

  hi default todoheader cterm=underline

  hi link tododone tDone
  hi link done tDone
  hi default tDone ctermfg=DarkBlue

  hi link todoinprogress tProgress
  hi link inprogress tProgress
  hi default tProgress ctermfg=DarkCyan

  hi link todotodo tTodo
  hi link matttodo tTodo
  hi default tTodo ctermfg=DarkYellow

  hi default todosuper ctermfg=none ctermbg=Green
  hi default todoplus ctermfg=none ctermbg=Magenta

  hi LineNr ctermfg=none
  hi CursorLineNr ctermfg=none

  hi todonote ctermfg=none

endif

let b:current_syntax="todo"

" red yellow green cyan blue magenta
