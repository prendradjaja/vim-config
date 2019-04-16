" https://github.com/vim-scripts/TODO-List
"
" Vim syntax file
" Language: TODO
" Author:   Matthew Urry
" Created:  Thu 16 Apr 2009 10:18:10 AM BST
" Modified: Thu 16 Apr 2009 03:29:34 PM BST

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match tododone        /x.*/
syn match todoinprogress  /\/.*/
syn match todotodo        /\..*/
" syn region done start=/\*\*DONE/ end=/\*\*/
" syn region inprogress start=/\*\*INPROGRESS/ end=/\*\*/
" syn region matttodo start=/\*\*TODO/ end=/\*\*/

if !exists("did_todo_syntax_inits")
  let did_todo_syntax_inits = 1

  hi link tododone tDone
  hi link done tDone
  hi default tDone ctermfg=DarkBlue

  hi link todoinprogress tProgress
  hi link inprogress tProgress
  hi default tProgress ctermfg=DarkCyan

  hi link todotodo tTodo
  hi link matttodo tTodo
  hi default tTodo ctermfg=DarkYellow

endif

let b:current_syntax="todo"

" red yellow green cyan blue magenta
