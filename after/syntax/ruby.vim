if minimalmistakes#should_abort('ruby')
    finish
endif

if ! exists('g:ruby_operators')
    let g:ruby_operators=1
endif

hi! link rubyBlockArgument          MinimalMistakesOrangeItalic
hi! link rubyBlockParameter         MinimalMistakesOrangeItalic
hi! link rubyCurlyBlock             MinimalMistakesPink
hi! link rubyGlobalVariable         MinimalMistakesPurple
hi! link rubyInstanceVariable       MinimalMistakesPurpleItalic
hi! link rubyInterpolationDelimiter MinimalMistakesPink
hi! link rubyRegexpDelimiter        MinimalMistakesRed
hi! link rubyStringDelimiter        MinimalMistakesYellow
