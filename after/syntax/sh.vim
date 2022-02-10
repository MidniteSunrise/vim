if minimalmistakes#should_abort('bash', 'ksh', 'posix', 'sh')
    finish
endif

hi! link shCommandSub NONE
hi! link shEscape     MinimalMistakesRed
hi! link shParen      NONE
hi! link shParenError NONE
