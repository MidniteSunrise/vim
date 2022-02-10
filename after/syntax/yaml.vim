if minimalmistakes#should_abort('yaml')
    finish
endif

hi! link yamlAlias           MinimalMistakesGreenItalicUnderline
hi! link yamlAnchor          MinimalMistakesPinkItalic
hi! link yamlBlockMappingKey MinimalMistakesCyan
hi! link yamlFlowCollection  MinimalMistakesPink
hi! link yamlFlowIndicator   Delimiter
hi! link yamlNodeTag         MinimalMistakesPink
hi! link yamlPlainScalar     MinimalMistakesYellow

