" Plugins                                                                                                        {{{
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'airblade/vim-gitgutter'
Plug 'derekwyatt/vim-scala'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neomake/neomake'
Plug 'raimondi/delimitmate'
Plug 'rust-lang/rust.vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wikitopian/hardmode'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Add plugins to &runtimepath
call plug#end() " }}}

" Neovim Settings                                                                                                {{{
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1  " Allow the cursor to change shapes for modes
let $NVIM_TUI_ENABLE_TRUE_COLOR=1    " True color
set clipboard+=unnamedplus           " Use the system clipboard

set tabstop=4                        " Number of visual spaces per TAB
set softtabstop=4                    " Number of spaces in tab when editing
set expandtab                        " Tabs are spaces
set smarttab
filetype indent on                   " Load filetype specific indents

set ignorecase                       " Ignore case when searching
set smartcase                        " Factor in case when specified
set hlsearch                         " Highlight all matching searches

set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u,t,i,k

set relativenumber                   " Turn on relative numbers
set number                           " Force the current line number to show in the gutter

set splitright                       " New buffers appear to the right or below
set splitbelow

set wildmenu                         " Visual autocomplete of commands
set incsearch                        " Incremental searching

autocmd FileType
        \ gitcommit,markdown
        \ setlocal spell
set spellsuggest=best,10             " Set up spelling on specific file types

set nobackup
set nowritebackup
set noswapfile
set autowrite                        " Automatically :write before running commands
set history=50                       " Set exec command history to 50
set hidden                           " Don't force buffers to be saved when no longer visible

set ruler                            " Show the cursor position all the time
set cursorline                       " Highlight the current line
set showcmd                          " Display incomplete commands
set laststatus=2                     " Always display the status line

set undofile                         " Keep track of undos in a directory after closing the buffer
set undodir=$HOME/.VIM_UNDO_FILES
syntax enable                        " Turn on syntax highlighting

colorscheme gruvbox
set background=dark " }}}

" Folding                                                                                                        {{{

function! MyFoldText() "                                                                                         {{{
      let line = getline(v:foldstart)
      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines')
      return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . ' Lines '
endfunction " }}}

set foldtext=MyFoldText()

autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

autocmd FileType vim setlocal fdc=1
set foldlevel=99
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=0

autocmd FileType java setlocal foldlevel=99
autocmd FileType java setlocal foldmethod=marker
autocmd FileType java setlocal foldmarker={,}

let g:xml_syntax_folding = 1
autocmd FileType xml setl foldmethod=syntax
" }}}

" Mappings                                                                                                       {{{
let mapleader=","                    " Map Leader as ,

:vmap < <gv                          " Keep visual selection blocks highlighted when indenting
:vmap > >gv
:vnoremap <C-/> :TComment<CR>        " Use Ctrl-/ to comment
:map <Leader><Leader> :noh<CR>       " Kill highlighted words after completed search
:nnoremap <Leader>tw :%s/\s\+$//e<CR>

:tnoremap <A-h> <C-\><C-n><C-w>h     " Navigate windows easier with Alt-h/j/k/l
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

:tnoremap ˙ <C-\><C-n><C-w>h         " Map Alt + h/j/k/l on Mac to act like <A-h/j/k/l>
:vnoremap ˙ <C-w>h
:nnoremap ˙ <C-w>h
:tnoremap ∆ <C-\><C-n><C-w>j
:vnoremap ∆ <C-w>j
:nnoremap ∆ <C-w>j
:tnoremap ˚ <C-\><C-n><C-w>k
:vnoremap ˚ <C-w>k
:nnoremap ˚ <C-w>k
:tnoremap ¬ <C-\><C-n><C-w>l
:vnoremap ¬ <C-w>l
:nnoremap ¬ <C-w>l " }}}

" Airline                                                                                                        {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " }}}

" NERDTree                                                                                                       {{{
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1 " }}}

" Deoplete                                                                                                       {{{
let g:deoplete#enable_at_startup = 1 " }}}

" Snippets                                                                                                       {{{
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets' " }}}

" Denite                                                                                                         {{{
autocmd FileType unite call s:uniteinit()
  augroup END
  function! s:uniteinit()
      set nonumber
      set norelativenumber
      nunmap <buffer> d
      nunmap <buffer> a
      nunmap <buffer> <c-n>
      nunmap <buffer> <c-k>
      nunmap <buffer> <c-p>

      nmap <silent> <Esc> <Plug>(unite_all_exit)
      nmap <silent> <c-n> <Plug>(unite_loop_cursor_down)
      nmap <silent> <c-p> <Plug>(unite_loop_cursor_up)

    endfunction

  call denite#custom#option('default', 'prompt', '❯')

  call denite#custom#source(
    \ 'file_rec', 'vars', {
    \   'command': [
    \    'ag', '--follow','--nogroup','--hidden', '-g', '', '--ignore', '.git', '--ignore', '*.png'
    \   ] })
  let s:menus = {}
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
            \ ['--vimgrep', '--no-heading'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
    call denite#custom#option('default', 'statusline', 0)
  call denite#custom#option('default', 'highlight-matched-char', '')
  call denite#custom#option('default', 'highlight-matched-range', '')
  hi deniteMatched guibg=None
  hi deniteMatchedChar guibg=None

  nnoremap <silent> <C-p> :Denite file_rec<CR>
  nnoremap <silent> <Leader>h :Denite  help<CR>
  nnoremap <silent> <Leader>c :Denite colorscheme<CR>
  nnoremap <silent> <Leader>b :Denite buffer<CR>
  call denite#custom#map(
      \ 'insert',
      \ '<C-n>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
    call denite#custom#map(
          \ 'insert',
          \ '<C-p>',
          \ '<denite:move_to_previous_line>',
          \ 'noremap'
          \)

  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

  call denite#custom#var('menu', 'menus', s:menus)

"}}}

" Git from denite                                                                                                {{{
nnoremap <Leader>g :Denite -start-insert menu:git<CR>
  let s:menus.git = {
    \ 'description' : 'Fugitive interface',
    \}
  let s:menus.git.command_candidates = [
    \[' git status', 'Gstatus'],
    \[' git diff', 'Gvdiff'],
    \[' git commit', 'Gcommit'],
    \[' git stage/add', 'Gwrite'],
    \[' git checkout', 'Gread'],
    \[' git rm', 'Gremove'],
    \[' git cd', 'Gcd'],
    \[' git push', 'exe "Git! push " input("remote/branch: ")'],
    \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
    \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
    \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
    \[' git fetch', 'Gfetch'],
    \[' git merge', 'Gmerge'],
    \[' git browse', 'Gbrowse'],
    \[' git head', 'Gedit HEAD^'],
    \[' git parent', 'edit %:h'],
    \[' git log commit buffers', 'Glog --'],
    \[' git log current file', 'Glog -- %'],
    \[' git log last n commits', 'exe "Glog -" input("num: ")'],
    \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
    \[' git log until date', 'exe "Glog --until=" input("day: ")'],
    \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
    \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
    \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
    \[' git mv', 'exe "Gmove " input("destination: ")'],
    \[' git grep',  'exe "Ggrep " input("string: ")'],
    \[' git prompt', 'exe "Git! " input("command: ")'],
    \] " Append ' --' after log to get commit info commit buffers
"}}}
