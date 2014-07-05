nnoremap ZM :w<CR>:execute '!markdown % > ' . expand('%:r') . '.html'<CR>
