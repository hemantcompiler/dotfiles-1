set nocompatible

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set t_Co=256
syntax on
set background=dark
colorscheme murphy
set number
set relativenumber

set cindent

set cursorline

set wildmenu

set scrolloff=3

set incsearch
set hlsearch

set showcmd
let mapleader=','
let maplocalleader="\\"

nnoremap <Leader>fs :w<CR>
nnoremap <Leader>th :nohl<CR>

nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap { {}<Left>
nnoremap {<CR> {<CR>}<Esc>O
nnoremap {{ {
nnoremap {} {}

nnoremap [ []<Left>
nnoremap [<CR> [<CR>]<Esc>O
nnoremap [[ [
nnoremap [] []

nnoremap ( ()<Left>
nnoremap (<CR> (<CR>)<Esc>O
nnoremap (( (
nnoremap () ()

inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
