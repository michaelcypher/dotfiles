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

let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermfg=White ctermbg=Black cterm=bold guifg=white guibg=black
set cursorline
hi CursorLine ctermfg=White ctermbg=Red cterm=bold guifg=white guibg=red
set cursorcolumn
hi CursorColumn ctermfg=White ctermbg=Red cterm=bold guifg=white guibg=red

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


" Vim
let g:indentLine_color_term = 239
"
" "GVim
let g:indentLine_color_gui = '#A4E57E'
"
" " none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
