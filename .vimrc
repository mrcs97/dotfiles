call plug#begin()

Plug 'neoclide/coc.nvim'
Plug 'ayu-theme/ayu-vim'

call plug#end()

set termguicolors
let ayucolor = "dark"
colorscheme ayu

syntax on
set number
set relativenumber
set cursorline
set termguicolors
set expandtab

set tabstop=4
set shiftwidth=4
set softtabstop=4
set guicursor=a:block
set scrolloff=5
set sidescrolloff=5

inoremap <silent><expr> <CR> pumvisible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

