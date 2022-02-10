" MinimalMistakes Theme: {{{
"
" https://github.com/zenorocha/minimalmistakes-theme
"
" Copyright 2016, All rights reserved
"
" Code licensed under the MIT license
" http://zenorocha.mit-license.org
"
" @author Trevor Heins <@heinst>
" @author Éverton Ribeiro <nuxlli@gmail.com>
" @author Derek Sifford <dereksifford@gmail.com>
" @author Zeno Rocha <hi@zenorocha.com>
scriptencoding utf8
" }}}

" Configuration: {{{

if v:version > 580
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name = 'minimalmistakes'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" Palette: {{{2

let s:fg        = g:minimalmistakes#palette.fg

let s:bglighter = g:minimalmistakes#palette.bglighter
let s:bglight   = g:minimalmistakes#palette.bglight
let s:bg        = g:minimalmistakes#palette.bg
let s:bgdark    = g:minimalmistakes#palette.bgdark
let s:bgdarker  = g:minimalmistakes#palette.bgdarker

let s:comment   = g:minimalmistakes#palette.comment
let s:selection = g:minimalmistakes#palette.selection
let s:subtle    = g:minimalmistakes#palette.subtle

let s:cyan      = g:minimalmistakes#palette.cyan
let s:green     = g:minimalmistakes#palette.green
let s:orange    = g:minimalmistakes#palette.orange
let s:pink      = g:minimalmistakes#palette.pink
let s:purple    = g:minimalmistakes#palette.purple
let s:red       = g:minimalmistakes#palette.red
let s:yellow    = g:minimalmistakes#palette.yellow

let s:none      = ['NONE', 'NONE']

if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:minimalmistakes#palette['color_' . s:i]
  endfor
endif

if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:minimalmistakes#palette['color_' . s:i])
  endfor
endif

" }}}2
" User Configuration: {{{2

if !exists('g:minimalmistakes_bold')
  let g:minimalmistakes_bold = 1
endif

if !exists('g:minimalmistakes_italic')
  let g:minimalmistakes_italic = 1
endif

if !exists('g:minimalmistakes_underline')
  let g:minimalmistakes_underline = 1
endif

if !exists('g:minimalmistakes_undercurl')
  let g:minimalmistakes_undercurl = g:minimalmistakes_underline
endif

if !exists('g:minimalmistakes_full_special_attrs_support')
  let g:minimalmistakes_full_special_attrs_support = has('gui_running')
endif

if !exists('g:minimalmistakes_inverse')
  let g:minimalmistakes_inverse = 1
endif

if !exists('g:minimalmistakes_colorterm')
  let g:minimalmistakes_colorterm = 1
endif

"}}}2
" Script Helpers: {{{2

let s:attrs = {
      \ 'bold': g:minimalmistakes_bold == 1 ? 'bold' : 0,
      \ 'italic': g:minimalmistakes_italic == 1 ? 'italic' : 0,
      \ 'underline': g:minimalmistakes_underline == 1 ? 'underline' : 0,
      \ 'undercurl': g:minimalmistakes_undercurl == 1 ? 'undercurl' : 0,
      \ 'inverse': g:minimalmistakes_inverse == 1 ? 'inverse' : 0,
      \}

function! s:h(scope, fg, ...) " bg, attr_list, special
  let l:fg = copy(a:fg)
  let l:bg = get(a:, 1, ['NONE', 'NONE'])

  let l:attr_list = filter(get(a:, 2, ['NONE']), 'type(v:val) == 1')
  let l:attrs = len(l:attr_list) > 0 ? join(l:attr_list, ',') : 'NONE'

  " If the UI does not have full support for special attributes (like underline and
  " undercurl) and the highlight does not explicitly set the foreground color,
  " make the foreground the same as the attribute color to ensure the user will
  " get some highlight if the attribute is not supported. The default behavior
  " is to assume that terminals do not have full support, but the user can set
  " the global variable `g:minimalmistakes_full_special_attrs_support` explicitly if the
  " default behavior is not desirable.
  let l:special = get(a:, 3, ['NONE', 'NONE'])
  if l:special[0] !=# 'NONE' && l:fg[0] ==# 'NONE' && !g:minimalmistakes_full_special_attrs_support
    let l:fg[0] = l:special[0]
    let l:fg[1] = l:special[1]
  endif

  let l:hl_string = [
        \ 'highlight', a:scope,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:attrs, 'cterm=' . l:attrs,
        \ 'guisp=' . l:special[0],
        \]

  execute join(l:hl_string, ' ')
endfunction

"}}}2
" MinimalMistakes Highlight Groups: {{{2

call s:h('MinimalMistakesBgLight', s:none, s:bglight)
call s:h('MinimalMistakesBgLighter', s:none, s:bglighter)
call s:h('MinimalMistakesBgDark', s:none, s:bgdark)
call s:h('MinimalMistakesBgDarker', s:none, s:bgdarker)

call s:h('MinimalMistakesFg', s:fg)
call s:h('MinimalMistakesFgUnderline', s:fg, s:none, [s:attrs.underline])
call s:h('MinimalMistakesFgBold', s:fg, s:none, [s:attrs.bold])

call s:h('MinimalMistakesComment', s:comment)
call s:h('MinimalMistakesCommentBold', s:comment, s:none, [s:attrs.bold])

call s:h('MinimalMistakesSelection', s:none, s:selection)

call s:h('MinimalMistakesSubtle', s:subtle)

call s:h('MinimalMistakesCyan', s:cyan)
call s:h('MinimalMistakesCyanItalic', s:cyan, s:none, [s:attrs.italic])

call s:h('MinimalMistakesGreen', s:green)
call s:h('MinimalMistakesGreenBold', s:green, s:none, [s:attrs.bold])
call s:h('MinimalMistakesGreenItalic', s:green, s:none, [s:attrs.italic])
call s:h('MinimalMistakesGreenItalicUnderline', s:green, s:none, [s:attrs.italic, s:attrs.underline])

call s:h('MinimalMistakesOrange', s:orange)
call s:h('MinimalMistakesOrangeBold', s:orange, s:none, [s:attrs.bold])
call s:h('MinimalMistakesOrangeItalic', s:orange, s:none, [s:attrs.italic])
call s:h('MinimalMistakesOrangeBoldItalic', s:orange, s:none, [s:attrs.bold, s:attrs.italic])
call s:h('MinimalMistakesOrangeInverse', s:bg, s:orange)

call s:h('MinimalMistakesPink', s:pink)
call s:h('MinimalMistakesPinkItalic', s:pink, s:none, [s:attrs.italic])

call s:h('MinimalMistakesPurple', s:purple)
call s:h('MinimalMistakesPurpleBold', s:purple, s:none, [s:attrs.bold])
call s:h('MinimalMistakesPurpleItalic', s:purple, s:none, [s:attrs.italic])

call s:h('MinimalMistakesRed', s:red)
call s:h('MinimalMistakesRedInverse', s:fg, s:red)

call s:h('MinimalMistakesYellow', s:yellow)
call s:h('MinimalMistakesYellowItalic', s:yellow, s:none, [s:attrs.italic])

call s:h('MinimalMistakesError', s:red, s:none, [], s:red)

call s:h('MinimalMistakesErrorLine', s:none, s:none, [s:attrs.undercurl], s:red)
call s:h('MinimalMistakesWarnLine', s:none, s:none, [s:attrs.undercurl], s:orange)
call s:h('MinimalMistakesInfoLine', s:none, s:none, [s:attrs.undercurl], s:cyan)

call s:h('MinimalMistakesTodo', s:cyan, s:none, [s:attrs.bold, s:attrs.inverse])
call s:h('MinimalMistakesSearch', s:green, s:none, [s:attrs.inverse])
call s:h('MinimalMistakesBoundary', s:comment, s:bgdark)
call s:h('MinimalMistakesLink', s:cyan, s:none, [s:attrs.underline])

call s:h('MinimalMistakesDiffChange', s:orange, s:none)
call s:h('MinimalMistakesDiffText', s:bg, s:orange)
call s:h('MinimalMistakesDiffDelete', s:red, s:bgdark)

" }}}2

" }}}
" User Interface: {{{

set background=dark

" Required as some plugins will overwrite
call s:h('Normal', s:fg, g:minimalmistakes_colorterm || has('gui_running') ? s:bg : s:none )
call s:h('StatusLine', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineNC', s:none, s:bglight)
call s:h('StatusLineTerm', s:none, s:bglighter, [s:attrs.bold])
call s:h('StatusLineTermNC', s:none, s:bglight)
call s:h('WildMenu', s:bg, s:purple, [s:attrs.bold])
call s:h('CursorLine', s:none, s:subtle)

hi! link ColorColumn  MinimalMistakesBgDark
hi! link CursorColumn CursorLine
hi! link CursorLineNr MinimalMistakesYellow
hi! link DiffAdd      MinimalMistakesGreen
hi! link DiffAdded    DiffAdd
hi! link DiffChange   MinimalMistakesDiffChange
hi! link DiffDelete   MinimalMistakesDiffDelete
hi! link DiffRemoved  DiffDelete
hi! link DiffText     MinimalMistakesDiffText
hi! link Directory    MinimalMistakesPurpleBold
hi! link ErrorMsg     MinimalMistakesRedInverse
hi! link FoldColumn   MinimalMistakesSubtle
hi! link Folded       MinimalMistakesBoundary
hi! link IncSearch    MinimalMistakesOrangeInverse
call s:h('LineNr', s:comment)
hi! link MoreMsg      MinimalMistakesFgBold
hi! link NonText      MinimalMistakesSubtle
hi! link Pmenu        MinimalMistakesBgDark
hi! link PmenuSbar    MinimalMistakesBgDark
hi! link PmenuSel     MinimalMistakesSelection
hi! link PmenuThumb   MinimalMistakesSelection
hi! link Question     MinimalMistakesFgBold
hi! link Search       MinimalMistakesSearch
call s:h('SignColumn', s:comment)
hi! link TabLine      MinimalMistakesBoundary
hi! link TabLineFill  MinimalMistakesBgDark
hi! link TabLineSel   Normal
hi! link Title        MinimalMistakesGreenBold
hi! link VertSplit    MinimalMistakesBoundary
hi! link Visual       MinimalMistakesSelection
hi! link VisualNOS    Visual
hi! link WarningMsg   MinimalMistakesOrangeInverse

" }}}
" Syntax: {{{

" Required as some plugins will overwrite
call s:h('MatchParen', s:green, s:none, [s:attrs.underline])
call s:h('Conceal', s:cyan, s:none)

" Neovim uses SpecialKey for escape characters only. Vim uses it for that, plus whitespace.
if has('nvim')
  hi! link SpecialKey MinimalMistakesRed
  hi! link LspReferenceText MinimalMistakesSelection
  hi! link LspReferenceRead MinimalMistakesSelection
  hi! link LspReferenceWrite MinimalMistakesSelection
  " Link old 'LspDiagnosticsDefault*' hl groups
  " for backward compatibility with neovim v0.5.x
  hi! link LspDiagnosticsDefaultInformation DiagnosticInfo
  hi! link LspDiagnosticsDefaultHint DiagnosticHint
  hi! link LspDiagnosticsDefaultError DiagnosticError
  hi! link LspDiagnosticsDefaultWarning DiagnosticWarn
  hi! link LspDiagnosticsUnderlineError DiagnosticUnderlineError
  hi! link LspDiagnosticsUnderlineHint DiagnosticUnderlineHint
  hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
  hi! link LspDiagnosticsUnderlineWarning DiagnosticUnderlineWarn

  hi! link DiagnosticInfo MinimalMistakesCyan
  hi! link DiagnosticHint MinimalMistakesCyan
  hi! link DiagnosticError MinimalMistakesError
  hi! link DiagnosticWarn MinimalMistakesOrange
  hi! link DiagnosticUnderlineError MinimalMistakesErrorLine
  hi! link DiagnosticUnderlineHint MinimalMistakesInfoLine
  hi! link DiagnosticUnderlineInfo MinimalMistakesInfoLine
  hi! link DiagnosticUnderlineWarn MinimalMistakesWarnLine
else
  hi! link SpecialKey MinimalMistakesPink
endif

hi! link Comment MinimalMistakesComment
hi! link Underlined MinimalMistakesFgUnderline
hi! link Todo MinimalMistakesTodo

hi! link Error MinimalMistakesError
hi! link SpellBad MinimalMistakesErrorLine
hi! link SpellLocal MinimalMistakesWarnLine
hi! link SpellCap MinimalMistakesInfoLine
hi! link SpellRare MinimalMistakesInfoLine

hi! link Constant MinimalMistakesPurple
hi! link String MinimalMistakesYellow
hi! link Character MinimalMistakesPink
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link Identifier MinimalMistakesFg
hi! link Function MinimalMistakesGreen

hi! link Statement MinimalMistakesPink
hi! link Conditional MinimalMistakesPink
hi! link Repeat MinimalMistakesPink
hi! link Label MinimalMistakesPink
hi! link Operator MinimalMistakesPink
hi! link Keyword MinimalMistakesPink
hi! link Exception MinimalMistakesPink

hi! link PreProc MinimalMistakesPink
hi! link Include MinimalMistakesPink
hi! link Define MinimalMistakesPink
hi! link Macro MinimalMistakesPink
hi! link PreCondit MinimalMistakesPink
hi! link StorageClass MinimalMistakesPink
hi! link Structure MinimalMistakesPink
hi! link Typedef MinimalMistakesPink

hi! link Type MinimalMistakesCyanItalic

hi! link Delimiter MinimalMistakesFg

hi! link Special MinimalMistakesPink
hi! link SpecialComment MinimalMistakesCyanItalic
hi! link Tag MinimalMistakesCyan
hi! link helpHyperTextJump MinimalMistakesLink
hi! link helpCommand MinimalMistakesPurple
hi! link helpExample MinimalMistakesGreen
hi! link helpBacktick Special

"}}}

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0 et:
