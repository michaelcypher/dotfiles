set backspace=2
set wrap
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

" Pathogen
filetype off " Pathogen needs to run before plugin indent on
call pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
filetype plugin on

set number
set ruler

syntax enable

highlight OverLength ctermbg=Red ctermfg=White
match OverLength /\%81v.\+/

set cursorcolumn
hi CursorColumn ctermfg=White ctermbg=Black cterm=bold
set cursorline
hi CursorLine ctermfg=Black ctermbg=Yellow cterm=bold

set cursorline

set foldcolumn=1

set wildmenu
set incsearch
set ignorecase
set wildmode=list:longest

set laststatus=2

set mouse=a
set noerrorbells
set visualbell 

set scrolloff=3

set hlsearch

set list lcs=trail:·

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

