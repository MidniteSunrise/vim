if minimalmistakes#should_abort('rst')
    finish
endif

hi! link rstComment                             Comment
hi! link rstTransition                          Comment
hi! link rstCodeBlock                           MinimalMistakesGreen
hi! link rstInlineLiteral                       MinimalMistakesGreen
hi! link rstLiteralBlock                        MinimalMistakesGreen
hi! link rstQuotedLiteralBlock                  MinimalMistakesGreen
hi! link rstStandaloneHyperlink                 MinimalMistakesLink
hi! link rstStrongEmphasis                      MinimalMistakesOrangeBold
hi! link rstSections                            MinimalMistakesPurpleBold
hi! link rstEmphasis                            MinimalMistakesYellowItalic
hi! link rstDirective                           Keyword
hi! link rstSubstitutionDefinition              Keyword
hi! link rstCitation                            String
hi! link rstExDirective                         String
hi! link rstFootnote                            String
hi! link rstCitationReference                   Tag
hi! link rstFootnoteReference                   Tag
hi! link rstHyperLinkReference                  Tag
hi! link rstHyperlinkTarget                     Tag
hi! link rstInlineInternalTargets               Tag
hi! link rstInterpretedTextOrHyperlinkReference Tag
hi! link rstTodo                                Todo
