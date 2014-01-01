" Moving back and forth between lines of same or lower indentation.
" From http://vim.wikia.com/wiki/Move_to_next/previous_line_with_same_indentation
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


