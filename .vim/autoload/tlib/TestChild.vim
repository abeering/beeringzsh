" TestChild.vim
" @Author:      Thomas Link (mailto:samul AT web de?subject=[vim])
" @Website:     http://members.a1.net/t.link/
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-05-18.
" @Last Change: 2007-07-28.
" @Revision:    0.1.10

" :enddoc:

if &cp || exists("loaded_tlib_TestChild_autoload")
    finish
endif
let loaded_tlib_TestChild_autoload = 1


let s:prototype = tlib#Test#New({'_class': ['TestChild']}) "{{{2
function! tlib#TestChild#New(...) "{{{3
    let object = s:prototype.New(a:0 >= 1 ? a:1 : {})
    return object
endf


function! s:prototype.Dummy() dict "{{{3
    return 'TestChild.vim'
endf

