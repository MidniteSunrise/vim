" Palette: {{{

let g:minimalmistakes#palette           = {}
let g:minimalmistakes#palette.fg        = ['#e5e9f0', 253]

let g:minimalmistakes#palette.bglighter = ['#46545e', 238]
let g:minimalmistakes#palette.bglight   = ['#3c4852', 237]
let g:minimalmistakes#palette.bg        = ['#283036', 236]
let g:minimalmistakes#palette.bgdark    = ['#2f3940', 235]
let g:minimalmistakes#palette.bgdarker  = ['#20262b', 234]

let g:minimalmistakes#palette.comment   = ['#81a0c1',  61]
let g:minimalmistakes#palette.selection = ['#46545e', 239]
let g:minimalmistakes#palette.subtle    = ['#46545e', 238]

let g:minimalmistakes#palette.cyan      = ['#59fff9', 117]
let g:minimalmistakes#palette.green     = ['#59ff59',  84]
let g:minimalmistakes#palette.orange    = ['#ff9c59', 215]
let g:minimalmistakes#palette.pink      = ['#ff59f9', 212]
let g:minimalmistakes#palette.purple    = ['#9059ff', 141]
let g:minimalmistakes#palette.red       = ['#FF5555', 203]
let g:minimalmistakes#palette.yellow    = ['#ffff59', 228]

"
" ANSI
"
let g:minimalmistakes#palette.color_0  = '#283036'
let g:minimalmistakes#palette.color_1  = '#ff5959'
let g:minimalmistakes#palette.color_2  = '#59ff59'
let g:minimalmistakes#palette.color_3  = '#ffff59'
let g:minimalmistakes#palette.color_4  = '#9059ff'
let g:minimalmistakes#palette.color_5  = '#ff59f9'
let g:minimalmistakes#palette.color_6  = '#59fff9'
let g:minimalmistakes#palette.color_7  = '#e5e9f0'
let g:minimalmistakes#palette.color_8  = '#43515e'
let g:minimalmistakes#palette.color_9  = '#ffa6a6'
let g:minimalmistakes#palette.color_10 = '#a6ffa6'
let g:minimalmistakes#palette.color_11 = '#ffffa6'
let g:minimalmistakes#palette.color_12 = '#c5a6ff'
let g:minimalmistakes#palette.color_13 = '#ffa6fc'
let g:minimalmistakes#palette.color_14 = '#a6fffc'
let g:minimalmistakes#palette.color_15 = '#e5e9f0'

" }}}

" Helper function that takes a variadic list of filetypes as args and returns
" whether or not the execution of the ftplugin should be aborted.
func! minimalmistakes#should_abort(...)
    if ! exists('g:colors_name') || g:colors_name !=# 'minimalmistakes'
        return 1
    elseif a:0 > 0 && (! exists('b:current_syntax') || index(a:000, b:current_syntax) == -1)
        return 1
    endif
    return 0
endfunction

" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0:
