if minimalmistakes#should_abort('gitcommit')
    finish
endif

" The following two are misnomers. Colors are correct.
hi! link diffFile    MinimalMistakesGreen
hi! link diffNewFile MinimalMistakesRed

hi! link diffAdded   MinimalMistakesGreen
hi! link diffLine    MinimalMistakesCyanItalic
hi! link diffRemoved MinimalMistakesRed

