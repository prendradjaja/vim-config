let g:submode_timeoutlen = 3000

function! RepeatableMap(modename, prefix, command)
    let l:wholecommand = a:prefix . a:command
    call submode#enter_with(a:modename, 'n', '', l:wholecommand, l:wholecommand)
    call submode#map(a:modename, 'n', '', a:command, l:wholecommand)
endfunction

call submode#enter_with('wrap-scroll', 'n', '', 'zl', 'zl')
call submode#enter_with('wrap-scroll', 'n', '', 'zh', 'zh')
call submode#enter_with('wrap-scroll', 'n', '', 'z<c-l>', '5zl')
call submode#enter_with('wrap-scroll', 'n', '', 'z<c-h>', '5zh')
call submode#enter_with('wrap-scroll', 'n', '', 'zL', 'zL')
call submode#enter_with('wrap-scroll', 'n', '', 'zH', 'zH')
call submode#map('wrap-scroll', 'n', '', 'l', 'zl')
call submode#map('wrap-scroll', 'n', '', 'h', 'zh')
call submode#map('wrap-scroll', 'n', '', '<c-l>', '5zl')
call submode#map('wrap-scroll', 'n', '', '<c-h>', '5zh')
call submode#map('wrap-scroll', 'n', '', 'L', 'zL')
call submode#map('wrap-scroll', 'n', '', 'H', 'zH')

call submode#enter_with('section-nav', 'n', '', ']]', ']]zt')
call submode#enter_with('section-nav', 'n', '', '[[', '[[zt')
call submode#map('section-nav', 'n', '', ']', ']]zt')
call submode#map('section-nav', 'n', '', '[', '[[zt')

call RepeatableMap('resize-window', '<c-w>', '-')
call RepeatableMap('resize-window', '<c-w>', '+')
call RepeatableMap('resize-window', '<c-w>', '>')
call RepeatableMap('resize-window', '<c-w>', '<')

" The above is the same as this:
"   call submode#enter_with('resize-window', 'n', '', '<c-w>-', '<c-w>-')
"   call submode#enter_with('resize-window', 'n', '', '<c-w>+', '<c-w>+')
"   call submode#enter_with('resize-window', 'n', '', '<c-w>>', '<c-w>>')
"   call submode#enter_with('resize-window', 'n', '', '<c-w><', '<c-w><')
"   call submode#map('resize-window', 'n', '', '-', '<c-w>-')
"   call submode#map('resize-window', 'n', '', '+', '<c-w>+')
"   call submode#map('resize-window', 'n', '', '>', '<c-w>>')
"   call submode#map('resize-window', 'n', '', '<', '<c-w><')
