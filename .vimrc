" Remove arrow key bindings!
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

set t_Co=256

" let g:tmuxline_powerline_separators = 0
" let g:tmuxline_preset = 'full'

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
hi CursorColumn ctermfg=Black ctermbg=Yellow cterm=bold
set cursorline
hi CursorLine ctermfg=Black ctermbg=Yellow cterm=bold

set cursorline

set foldcolumn=1

hi Pmenu ctermbg=White ctermfg=Black

set wildmenu
set incsearch
set ignorecase
set wildmode=list:longest

set laststatus=2

set mouse=a
set noerrorbells
set visualbell 

set scrolloff=3

hi Search cterm=bold ctermfg=Black ctermbg=Cyan
set hlsearch

set list lcs=trail:·

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

autocmd VimEnter * TagbarToggle
let g:tagbar_left = 1
