" win.vim
" @Author:      Thomas Link (mailto:samul AT web de?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-08-24.
" @Last Change: 2007-08-25.
" @Revision:    0.0.27

if &cp || exists("loaded_tlib_win_autoload")
    finish
endif
let loaded_tlib_win_autoload = 1


" Return vim code to jump back to the original window.
function! tlib#win#SetWin(winnr) "{{{3
    if a:winnr > 0
        " TLogDBG winnr()
        if winnr() != a:winnr && winbufnr(a:winnr) != -1
            let rv = winnr().'wincmd w'
            exec a:winnr .'wincmd w'
            return rv
        endif
    endif
    return ''
endf
 

" :def: function! tlib#win#GetLayout(?save_view=0)
function! tlib#win#GetLayout(...) "{{{3
    TVarArg ['save_view', 0]
    let views = {}
    if save_view
        let winnr = winnr()
        for w in range(1, winnr('$'))
            call tlib#win#SetWin(w)
            let views[w] = winsaveview()
        endfor
        call tlib#win#SetWin(winnr)
    endif
    return [winnr('$'), winrestcmd(), views]
endf


function! tlib#win#SetLayout(layout) "{{{3
    let [wn, layout, views] = a:layout
    if wn == winnr('$')
        exec layout
        if !empty(views)
            let winnr = winnr()
            for [w, v] in items(views)
                call tlib#win#SetWin(w)
                call winrestview(v)
            endfor
            call tlib#win#SetWin(winnr)
        endif
        return 1
    endif
    return 0
endf


" " :def: function! tlib#win#GetLayout1(?save_view=0)
" " Contrary to |tlib#win#GetLayout|, this version doesn't use 
" " |winrestcmd()|. It can also save windows views.
" function! tlib#win#GetLayout1(...) "{{{3
"     TVarArg ['save_view', 0]
"     let winnr = winnr()
"     let acc = {}
"     for w in range(1, winnr('$'))
"         let def = {'h': winheight(w), 'w': winwidth(w)}
"         if save_view
"             call tlib#win#SetWin(w)
"             let def.view = winsaveview()
"         endif
"         let acc[w] = def
"     endfor
"     call tlib#win#SetWin(winnr)
"     return acc
" endf
" 
" 
" " Reset layout from the value of |tlib#win#GetLayout1|.
" function! tlib#win#SetLayout1(layout) "{{{3
"     if len(a:layout) != winnr('$')
"         return 0
"     endif
"     let winnr = winnr()
"     for [w, def] in items(a:layout)
"         if tlib#win#SetWin(w)
"             exec 'resize '. def.h
"             exec 'vertical resize '. def.w
"             if has_key(def, 'view')
"                 call winrestview(def.view)
"             endif
"         else
"             break
"         endif
"     endfor
"     call tlib#win#SetWin(winnr)
"     return 1
" endf


