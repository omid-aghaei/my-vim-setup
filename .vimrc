" ==================== Vim Configuration ====================
" Maintainer: Omid Aghaei <info@omidaghaei.ir>
" Version: 1.0
" Last Change: 2025-05-17
" Repository: https://github.com/omid-aghaei/my-vim-setup

" ================ Core Settings ================
set nocompatible
filetype plugin indent on
syntax enable
set encoding=utf-8
set hidden
set nowrap
set backspace=indent,eol,start
set clipboard=unnamedplus
set mouse=a
set splitright
set splitbelow
set updatetime=300

" ================ UI Configuration ================
set number
set relativenumber
set cursorline
set showmatch
set wildmenu
set wildmode=list:longest,full
set laststatus=2
set noshowmode
set signcolumn=yes
set scrolloff=5
set sidescrolloff=5
set termguicolors
colorscheme codedark

" ================ Search Behavior ================
set ignorecase
set smartcase
set incsearch
set hlsearch

" ================ Indentation Rules ================
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" ================ Performance ================
set lazyredraw
set ttyfast

" ================ Persistence ================
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000

" ================ Key Mappings ================
let mapleader=" "

" File operations
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Window management
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" Buffer navigation
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bd :bdelete<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>

" ================ Plugin Management ================
call plug#begin('~/.vim/plugged')

" Core plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" Navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'posva/vim-vue'
Plug 'prisma/vim-prisma'
Plug 'jparise/vim-graphql'
Plug 'nginx/nginx'

" Vue with Vetur
Plug 'posva/vim-vue'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc-vetur'

" Tools
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ekalinin/Dockerfile.vim'

" Database
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Theme
Plug 'tomasiser/vim-code-dark'

call plug#end()

" ================ Plugin Configurations ================

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.DS_Store$', 'node_modules']

" FZF
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>rg :Rg<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" GitGutter
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▎'

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
nnoremap <leader>p :Prettier<CR>

" Vetur
let g:vetur_completion_autoImport = 1
let g:vetur_validation_template = 1
let g:vetur_validation_style = 1

" ================ CoC Configuration ================
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-vetur',
  \ 'coc-pairs',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-docker',
  \ 'coc-prisma',
  \ 'coc-highlight',
  \ 'coc-snippets',
  \ 'coc-yank'
  \ ]

" CoC key mappings
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ================ Language Specific ================
autocmd FileType javascript,typescript,typescriptreact setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType prisma setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType nginx setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType dockerfile setlocal shiftwidth=4 softtabstop=4 tabstop=4

" ================ Custom Commands ================
command! TrimWhitespace %s/\s\+$//e
nnoremap <leader>tn :set relativenumber!<CR>
