call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'w0rp/ale'
Plug 'bfrg/vim-cpp-modern'
Plug 'sbdchd/neoformat'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/echodoc.vim'

Plug 'Yggdroot/indentLine'

call plug#end()

set clipboard+=unnamedplus
set number
syntax enable
set termguicolors
set splitbelow
set splitright
set noshowmode
filetype plugin on
let mapleader=" "
noremap <SPACE> <Nop>
set mouse=a
set nocompatible
set smartcase
set foldmethod=syntax
set foldlevel=99
set scrolloff=5
set signcolumn=yes

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set textwidth=80
set colorcolumn=80
set wrap

colorscheme gruvbox
set background=dark

nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <Leader>q :NERDTreeToggle<CR>
nnoremap <F3> :Neoformat<CR>

autocmd VimResized * wincmd =

autocmd Filetype cpp setlocal commentstring=//\ %s
autocmd Filetype c setlocal commentstring=//\ %s

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

" ALE
let g:airline#extensions#tabline#enabled = 1
let g:ale_completion_enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
      \ 'cpp': ['clang'],
      \ 'c': ['clang'],
      \ 'python': ['flake8'],
      \ }
let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Deoplete
let g:deoplete#enable_at_startup = 1

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'around']

" Deoplete Clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-6.0/include'

" Echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" IndentLine
let g:indentLine_setColors = 0

" Neoformat
let g:neoformat_cpp_clang = {
  \ 'exe': 'clang-format',
  \ 'args': ["-style='{AlwaysBreakTemplateDeclarations: true, AllowShortBlocksOnASingleLine: false, AllowShortCaseLabelsOnASingleLine: false, AllowShortFunctionsOnASingleLine: false, AllowShortIfStatementsOnASingleLine: false, AllowShortLoopsOnASingleLine: false}'"],
  \}
let g:neoformat_enabled_cpp = ['clang']
let g:neoformat_python_yapf = {
      \ 'exe': 'yapf',
      \}
let g:neoformat_enabled_python = ['yapf']