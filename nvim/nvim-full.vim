set nocompatible

" Plugin {{{
call plug#begin()

" tpope's plugin {{{

" a step above 'nocompatible'
Plug 'tpope/vim-sensible'

"  Repeat
Plug 'tpope/vim-repeat'

" commentary
Plug 'tpope/vim-commentary'

" vim-rails
Plug 'tpope/vim-rails', {'for': 'ruby'}

" surround
Plug 'tpope/vim-surround'

" vim fugitive
Plug 'tpope/vim-fugitive'

" vim-rails
Plug 'tpope/vim-rails'

" }}}

" colorscheme
Plug 'scwood/vim-hybrid'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" syntax checking
Plug 'benekastah/neomake'

" autocomplete
Plug 'Shougo/deoplete.nvim'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" tern: javascript analyzer tool
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" dart
" Plug 'dart-lang/dart-vim-plugin', {'for': 'dart'}
" Elm
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }

" fuzzy path file finder
Plug 'ctrlpvim/ctrlp.vim'

" Ack
Plug 'mileszs/ack.vim'

" Nerdtree + git plugin
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}

" PHP omnicomplete & dep
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'm2mdas/phpcomplete-extended', {'for': 'php'}

" vimtex
Plug 'lervag/vimtex'

" lexima
Plug 'cohama/lexima.vim'

" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" vim-twig
Plug 'lunaru/vim-twig'

" local vimrc
Plug 'embear/vim-localvimrc'

" devicons
Plug 'ryanoasis/vim-devicons'

" Wiki
Plug 'vimwiki/vimwiki'

call plug#end()

" }}}

" Plugin Configuration {{{
" deoplete {{{
let g:deoplete#enable_at_startup=1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"omnifunc
augroup omnifuncs
    autocmd!
    autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
augroup END
" tern
if exists('g:plugs["tern_for_vim"]')
    let g:tern_show_argument_hints = 'on_hold'
    let g:tern_show_signature_in_pum = 1
    autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" <Leader><Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
" }}}

" Neomake {{{ 
autocmd! BufWritePost * Neomake
let g:neomake_php_php__maker = {
    \ 'args': ['-l'],
    \ }
" }}}

" Ctrl-P {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*
" }}}

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="wombat"
set laststatus=2
" }}}

" lexima {{{
let g:lexima_enable_basic_rules=1
let g:lexima_enable_newline_rules=1
let g:lexima_enable_endwise_rules=1

call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'tex'})
call lexima#add_rule({'char': '$', 'at': '\$\%#\$', 'leave': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'tex'})
" }}}

" NERDTree git plugin {{{
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }
" }}}

" php complete extended {{{
let g:phpcomplete_index_composer_command="php ~/bin/composer.phar"
"}}}

" Vimwiki {{{
let g:vimwiki_list = [
    \ {'path':'$HOME/Documenti/wiki'},
    \ {'path':'$HOME/Documenti/Work'}
    \ ]
" }}}

" }}}

" Tabs {{{
set tabstop=4 " a tab will be represented with 4 columns
set softtabstop=4 " <tab> is pressed in insert mode 4 column
set shiftwidth=4 " indentation is 4 columns
set expandtab " replace <tab>s with spaces, ye
" }}}

" Graphical Settings {{{
set t_Co=256
syntax on
set background=dark
colorscheme hybrid
set relativenumber
set number
set cursorline
" set cursorcolumn

set listchars=eol:¬,tab:>·,trail:~
set list

" fix for tmux+nvim <C-h>
if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    " Hack to get C-h working in neovim
    nmap <BS> <C-W>h
    tnoremap <Esc> <C-\><C-n>
endif


" show menu with choices
set wildmenu

set scrolloff=3

" search
set incsearch
set hlsearch

" folding {{{
set foldenable
set foldlevel=10
autocmd FileType php  set foldmethod=indent
autocmd FileType ruby set foldmethod=indent
autocmd FileType css set foldmethod=indent
autocmd FileType sass set foldmethod=indent
" }}}

" }}}

" Keys {{{
set showcmd " show the key I typed

let mapleader=','
let maplocalleader="\\"

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" fast buffer resizing
if bufwinnr(1)
    nmap + <c-w>+
    nmap - <c-w>-
endif

" common actions with leader key -- inspired by Spacemacs
" File Save
nnoremap <Leader>fs :w<CR>
" buffer delete
nnoremap <Leader>bd :bd<CR>
" buffer next
nnoremap <Leader>bn :bn<CR>
" buffer previous
nnoremap <Leader>bp :bp<CR>
" remove highlighted words
nnoremap <Leader>th :nohl<CR>
" nerdtree
nnoremap <Leader>pt :NERDTreeToggle<CR>

nnoremap j gj
nnoremap k gk

" }}}

" Spell checking {{{
autocmd FileType tex setlocal spell spelllang=it_IT
autocmd FileType markdown setlocal spell spelllang=it_IT
" }}}

" vim:foldmethod=marker:foldlevel=10