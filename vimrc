set path+=src/**
filetype plugin on
set wildignore+=*/node_modules/*
set number
set relativenumber
set wildmenu
set nobackup
set encoding=utf-8
set undodir=~/.vim/undo
set undofile
set noswapfile
"TODO fix clipboard
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set incsearch
set hlsearch
set ignorecase
set smartcase
set nowrap
set scrolloff=8
set hidden
set laststatus=0
set grepprg=rg\ --vimgrep
set grepformat^=%f:%l:%c:%m
set timeoutlen=1000
set ttimeoutlen=0


let g:gutentags_ctags_exclude_wildignore = 1

colorscheme slate

let mapleader = " "
nnoremap <leader>n :noh<CR>
nnoremap <leader>p :Ex<CR>
nnoremap <leader>f :find *
nnoremap <leader>g :silent grep! -i  \| cwindow \| redraw!<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <leader>c :cwindow<CR>
nnoremap <leader>C :ccl<CR>
nnoremap [c :cp<CR>
nnoremap ]c :cn<CR>
nnoremap [C :cfirst<CR>
nnoremap ]C :clast<CR>
nnoremap <leader>b :ls<CR>:buffer<Space>

highlight QuickFixLine ctermbg=20
highlight Search ctermfg=white ctermbg=20
highlight IncSearch ctermfg=red ctermbg=20
