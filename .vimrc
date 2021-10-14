" environment settings {{{


" set encoding {{{
set encoding=utf-8
set fileencodings=utf-8,gb2312,gbk
set fileencoding=utf-8
set termencoding=utf-8
" }}}

" tab settings {{{
" set tab to 4 spaces
set tabstop=4
set expandtab
" fix problems with backspace
set backspace=indent,eol,start
" }}}

" indent settings {{{
set autoindent
" set smartindent
set shiftwidth=4
set softtabstop=4
" }}}

" search settings {{{

" set searching is case-insensitive
set ignorecase
" searching is case-sensitive if there is a capital character
set smartcase

" }}}

" auto cmds {{{

" set nohlsearch when cursorhold
autocmd cursorhold * set nohlsearch
" highlight the char with column index 80
autocmd BufWinEnter *.h,*.cpp,*.c,*.py,*.js,*.sh,*.java let w:m2=matchadd('ErrorMsg', '\%81v.', -1)

" autocmd BufNewFile,BufRead *.objdump set filetype=objdump
" }}}

" other settings {{{
" show row number
set number

" set leader
let mapleader = ","

" set fold method
" set foldmethod=marker
" set foldmethod=manual
set foldmethod=syntax

" show newline, tab
set list
" newline character
set listchars=eol:⇠,tab:>.

" mouse
set mouse=a

" doxygen syntax support
let g:load_doxygen_syntax = 1
let g:doxygen_enhanced_color = 1
" }}}


" }}}



" theme settings {{{
syntax enable
let g:solarized_termtrans=1
set background=dark
"colorscheme solarized
" }}}


" functions {{{
"
func! CompileRun()
    exec "w"
    if &filetype == 'python'
        exec '!python3 %'
    elseif &filetype == 'sh'
        exec '!bash %'
    elseif &filetype == 'cpp'
        " exec '!make run'
        exec '!g++ -std=c++11 -g % && ./a.out'
    elseif &filetype == 'tex'
        exec '!xelatex --shell-escape %'
    endif
endfunc

" }}}


" mapping settings {{{

" method to map special key:
" 	ctrl+v esc

" all modes mappings {{{
" }}}


" insert mode mappings {{{

" change jk to function as esc
inoremap jk <esc>


" let shift+Tab work
inoremap [Z <s-tab>

" }}}


" normal mode mappings {{{

nnoremap ; :
nnoremap : ;

nnoremap <leader>f :ALENext<cr>
vnoremap <leader>c "+y
nnoremap <leader>v "+gp

nnoremap <space> <C-f>

" plugin settings
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <F3> :BufExplorer<cr>
nnoremap <F4> :H2cppxAuto<cr><esc>:A<cr>G
nnoremap <F5> :call CompileRun()<cr>
nnoremap <F9> :YcmCompleter FixIt<cr>

nnoremap gd :YcmCompleter GoTo<cr>

" easymotion bindings
nmap s <Plug>(easymotion-overwin-f)
nmap <leader>l <Plug>(easymotion-lineforward)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
nmap <leader>h <Plug>(easymotion-linebackward)


" hlsearch settings
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>


" }}}


" visual mode mappings {{{

vnoremap ; :
vnoremap : ;

" }}}


" }}}


" command settings {{{

" }}}


" evnironment settings {{{
" settings in the first part does not work, override here

" show command
set showcmd

hi! ALEError cterm=NONE ctermbg=NONE ctermfg=darkred
hi! ALEWarning cterm=NONE ctermbg=NONE ctermfg=darkred

autocmd Syntax * syntax keyword Todo NOTE FIXME containedin=.*Comment
" }}}

" vim:foldmethod=marker
