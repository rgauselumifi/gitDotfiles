  set path+=src/**
filetype plugin on
set wildignore+=*/node_modules/*
set number
set relativenumber
set wildmenu
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
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
set autoread
set timeoutlen=1000
set ttimeoutlen=0
colorscheme slate

let mapleader = " "

"plugins
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
xmap ,f  <Plug>(coc-format-selected)
nmap ,f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Example: `<leader>aap` for current paragraph
xmap ,a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap ,a  <Plug>(coc-codeaction-cursor)
nmap ,A  <Plug>(coc-codeaction-source)
nmap ,qf  <Plug>(coc-fix-current)
nmap <silent> ,r <Plug>(coc-codeaction-refactor)
xmap <silent> ,r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> ,R  <Plug>(coc-codeaction-refactor-selected)
nmap ,l  <Plug>(coc-codelens-action)

" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-d> and <C-u> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" TODO format on save
command! -nargs=0 Format :call CocActionAsync('format')
" autocmd BufWritePre * call Format()
nmap ,F :Format<cr>

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

nnoremap <silent><nowait> ,d  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> ,e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> ,c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> ,o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> ,s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> ,j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> ,k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> ,p  :<C-u>CocListResume<CR>

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
