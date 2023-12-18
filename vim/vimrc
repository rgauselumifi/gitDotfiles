"options
set showcmd

filetype plugin on
runtime macros/matchit.vim

set path=.,,,src/**
set wildignore+=*/node_modules/*
set wildmenu
set wildchar=<C-n>
set termguicolors
set nonumber
set norelativenumber
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set encoding=utf-8
set undodir=~/.vim/undo
set undofile
set noswapfile
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
set autoread
set timeoutlen=1000
set ttimeoutlen=100
set backspace=indent,eol,start
set mouse=a

let mapleader = " "

"plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
call plug#end()


"Coc
let g:coc_global_extensions = ['coc-html', 'coc-json', 'coc-tsserver']
inoremap <silent><expr> <C-n>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#refresh()

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap ,n <Plug>(coc-rename)

augroup mygroup
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

 xmap ,a  <Plug>(coc-codeaction-selected)
 nmap ,a  <Plug>(coc-codeaction-cursor)
 nmap ,A  <Plug>(coc-codeaction-source)
 nmap <silent> ,r <Plug>(coc-codeaction-refactor)
 xmap <silent> ,r  <Plug>(coc-codeaction-refactor-selected)


 "maps
 nnoremap <leader>z :vsplit $MYVIMRC<cr>
 nnoremap <leader>Z :so $MYVIMRC<cr>
 nnoremap <leader>n :noh<CR>
 nnoremap <leader>N :vnew \| setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile<cr>
 nnoremap <leader>p :Ex<CR>
 nnoremap <leader>f :find *
 nnoremap <leader>g :silent grep! -i  \| cwindow \| redraw!<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
 nnoremap <leader>c :cwindow<CR>
 nnoremap <leader>C :ccl<CR>
 nnoremap [c :cp<CR>
 nnoremap ]c :cn<CR>
 nnoremap [C :cfirst<CR>
 nnoremap ]C :clast<CR>
 nnoremap <leader>me :compiler eslint<cr>:silent make  \| cwindow \| redraw!<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
 nnoremap ,f mmgggqG`m

 vnoremap J :m '>+1<cr>gv=gv
 vnoremap K :m '<-2<cr>gv=gv

 inoremap {<cr> {<cr>}<esc>O
 inoremap [<cr> [<cr>]<esc>O
 inoremap (<cr> (<cr>)<esc>O
 inoremap {, {<cr>},<esc>O
 inoremap [, [<cr>],<esc>O
 inoremap (, (<cr>),<esc>O
 inoremap {; {<cr>};<esc>O
 inoremap [; [<cr>];<esc>O
 inoremap (; (<cr>);<esc>O

 nmap <leader>Y <Plug>OSCYankOperator
 nmap <leader>yy <leader>Y_
 vmap <leader>y <Plug>OSCYankVisual

 set tagfunc=CocTagFunc
 colorscheme slate
