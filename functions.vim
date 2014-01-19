function! ISO_Date()
    return strftime('%Y-%m-%d')
endfunction

function! ISO_Time()
    return strftime('%Y-%m-%dT%H:%M:%S')
endfunction
