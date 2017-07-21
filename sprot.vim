" todo add via :runtime sprot.vim -- but only after you generalize sprot_dir

let g:sprot_dir="~/projects/simple-productivity-tool"
function! Sprot()
  " TODO background color or something to tell me this is Sprot and not Vim?
  unmap <Space>
  nnoremap <Space> :ZZSprotOneLine<CR>

  nnoremap e       :ZZSprotOneLine<CR>
  nnoremap . mz:ZZSprotWholeFile<CR>`z
  nnoremap ` :w<CR>
  nnoremap o o<Esc>
  nnoremap a A
  set cul

  color codeschool

  nnoremap p :SprotPause<CR>
endfunction
command! Sprot call Sprot()

function! SprotPause()
  unmap <Space>
  map <Space> <Leader>

  unmap e
  unmap .
  unmap `
  unmap o
  unmap a
  set nocul

  color default

  nnoremap p :Sprot<CR>
endfunction
command! SprotPause call SprotPause()

function! ZZSprotOneLine()
  exec ".!" . g:sprot_dir . "/env/bin/python3 " . g:sprot_dir . "/sprot.py"
endfunction
command! ZZSprotOneLine call ZZSprotOneLine()

function! ZZSprotWholeFile()
  exec "%!" . g:sprot_dir . "/env/bin/python3 " . g:sprot_dir . "/sprot.py"
endfunction
command! ZZSprotWholeFile call ZZSprotWholeFile()

