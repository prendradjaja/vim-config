" A bunch of mappings for opening new lines in various ways

" With no indent -- 3 below, 2 below, 1 below, 1 above, 2 above, 3 above
nnoremap <Leader>oen o<Esc>o<Esc>o
nnoremap <Leader>on o<Esc>o
nnoremap <Leader>od o<Esc>i
nnoremap <Leader>oD O<Esc>i
nnoremap <Leader>ou O<Esc>O
nnoremap <Leader>oeu O<Esc>O<Esc>O

" 20 lines below, keeping cursor position
nnoremap <Leader>os ma20o<Esc>`a

" Lisp-style
nnoremap <Leader>ol :set lisp<CR>o <C-O>:set nolisp<CR><C-H>

" In the same column
nnoremap <Leader>oh :set ve=all<CR>mzo<Esc>`zji.<BS><C-O>:se ve=<CR>
nnoremap <Leader>oH :set ve=all<CR>mzO<Esc>`zki.<BS><C-O>:se ve=<CR>
