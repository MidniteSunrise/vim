if minimalmistakes#should_abort('css')
    finish
endif

hi! link cssAttrComma         Delimiter
hi! link cssAttrRegion        MinimalMistakesPink
hi! link cssAttributeSelector MinimalMistakesGreenItalic
hi! link cssBraces            Delimiter
hi! link cssFunctionComma     Delimiter
hi! link cssNoise             MinimalMistakesPink
hi! link cssProp              MinimalMistakesCyan
hi! link cssPseudoClass       MinimalMistakesPink
hi! link cssPseudoClassId     MinimalMistakesGreenItalic
hi! link cssUnitDecorators    MinimalMistakesPink
hi! link cssVendor            MinimalMistakesGreenItalic
