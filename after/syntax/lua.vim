if minimalmistakes#should_abort('lua')
    finish
endif

hi! link luaFunc  MinimalMistakesCyan
hi! link luaTable MinimalMistakesFg

" tbastos/vim-lua {{{

hi! link luaBraces       MinimalMistakesFg
hi! link luaBuiltIn      Constant
hi! link luaDocTag       Keyword
hi! link luaErrHand      MinimalMistakesCyan
hi! link luaFuncArgName  MinimalMistakesOrangeItalic
hi! link luaFuncCall     Function
hi! link luaLocal        Keyword
hi! link luaSpecialTable Constant
hi! link luaSpecialValue MinimalMistakesCyan

" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
