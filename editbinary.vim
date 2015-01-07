function! ViewBinary()
    set display=uhex
    set wrap
endfunction
command! ViewBinary call ViewBinary()

function! DecodeBinary()
    %!xxd
endfunction
command! DecodeBinary call DecodeBinary()

function! EncodeBinary()
    %!xxd -r
endfunction
command! EncodeBinary call EncodeBinary()
