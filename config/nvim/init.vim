""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (https://github.com/junegunn/vim-plug)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'chriskempson/base16-vim'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'raimondi/delimitmate'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background          " Use terminal base16 theme
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50

set clipboard+=unnamedplus            " Use the system clipboard

set lazyredraw

set ignorecase                        " Ignore case when searching
set smartcase                         " Factor in case when specified
set hlsearch                          " Highlight all matching searches

set relativenumber                    " Number of lines away from the current
set number                            " Show the current line number

set splitright                        " New buffers appear to the right or below
set splitbelow

autocmd FileType gitcommit setlocal spell
set spellsuggest=best,10              " Best guess spell check with 10 results

set cursorline                        " Highlight the current line
set laststatus=2                      " Always display the status line
set noshowmode                        " No need to show mode in the bottom left

syntax enable                         " Turn on syntax highlighting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Swap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup                          " Don't keep file backups
set nowritebackup                     " Write directly to the file
set noswapfile                        " Don't make swap files
set autowrite                         " :write before running commands
set history=50                        " Set exec command history to 50
set hidden                            " Buffers can be unsaved when not shown
set autoread                          " Autoload changes from outside of vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set undofile                          " Keep track of undos in all buffers
set undodir=$HOME/.VIM_UNDO_FILES     " Track undos in .VIM_UNDO_FILES


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=2                         " Number of visual spaces per TAB
set softtabstop=2
set shiftwidth=2                      " Number of spaces in tab when editing
set expandtab                         " Tabs are spaces
set shiftround
filetype plugin indent on             " Load filetype specific indents

set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set nowrap                            " Don't wrap lines
set linebreak                         " Wrap at convenient points

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scrolling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set scrolloff=5                       " Keep at least 5 lines of context
set sidescrolloff=15                  " Keep 15 characters of context
set sidescroll=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=indent                 " Fold based on indent
set foldnestmax=3                     " Deepest fold is 3 levels
set nofoldenable                      " Don't fold to begin with

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <C-k> <C-\><C-n><C-w>k
nnoremap <silent> <C-j> <C-\><C-n><C-w>j
nnoremap <silent> <C-h> <C-\><C-n><C-w>h
nnoremap <silent> <C-l> <C-\><C-n><C-w>l
if exists(':tnoremap')
    tnoremap <silent> <C-k> <C-\><C-n><C-w>k
    tnoremap <silent> <C-j> <C-\><C-n><C-w>j
    tnoremap <silent> <C-h> <C-\><C-n><C-w>h
    tnoremap <silent> <C-l> <C-\><C-n><C-w>l
endif

let mapleader=","                     " Map Leader as ,

map Y y$                              " Treat Y like D and yank till EOL
map Q gq                              " Don't use Ex mode, use Q for formatting
nnoremap <Leader>l :nohl<CR>          " Turn off search highlights
map <C-n> :NERDTreeToggle<CR>         " Toggle NerdTree
map <Leader>z ]s<CR>                  " Jump to next misspelled word
map <Leader>Z [s<CR>

nnoremap <silent> <C-P> :Files<CR>

nnoremap <Leader>tw :%s/\s\+$//e<CR>  " Trim whitesapce in a file
nnoremap <Leader>f :ALEFix<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:LanguageClient_autoStart = 1    " Automatically start language servers.

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neosnippet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'rust': ['rustfmt'],
\}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Close if only NerdTree is left
autocmd bufenter *
      \ if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
      \ | q |
      \ endif
