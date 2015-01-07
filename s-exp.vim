function! SExpMode()
    setf lisp
    nnoremap ZM :call SyntaxTreeCopy()<CR>
    inoremap <C-S> ()<Left>
    " inoremap <C-N> <Right><CR>
    " inoremap <C-T> <Esc>kJa<CR>
    inoremap <C-N> <Right><CR><Esc>:call MergeParenUp()<CR>a
endfunction
command! SExpMode call SExpMode()

function! MergeParenUp()
    " If previous line just has one paren, merge it with line above
    " Then return cursor to its starting position, which should be just before
    " a paren
    let prevline = getline(line('.')-1)
    if substitute(prevline, ' ', '', 'g') == ')'
        -2,-1join
        normal! h
    endif
endfunction
