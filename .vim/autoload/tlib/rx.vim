" rx.vim
" @Author:      Thomas Link (mailto:samul AT web de?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-07-20.
" @Last Change: 2007-07-27.
" @Revision:    0.0.10

if &cp || exists("loaded_tlib_rx_autoload")
    finish
endif
let loaded_tlib_rx_autoload = 1


" :def: function! tlib#rx#Escape(text, ?magic='m')
" magic can be one of: m, M, v, V
" See :help 'magic'
function! tlib#rx#Escape(text, ...) "{{{3
    exec tlib#arg#Let([['magic', 'm']])
    if magic ==# 'm'
        let chars = '^$.*\[]~'
    elseif magic ==# 'M'
        " echoerr 'tlib: Unsupported magic type'
        let chars = '^$\'
    elseif magic ==# 'V'
        let chars = '\'
    elseif magic ==# 'v'
        let chars = '^$.*+\()|{}[]~'
    else
        echoerr 'tlib: Unsupported magic type'
    endif
    return escape(a:text, chars)
endf

