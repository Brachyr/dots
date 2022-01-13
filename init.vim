set nocompatible
syntax on
set clipboard=unnamedplus
set backspace=indent,eol,start
set visualbell
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set nowrap
set number relativenumber
set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set splitbelow
set splitright
set mouse=a
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

let mapleader=' '

nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <leader>c :bd<CR>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
vmap < <gv
vmap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" python
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
nmap <silent> <leader>2 :Semshi rename<CR>
nmap <silent> <leader>w :Semshi goto name next<CR>
nmap <silent> <leader>q :Semshi goto name prev<CR>
nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>

call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'justinmk/vim-sneak' 
  Plug 'unblevable/quick-scope'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'morhetz/gruvbox'
  Plug 'Chiel92/vim-autoformat'
  Plug 'tomasiser/vim-code-dark'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  Plug 'davidhalter/jedi-vim'
  Plug 'ervandew/supertab'
  Plug 'aserebryakov/vim-todo-lists'
call plug#end()

let g:sneak#label = 1
let g:qs_highlight_on_keys = ['f', 'F']
let g:VimTodoListsMoveItems = 0

let g:airline_theme = 'codedark'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#virtualenv#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

colorscheme codedark
