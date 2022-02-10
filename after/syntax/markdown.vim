if minimalmistakes#should_abort('markdown', 'mkd')
    finish
endif

if b:current_syntax ==# 'mkd'
" plasticboy/vim-markdown {{{1
  hi! link htmlBold       MinimalMistakesOrangeBold
  hi! link htmlBoldItalic MinimalMistakesOrangeBoldItalic
  hi! link htmlH1         MinimalMistakesPurpleBold
  hi! link htmlItalic     MinimalMistakesYellowItalic
  hi! link mkdBlockquote  MinimalMistakesYellowItalic
  hi! link mkdBold        MinimalMistakesOrangeBold
  hi! link mkdBoldItalic  MinimalMistakesOrangeBoldItalic
  hi! link mkdCode        MinimalMistakesGreen
  hi! link mkdCodeEnd     MinimalMistakesGreen
  hi! link mkdCodeStart   MinimalMistakesGreen
  hi! link mkdHeading     MinimalMistakesPurpleBold
  hi! link mkdInlineUrl   MinimalMistakesLink
  hi! link mkdItalic      MinimalMistakesYellowItalic
  hi! link mkdLink        MinimalMistakesPink
  hi! link mkdListItem    MinimalMistakesCyan
  hi! link mkdRule        MinimalMistakesComment
  hi! link mkdUrl         MinimalMistakesLink
"}}}1
elseif b:current_syntax ==# 'markdown'
" Builtin: {{{1
  hi! link markdownBlockquote        MinimalMistakesCyan
  hi! link markdownBold              MinimalMistakesOrangeBold
  hi! link markdownBoldItalic        MinimalMistakesOrangeBoldItalic
  hi! link markdownCodeBlock         MinimalMistakesGreen
  hi! link markdownCode              MinimalMistakesGreen
  hi! link markdownCodeDelimiter     MinimalMistakesGreen
  hi! link markdownH1                MinimalMistakesPurpleBold
  hi! link markdownH2                markdownH1
  hi! link markdownH3                markdownH1
  hi! link markdownH4                markdownH1
  hi! link markdownH5                markdownH1
  hi! link markdownH6                markdownH1
  hi! link markdownHeadingDelimiter  markdownH1
  hi! link markdownHeadingRule       markdownH1
  hi! link markdownItalic            MinimalMistakesYellowItalic
  hi! link markdownLinkText          MinimalMistakesPink
  hi! link markdownListMarker        MinimalMistakesCyan
  hi! link markdownOrderedListMarker MinimalMistakesCyan
  hi! link markdownRule              MinimalMistakesComment
  hi! link markdownUrl               MinimalMistakesLink
"}}}
endif

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
