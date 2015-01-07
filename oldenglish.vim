function! EasyOE()
  " Don't use the digraphs directly; use the mappings
  digraph dh 240  " lowercase crossed d
  digraph DH 208  " uppercase crossed d
  digraph ~1 483  " lowercase ash with macron
  digraph ~2 482  " uppercase ash with macron
  digraph ~[ 8988 " quasi-quote left
  digraph ~] 8989 " quasi-quote right
  digraph y- 563  " lowercase y with macron
  digraph Y- 562  " uppercase y with macron

  " alt-vowel (aeiouyAEIOUY) to type that vowel with a macron.
  " alt-' and alt-< to type ash with/without a macron.
  noremap! <A-a> <C-k>a-
  noremap! <A-A> <C-k>A-
  noremap! <A-~> <C-k>~-
  noremap! <A-e> <C-k>e-
  noremap! <A-E> <C-k>E-
  noremap! <A-i> <C-k>i-
  noremap! <A-I> <C-k>I-
  noremap! <A-o> <C-k>o-
  noremap! <A-O> <C-k>O-
  noremap! <A-u> <C-k>u-
  noremap! <A-U> <C-k>U-
  noremap! <A-y> <C-k>y-
  noremap! <A-Y> <C-k>Y-
  noremap! <A-,> <C-k>ae
  noremap! <A-<> <C-k>AE
  noremap! <A-'> <C-k>~1
  noremap! <A-"> <C-k>~2

  " alt-[tThH] to type thorn and eth
  noremap! <A-t> <C-k>th
  noremap! <A-S-t> <C-k>TH
  noremap! <A-h> <C-k>dh
  noremap! <A-S-h> <C-k>DH

  " alt-[.cr] to type degree symbol and quasi-quotes
  noremap! <A-.> <A-0>
  noremap! <A-c> <C-k>~[
  noremap! <A-r> <C-k>~]
  inoremap ae <C-k>ae
  inoremap Ae <C-k>AE
  inoremap th <C-k>th
  inoremap Th <C-k>TH
  inoremap dh <C-k>dh
  inoremap Dh <C-k>DH
endfunction
command! EasyOE call EasyOE()
