if minimalmistakes#should_abort()
  finish
endif

" Fzf: {{{
if exists('g:loaded_fzf') && ! exists('g:fzf_colors')
  let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Search'],
    \ 'fg+':     ['fg', 'Normal'],
    \ 'bg+':     ['bg', 'Normal'],
    \ 'hl+':     ['fg', 'MinimalMistakesOrange'],
    \ 'info':    ['fg', 'MinimalMistakesPurple'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'MinimalMistakesGreen'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'],
    \}
endif
"}}}
" ALE: {{{
if exists('g:ale_enabled')
  hi! link ALEError              MinimalMistakesErrorLine
  hi! link ALEWarning            MinimalMistakesWarnLine
  hi! link ALEInfo               MinimalMistakesInfoLine

  hi! link ALEErrorSign          MinimalMistakesRed
  hi! link ALEWarningSign        MinimalMistakesOrange
  hi! link ALEInfoSign           MinimalMistakesCyan

  hi! link ALEVirtualTextError   Comment
  hi! link ALEVirtualTextWarning Comment
endif
" }}}
" CtrlP: {{{
if exists('g:loaded_ctrlp')
  hi! link CtrlPMatch     IncSearch
  hi! link CtrlPBufferHid Normal
endif
" }}}
" GitGutter / gitsigns: {{{
if exists('g:loaded_gitgutter')
  hi! link GitGutterAdd    DiffAdd
  hi! link GitGutterChange DiffChange
  hi! link GitGutterDelete DiffDelete
endif
if has('nvim-0.5') && luaeval("pcall(require, 'gitsigns')")
  " https://github.com/lewis6991/gitsigns.nvim requires nvim > 0.5
  " has('nvim-0.5') checks >= 0.5, so this should be future-proof.
  hi! link GitSignsAdd      DiffAdd
  hi! link GitSignsAddLn    DiffAdd
  hi! link GitSignsAddNr    DiffAdd
  hi! link GitSignsChange   DiffChange
  hi! link GitSignsChangeLn DiffChange
  hi! link GitSignsChangeNr DiffChange
  hi! link GitSignsDelete   DiffDelete
  hi! link GitSignsDeleteLn DiffDelete
  hi! link GitSignsDeleteNr DiffDelete
endif
" }}}
" Tree-sitter: {{{
" The nvim-treesitter library defines many global highlight groups that are
" linked to the regular vim syntax highlight groups. We only need to redefine
" those highlight groups when the defaults do not match the minimalmistakes
" specification.
" https://github.com/nvim-treesitter/nvim-treesitter/blob/master/plugin/nvim-treesitter.vim
if exists('g:loaded_nvim_treesitter')
  " # Misc
  hi! link TSPunctSpecial Special
  " # Constants
  hi! link TSConstMacro Macro
  hi! link TSStringEscape Character
  hi! link TSSymbol MinimalMistakesPurple
  hi! link TSAnnotation MinimalMistakesYellow
  hi! link TSAttribute MinimalMistakesGreenItalic
  " # Functions
  hi! link TSFuncBuiltin MinimalMistakesCyan
  hi! link TSFuncMacro Function
  hi! link TSParameter MinimalMistakesOrangeItalic
  hi! link TSParameterReference MinimalMistakesOrange
  hi! link TSField MinimalMistakesOrange
  hi! link TSConstructor MinimalMistakesCyan
  " # Keywords
  hi! link TSLabel MinimalMistakesPurpleItalic
  " # Variable
  hi! link TSVariableBuiltin MinimalMistakesPurpleItalic
  " # Text
  hi! link TSStrong MinimalMistakesFgBold
  hi! link TSEmphasis MinimalMistakesFg
  hi! link TSUnderline Underlined
  hi! link TSTitle MinimalMistakesYellow
  hi! link TSLiteral MinimalMistakesYellow
  hi! link TSURI MinimalMistakesYellow
  " HTML and JSX tag attributes. By default, this group is linked to TSProperty,
  " which in turn links to Identifer (white).
  hi! link TSTagAttribute MinimalMistakesGreenItalic
endif
" }}}
" nvim-cmp: {{{
" A completion engine plugin for neovim written in Lua.
" https://github.com/hrsh7th/nvim-cmp
if exists('g:loaded_cmp')
  hi! link CmpItemAbbrDeprecated MinimalMistakesError

  hi! link CmpItemAbbrMatch MinimalMistakesCyan
  hi! link CmpItemAbbrMatchFuzzy MinimalMistakesCyan

  hi! link CmpItemKindText MinimalMistakesFg
  hi! link CmpItemKindMethod Function
  hi! link CmpItemKindFunction Function
  hi! link CmpItemKindConstructor MinimalMistakesCyan
  hi! link CmpItemKindField MinimalMistakesOrange
  hi! link CmpItemKindVariable MinimalMistakesPurpleItalic
  hi! link CmpItemKindClass MinimalMistakesCyan
  hi! link CmpItemKindInterface MinimalMistakesCyan
  hi! link CmpItemKindModule MinimalMistakesYellow
  hi! link CmpItemKindProperty MinimalMistakesPink
  hi! link CmpItemKindUnit MinimalMistakesFg
  hi! link CmpItemKindValue MinimalMistakesYellow
  hi! link CmpItemKindEnum MinimalMistakesPink
  hi! link CmpItemKindKeyword MinimalMistakesPink
  hi! link CmpItemKindSnippet MinimalMistakesFg
  hi! link CmpItemKindColor MinimalMistakesYellow
  hi! link CmpItemKindFile MinimalMistakesYellow
  hi! link CmpItemKindReference MinimalMistakesOrange
  hi! link CmpItemKindFolder MinimalMistakesYellow
  hi! link CmpItemKindEnumMember MinimalMistakesPurple
  hi! link CmpItemKindConstant MinimalMistakesPurple
  hi! link CmpItemKindStruct MinimalMistakesPink
  hi! link CmpItemKindEvent MinimalMistakesFg
  hi! link CmpItemKindOperator MinimalMistakesPink
  hi! link CmpItemKindTypeParameter MinimalMistakesCyan

  hi! link CmpItemMenu Comment
endif
" }}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
