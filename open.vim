" Open new line with no indent
  "below
nnoremap <Leader>od o<Esc>i
  "2 below
nnoremap <Leader>on o<Esc>o
  "above
nnoremap <Leader>oD O<Esc>i

" [O]pen [s]pace -- open 20 lines below, keeping cursor position
nnoremap <Leader>os ma20o<Esc>`a

" Open new line, Lisp-style
nnoremap <Leader>ol :set lisp<CR>o <C-O>:set nolisp<CR><C-H>
