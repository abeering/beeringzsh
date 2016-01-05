colorscheme andante

map <F1> :tabprevious<CR>
map <F2> :tabnext<CR>

" invoke pathogen 
execute pathogen#infect()

" basic stuff
syntax on
filetype plugin indent on

" disable folding
" set nofoldenable    

" omg best thing ever
set hidden

" I never actually used vi...
set nocompatible

" Keep some space around the cursor
set scrolloff=3

" Yay smart editors.
set autoindent

" make that backspace key work the way it should
set backspace=indent,eol,start

" show line numbers
set number

" You wouldn't drive without a dashboard, would you?
set ruler
set laststatus=2
set statusline=%F%m%r%h%w\ %y\ Line:\ %-4lColumn:\ %-4v

" It's not quite shell completion, but I'll settle.
set wildmenu

" Set window title.
set title

" Honestly, I'm not sure how I feel about this option. Disable local directory
" vimrc thingies
set secure

" Show commands as they're being typed
set showcmd

" 4 space tab emulation, with good handling thereof
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
" set shiftround

" show matching brackets
set showmatch
" highlight search terms
set hlsearch

" Write on :make, quickfix things.
set autowrite

"flash instead of beep
set visualbell

" tab colors
hi TabLine ctermfg=Grey ctermbg=Black guifg=Grey guibg=Black
hi TabLineSel ctermfg=White ctermbg=LightGreen guifg=Black guibg=LightGreen

" Extra file support

autocmd FileType perl call PerlFile()
autocmd FileType ruby call RubyFile()

function! PerlFile()
  " perl syntax options
  let perl_fold=1
  let perl_fold_blocks=1
  let perl_include_pod=1
  let perl_extended_vars=1

  " syntax highlight in heredocs
  set foldmethod=syntax
  syn include @SQL $VIMRUNTIME/syntax/mysql.vim
  syn region perlSQL start="qq{" end="}" contains=@SQL keepend
  syn region perlSQL start="q{"  end="}" contains=@SQL keepend
  syn region perlSQL start="<<MYSQL" end="^MYSQL" contains=@SQL keepend
  syn region phpSQL start="<<<QQ" end="QQ;" contains=@SQL keepend
endfunction

function! RubyFile()
  " syntax highlighting in heredocs
  unlet b:current_syntax
  syntax include @SQL syntax/mysql.vim
  syntax region rubySQL start="<<SQL" end="^SQL" contains=@SQL keepend
  syntax region rubySQL start="<<-SQL" end="SQL" contains=@SQL keepend
endfunction

" support postgres \edit command
autocmd BufNewFile,BufRead * if expand('%:t') =~ 'psql\.edit' | set syntax=mysql | endif

" twig syntax
au BufRead,BufNewFile *.twig set filetype=twig

"""""""""""""""""""""""""""""""""""""""
" Key mappings and settings for plugins
"""""""""""""""""""""""""""""""""""""""

" nerdtree
noremap <leader>d :NERDTreeToggle<CR>

" CommandT - find files
map <C-f> :CommandT<CR>
noremap <leader>t :CommandT<CR>
" max 15 lines in CommandT search window
let g:CommandTMaxHeight=15
let g:CommandTMinHeight=15

" find color schemes
map <leader>= :call NextColorScheme()<CR>

" markdown syntax highlighting
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

autocmd BufWritePre *.rb,*.sql :%s/\s\+$//e


" gist plugin 
let g:gist_post_private = 1
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
