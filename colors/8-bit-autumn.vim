" Vim colour file
" Maintainer:   Antony Scriven <ad_scriven@postmaster.co.uk>
" Last Change:  2003-06-12
" Modified by:  Pandu Rendradjaja. My modifications do not attempt to support 8-color terminals.
"
set background=light
hi clear
if exists("syntax_on")
        syntax reset
endif

let colors_name = "8-bit-autumn"

hi  Normal        gui=none       guifg=#000000  guibg=#eeeeee
hi  Cursor        gui=none       guifg=#000000  guibg=#ff0000
hi  DiffAdd       gui=none       guifg=#eeeeee  guibg=#000080
hi  DiffChange    gui=none       guifg=#eeeeee  guibg=#800080
hi  DiffDelete    gui=none       guifg=#729fcf  guibg=#008080
hi  difftext      gui=bold       guifg=#eeeeee  guibg=#ff0000
hi  Directory     gui=none       guifg=#ff0000  guibg=#eeeeee
hi  ErrorMsg      gui=none       guifg=#eeeeee  guibg=#cc0000
hi  Folded        gui=none       guifg=#000080  guibg=#c0c0c0
hi  FoldColumn    gui=none       guifg=#000080  guibg=#a8a8a8
hi  IncSearch     gui=none       guifg=#ffff00  guibg=#008000
hi  lCursor       gui=none       guifg=#000000  guibg=#00ffff
hi  LineNr        gui=none       guifg=#cc0000  guibg=#c6c6c6
hi  ModeMsg       gui=none       guifg=#008700  guibg=#afd7af
hi  MoreMsg       gui=none       guifg=#008000  guibg=#eeeeee
hi  Question      gui=none       guifg=#008000  guibg=#eeeeee
hi  Search        gui=none       guifg=#000000  guibg=#ffff00
hi  SpecialKey    gui=none       guifg=#729fcf  guibg=#eeeeee
hi  NonText       gui=none       guifg=#6c6c6c  guibg=#eeeeee
hi  StatusLine    gui=none       guifg=#875f00  guibg=#d7d787
hi  Title         gui=none       guifg=#800080  guibg=#eeeeee
hi  Visual        gui=none       guifg=#000000  guibg=#87ff87
hi  VertSplit     gui=none       guifg=#6c6c6c  guibg=#6c6c6c
hi  StatusLineNC  gui=none       guifg=#6c6c6c  guibg=#c0c0c0
hi  Comment       gui=none       guifg=#cc0000  guibg=#dadada
hi  VisualNOS     gui=none       guifg=#a8a8a8  guibg=#000000
hi  WarningMsg    gui=none       guifg=#ff0000  guibg=#eeeeee
hi  WildMenu      gui=none       guifg=#000080  guibg=#ffff00
"
hi  Constant      gui=none       guifg=#cc0000  guibg=bg
hi  Special       gui=none       guifg=#008080  guibg=#eeeeee
hi  identifier    gui=none       guifg=#800080  guibg=#eeeeee
hi  statement     gui=none       guifg=#008000  guibg=#eeeeee
hi  preproc       gui=none       guifg=#6c6c6c  guibg=#eeeeee
hi  type          gui=none       guifg=#af5f00  guibg=#eeeeee
hi  underlined    gui=underline  guifg=#800080  guibg=#eeeeee
hi  Ignore        gui=none       guifg=#c0c0c0  guibg=#eeeeee
hi  todo          gui=none       guifg=#ffff00  guibg=#af5f00
hi  function      gui=none       guifg=#729fcf  guibg=#eeeeee

function! Aoeu()
    oeu
endfunction

"
hi  ColorColumn   guibg=#d3d7cf
hi  CursorLine    guibg=#ffff00

hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Conditional     Statement
hi link Repeat          Statement
hi link Label           Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
hi link vimfunction     function

"  vim:  set  ts=8  sw=8  et  sts=8  tw=72  fo-=t  ff=unix  :
