set nocompatible

if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'bling/vim-airline'
Plug 'plasticboy/vim-markdown'
Plug 'kien/ctrlp.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tfnico/vim-gradle'
Plug 'johnlim/vim-groovy'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-leiningen'

call plug#end()

syntax enable
filetype plugin indent on

" set Vim-specific sequences for RGB colors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
colorscheme solarized8

set ai "autoindent
set ff=unix "file format unix
set ic "ignore case while searching
set sm "show matching braces while insertings 
set nu "show line numbers
set smd "display the mode
set expandtab
set tabstop=2 "set tabs to 2 spaces
set shiftwidth=2
set list "show listchars
set lcs=trail:·,tab:»»,eol:¬ "define listchars (trailing spaes, tabs and end of line)
set autoread "automatically read for changes outside of vim
set backspace=indent,eol,start "makes backspace work like you expect it to

let g:airline#extensions#tabline#enabled = 1
set laststatus=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nmap <F8> :TagbarToggle<CR>

let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif
