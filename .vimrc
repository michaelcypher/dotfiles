" Remove arrow key bindings!
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

set t_Co=256


set backspace=2
set wrap
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin on

set number
set ruler

syntax enable

hi Visual ctermfg=Black ctermbg=Cyan cterm=bold

hi OverLength cterm=underline
match OverLength /\%81v.\+/

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

hi Search ctermfg=Black ctermbg=Cyan cterm=bold 
set hlsearch

set list lcs=trail:·

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1

autocmd VimEnter * TagbarToggle
let g:tagbar_left = 1

" Enable mouse for everything and update the screen quickly!
" You can now drag splits like a God!
set ttyfast
set mouse=a
set ttymouse=xterm2

" Makes splits easier (since s is pretty useless anyway)
nnoremap s <C-W>





function! ConwaysGameOfLife()
    "Build initial board from file
    let height = winheight(0)
    let width = winwidth(0) - (max([len(line('$')), &numberwidth-1]) + 1)
    let board = []
    for row in range(height)
        let board_row = []
        for column in range(width)
            let char = matchstr(getline(row + line('w0')), '\%' . column . 'c.')
            if char =~ '\S'
                let board_row = add(board_row, char)
            else
                let board_row = add(board_row, ' ')
            endif
        endfor
        let board = add(board, board_row)
    endfor

    let keep_running = 1
    while keep_running
        "Print board
        for row in range(height)
            let line = join(board[row][1:], '')
            let line = substitute(line, '\s\+$', '', '')
            call setline(row + line('w0'), line)
        endfor

        "Update board
        let new_board = []
        let keep_running = 0
        for row in range(height)
            let new_board_row = []
            for column in range(width)
                let counter = 0
                let new_char = '█'

                "Probably could be done nicer with a for loop but meh, vimscript
                if get(get(board, row - 1, []), column, ' ') =~ '\S'
                    let counter = counter + 1
                    let new_char = get(get(board, row - 1, []), column, new_char)
                endif
                if get(get(board, row + 1, []), column, ' ') =~ '\S'
                    let counter = counter + 1
                    let new_char = get(get(board, row + 1, []), column, new_char)
                endif
                if get(get(board, row - 1, []), column - 1, ' ') =~ '\S'
                    let counter = counter + 1
                    let new_char = get(get(board, row - 1, []), column - 1, new_char)
                endif
                if get(get(board, row + 1, []), column - 1, ' ') =~ '\S'
                    let counter = counter + 1
                    let new_char = get(get(board, row + 1, []), column - 1, new_char)
                endif
                if get(get(board, row - 1, []), column + 1, ' ') =~ '\S'
                    let counter = counter + 1
                    let new_char = get(get(board, row - 1, []), column + 1, new_char)
                endif
                if get(get(board, row + 1, []), column + 1, ' ') =~ '\S'
                    let counter = counter + 1
                    let new_char = get(get(board, row + 1, []), column + 1, new_char)
                endif
                if get(get(board, row, []), column - 1, ' ') =~ '\S'
                    let counter = counter + 1
                    let new_char = get(get(board, row, []), column - 1, new_char)
                endif
                if get(get(board, row, []), column + 1, ' ') =~ '\S'
                    let counter = counter + 1
                    let new_char = get(get(board, row, []), column + 1, new_char)
                endif

                let alive = (board[row][column] =~ '\S')
                if alive
                    if counter < 2 || counter > 3
                        let new_board_row = add(new_board_row, ' ')
                    else
                        let new_board_row = add(new_board_row, new_char)
                        let keep_running = 1
                    endif
                else
                    if counter == 3
                        let new_board_row = add(new_board_row, new_char)
                        let keep_running = 1
                    else
                        let new_board_row = add(new_board_row, ' ')
                    endif
                endif
            endfor
            let new_board = add(new_board, new_board_row)
        endfor

        let board = new_board
        redraw
        sleep 50m
    endwhile
endfunction
