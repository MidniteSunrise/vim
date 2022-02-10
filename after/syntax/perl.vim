if minimalmistakes#should_abort('perl')
    finish
endif

" Regex
hi! link perlMatchStartEnd       MinimalMistakesRed

" Builtin functions
hi! link perlOperator            MinimalMistakesCyan
hi! link perlStatementFiledesc   MinimalMistakesCyan
hi! link perlStatementFiles      MinimalMistakesCyan
hi! link perlStatementFlow       MinimalMistakesCyan
hi! link perlStatementHash       MinimalMistakesCyan
hi! link perlStatementIOfunc     MinimalMistakesCyan
hi! link perlStatementIPC        MinimalMistakesCyan
hi! link perlStatementList       MinimalMistakesCyan
hi! link perlStatementMisc       MinimalMistakesCyan
hi! link perlStatementNetwork    MinimalMistakesCyan
hi! link perlStatementNumeric    MinimalMistakesCyan
hi! link perlStatementProc       MinimalMistakesCyan
hi! link perlStatementPword      MinimalMistakesCyan
hi! link perlStatementRegexp     MinimalMistakesCyan
hi! link perlStatementScalar     MinimalMistakesCyan
hi! link perlStatementSocket     MinimalMistakesCyan
hi! link perlStatementTime       MinimalMistakesCyan
hi! link perlStatementVector     MinimalMistakesCyan

" Highlighting for quoting constructs, tied to existing option in vim-perl
if get(g:, 'perl_string_as_statement', 0)
  hi! link perlStringStartEnd MinimalMistakesRed
endif

" Signatures
hi! link perlSignature           MinimalMistakesOrangeItalic
hi! link perlSubPrototype        MinimalMistakesOrangeItalic

" Hash keys
hi! link perlVarSimpleMemberName MinimalMistakesPurple
