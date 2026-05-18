let mapleader =" "

" system clipboard
nnoremap <leader>y "+y              " Yank motion to clipboard
vnoremap <leader>y "+y              " Yank selection to clipboard
nnoremap <leader>yy "+yy            " Yank line to clipboard
nnoremap <leader>p "+p              " Paste after cursor
nnoremap <leader>P "+P              " Paste before cursor
vnoremap <leader>p "+p              " Replace visual selection with clipboard
vnoremap <leader>P "+P

" Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Enable relative line numbering
" set number          " Show absolute line number on the current line
" set relativenumber  " Show relative line numbers on other lines
" highlight LineNr ctermfg=DarkGrey guifg=DarkGrey 
" highlight LineNrAbove ctermfg=DarkGrey guifg=Grey
" highlight LineNrBelow ctermfg=DarkGrey guifg=Grey

" case insensitive searching
set ignorecase
set smartcase
set incsearch

" syntax highlighting
" syntax on
filetype plugin indent on

" misc
set wildmenu

" path append ** (to include subdirs in search automatically)
" git diff (diffopt)
" statusline: mode, filename, *, column, pct through file, branch

" shortcuts
" :bnext/prev           " buffer next/previous
" :copen                " quickfix
" :%s/old/new/gc        " in file find and replace
" leader rc, quick config editing
" new split to the right
" :buffers              " see all buffers
" ctrl+o                " prev/next cursor location?
" /                     " in file search
" shift+v (select lines) :norm (actions you want on each line)  " perform some action on some visual block lines

" TODO
" vim grep
" indenting
" commenting

