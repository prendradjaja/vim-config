" Number entry mode: aoeuidhtns = 1234567890, SPACE = hyphen
function! NumberEntryModeOn()
  inoremap a 1
  inoremap o 2
  inoremap e 3
  inoremap u 4
  inoremap i 5
  inoremap d 6
  inoremap h 7
  inoremap t 8
  inoremap n 9
  inoremap s 0
  inoremap , :
  inoremap <Space> -
  echo "  ~numberEntryMode"
endfunction

function! NumberEntryModeOff()
  iunmap a
  iunmap o
  iunmap e
  iunmap u
  iunmap i
  iunmap d
  iunmap h
  iunmap t
  iunmap n
  iunmap s
  inoremap ,
  iunmap <Space>
  echo "no~numberEntryMode"
endfunction
