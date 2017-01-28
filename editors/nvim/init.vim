set nocompatible " be iMproved

" Plug {{{
" set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
"
set runtimepath+=~/Develop/vim-plugins/vim-sc/

call plug#begin()

Plug 'flazz/vim-colorschemes'
Plug 'a-watson/vim-gdscript'
" Plug 'tpope/vim-commentary'

Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'
Plug 'digitaltoad/vim-pug', { 'for': ['pug'] }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' } | Plug 'Shougo/vimproc.vim', {'do' : 'make' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'editorconfig/editorconfig-vim'
Plug 'embear/vim-localvimrc'
Plug 'guns/vim-sexp', { 'for': ['clojure', 'scheme', 'lisp'] }
Plug 'junegunn/fzf', {'do': './install --bin'}
Plug 'jwalton512/vim-blade', { 'for': 'blade' }
Plug 'laurentb/vim-cute-php', { 'for': 'php' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'lumiliet/vim-twig', { 'for': 'twig' }
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim', { 'for': ['html', 'twig', 'blade'] }
Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
Plug 'mkusher/padawan.vim'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'othree/csscomplete.vim', { 'for': ['css', 'stylus', 'sass'] }
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'wellle/targets.vim'
Plug 'wikitopian/hardmode'

" Plug 'scwood/vim-hybrid'
" Plug 'morhetz/gruvbox'
" Plug 'neomake/neomake'
" call dein#add('hail2u/vim-css3-syntax')
" call dein#add('mxw/vim-jsx')
" call dein#add('othree/html5.vim')
" call dein#add('neovimhaskell/haskell-vim')
" call dein#add('Shougo/denite.nvim')

call plug#end()
" }}}

" Key {{{

let mapleader="\<Space>"
let maplocalleader="-"

nnoremap <Leader>fs :w<CR>
nnoremap <Leader>so :so %<CR>
nnoremap <Leader>h :nohl<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>v <C-w>v
nnoremap <Leader>s <C-w>s
nnoremap <Leader>E :e<space>
" nnoremap <Leader>o :e */**
nnoremap <Leader>l :ls<CR>:b<space>
nnoremap <Leader>m :make<CR>
nnoremap <Leader>M :make<Space>
nnoremap <Leader>c :make %:r<CR> " compile

nnoremap <Localleader>mt :make tags<CR>
nnoremap <Localleader>mc :make clean<CR>

" Just in case remapping caps lock isn't an option
inoremap jk <Esc>
inoremap kj <Esc>

" make arrow key great again! {{{
nnoremap <silent> <Left> :vertical resize +1<CR>
nnoremap <silent> <Right> :vertical resize -1<CR>
nnoremap <silent> <Up> :resize -1<CR>
nnoremap <silent> <Down> :resize +1<CR>
" }}}

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" swap background
map <Localleader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Hack to get C-h working in neovim
nmap <BS> <C-W>h

" Y as other capital
nmap Y y$

" fast yanking/paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" quickly create a tag
nnoremap <Leader>tag bi<<esc>ea><esc>yi<o</<c-r>"><esc>O

nnoremap <Leader>z zA

nnoremap j gj
nnoremap k gk

" apply a macro in visual mode
vnoremap @ :norm@

" quick omnicomplete (C-space)
inoremap <Nul> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" tab
nnoremap <C-n> :tabnew<CR>
nnoremap <PageDown> :tabnext<CR>
nnoremap <PageUp> :tabprevious<CR>

" git
nnoremap <Leader>ga :!git add %<CR>
nnoremap <Leader>gc :!git commit % -m ""<Left>
nnoremap <Leader>gs :!git status<CR>
nnoremap <Leader>gd :!git diff %<CR>
nnoremap <Leader>gp :!git pull<CR>
nnoremap <Leader>gP :!git push<CR>

" }}}

" Commands {{{

command! TODO :grep TODO . -R
command! FIXME :grep FIXME . -R

" }}}

" Basic config {{{

" silent !mkdir -p ~/.config/nvim/undodir/

set autoread
set autowrite
set autowriteall
set completeopt=menu,preview
set cursorline
set gdefault
set hidden
set inccommand=nosplit
set number
set path+=**
set relativenumber
set scrolloff=3
set showcmd
set spelllang=it
set termguicolors
set textwidth=80
set title
set undodir=~/.config/nvim/undodir/
set undofile
set updatetime=1000
set visualbell
set wildignorecase
set wildmenu
set wildmode=full

set grepprg=grep\ -RHIn\ --exclude-dir=\"vendor\"\ --exclude-dir=\"node_modules\"\ --exclude=\"tags\"\ --exclude=\".tags\"\ --exclude-dir=\".svn\"\ --exclude-dir=\".git\"\ --exclude=\"tags\"\ -i

filetype plugin indent on
syntax on

" wildignore {{{
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.swp
set wildignore+=*.zip
set wildignore+=*/vendor/*
set wildignore+=*/cache/*
set wildignore+=*/node_modules/*
set wildignore+=*/_site/*
set wildignore+=*/.git/*
" }}}

set tags=./tags;/

" Tabs {{{
set tabstop=4 " a tab will be represented with 4 columns
set softtabstop=4 " <tab> is pressed in insert mode 4 column
set shiftwidth=4 " indentation is 4 columns
set expandtab " replace <tab>s with spaces, ye
" }}}

" }}}

" Plugins + config! {{{

" tmux navigator
let g:tmux_navigator_save_on_switch=2

" targets.vim
let g:targets_quotes = '"q '' `'

" gitgutter
let g:gitgutter_map_keys = 0

" Lexima (mi vida) {{{

let g:lexima_enable_basic_rules=1
let g:lexima_enable_newline_rules=1
let g:lexima_enable_endwise_rules=1

call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'tex'})
call lexima#add_rule({'char': '$', 'at': '\$\%#\$', 'leave': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'tex'})

call lexima#add_rule({'char': '%', 'at': '{\%#}', 'input': '%', 'input_after': '%', 'filetype': ['html.twig', 'htmldjango.twig']})
call lexima#add_rule({'char': '<BS>', 'at': '{%\%#%}', 'delete': 1, 'filetype': ['html.twig', 'htmldjango.twig']})
call lexima#add_rule({'char': '<space>', 'at': '{%\%#', 'input': ' ', 'input_after': ' ', 'filetype': ['html.twig', 'htmldjango.twig']})
call lexima#add_rule({'char': '<BS>', 'at': '{% \%#', 'delete': 1, 'filetype': ['html.twig', 'htmldjango.twig']})

" }}}

" UltiSnips {{{

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" }}}

" better css3 {{{
augroup css3
    autocmd!
    autocmd FileType css    setlocal omnifunc=csscomplete#CompleteCSS noci
    autocmd FileType sass   setlocal omnifunc=csscomplete#CompleteCSS noci
    autocmd FileType stylus setlocal omnifunc=csscomplete#CompleteCSS noci
augroup END
" }}}

" better javascript {{{

augroup JS
    autocmd!
    autocmd FileType javascript setlocal foldmethod=syntax
    autocmd FileType javascript setlocal foldlevel=10
augroup END

let g:javascript_plugin_jsdoc = 1

" let g:javascript_conceal_function       = ƒ"
let g:javascript_conceal_function       = "⨍"
let g:javascript_conceal_null           = "ø"
" let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇐"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" }}}

" php omnicompletion server
let g:padawan#composer_command = "php ~/bin/composer.phar"

" hardmode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" undo tree {{{

nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>U :UndotreeFocus<CR>

" }}}

" Linters ~neomake~ ALE {{{

" autocmd! BufWritePost,BufRead * Neomake

let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ }

let g:ale_sign_column_always = 1
let g:ale_statusline_format  = ['✗ %d', '⚠ %d', '✓ ok']
let g:ale_sign_error         = '··'
let g:ale_sign_warning       = '· '

" }}}

" FZF
nnoremap <Leader>o :FZF -m<CR>

" tagbar
nnoremap <Leader>t :TagbarToggle<CR>

" Haskell {{{

" neco ghc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:haskell_enable_quantification   = 1 " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1 " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1 " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1 " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1 " to enable highlighting of `static`

" }}}

" Netrw {{{

" nnoremap \| :Vexplore<CR>

" let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" let g:netrw_keepdir=1
augroup netrw
    autocmd!
    autocmd FileType netrw map <buffer> q :q<CR>
    " autocmd FileType netrw map <buffer> \| :q<CR>
    autocmd FileType netrw map <buffer> l <CR>
    autocmd FileType netrw map <buffer> h <CR>
augroup END

" }}}

" }}}

" Search {{{

set incsearch
set nohlsearch
set ignorecase
set smartcase

" }}}

" Graphical {{{
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256

set fillchars+=vert:\│ " important whitespace at the end

set listchars=eol:¬,tab:»\ ,trail:~
set list

set conceallevel=2

" Color scheme <3 {{{

" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = "hard"
" let g:gruvbox_contrast_light = "hard"
" if strftime("%H") > 7 && strftime("%H") < 17
"     set background=light
" else
"     set background=dark
" endif
" set background=dark
" colorscheme gruvbox
set background=dark
" colorscheme Tomorrow-Night-Eighties
colorscheme base16-atelierlakeside
highlight Comment cterm=italic gui=italic
highlight Conceal guibg=NONE ctermbg=NONE
highlight Todo gui=bold cterm=bold

" transparent background
hi! Normal ctermbg=NONE guibg=NONE

" red stolen from hybrid color scheme
hi! ALEErrorSign gui=NONE guifg=#cc6666 guibg=NONE

" }}}

" Statusline {{{

function! ReadOnly()
    if &readonly || !&modifiable
        return '!!'
    else
        return ''
    endif
endfunction

function! GitInfo()
    let git = fugitive#head()
    if git != ''
        return ' - '.fugitive#head()
    else
        return ''
    endif
endfunction

set laststatus=2
set statusline=
set statusline+=%2*\ %<%.15F%{ReadOnly()}%m\ %w\  " File+path
set statusline+=%3*\ %y                           " filetype
set statusline+=%5*\ %{&ff}
set statusline+=%6*%{GitInfo()}
set statusline+=%=                                " left/right separator
set statusline+=%8*%c:                            " column
set statusline+=%l/%L                             " current/total lines
set statusline+=\ %P                              " percentage
set statusline+=\ %{ALEGetStatusLine()}

hi User1 ctermfg=008 ctermbg=0 guifg=White      guibg=#333333
hi User2 ctermfg=009 ctermbg=8 guifg=Violet     guibg=#333333
hi User3 ctermfg=009 ctermbg=8 guifg=LightBlue  guibg=#333333
hi User4 ctermfg=011 ctermbg=8 guifg=LightGreen guibg=#333333
hi User5 ctermfg=012 ctermbg=8 guifg=White      guibg=#333333
hi User6 ctermfg=013 ctermbg=8 guifg=LightBlue  guibg=#333333
hi User7 ctermfg=014 ctermbg=8 guifg=Purple     guibg=#333333
hi User8 ctermfg=015 ctermbg=8 guifg=SeaGreen   guibg=#333333
hi User9 ctermfg=016 ctermbg=8 guifg=SeaGreen   guibg=#333333

" }}}

" }}}

" AU {{{

augroup my-vimrc
    autocmd!

    " remove cursorline in non-focused window
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline

    " common file fix
    au BufNewFile,BufRead .bowerrc        set filetype=json
    au BufNewFile,BufRead *.boot          set filetype=clojure
    au BufNewFile,BufRead .zplugrc set filetype=zsh

    " folding
    au FileType vim setlocal foldmethod=marker

    " quick quit
    au FileType help map <buffer> q :q<CR>

    au FileType help,man map <buffer> j <C-e>
    au FileType help,man map <buffer> k <C-y>

    " css different omnicompletion method
    au FileType css    setlocal completeopt=longest,menu
    au FileType stylus setlocal completeopt=longest,menu

    au FileType markdown,tex setlocal spell

    au FileType php setlocal foldmethod=indent
"     au FileType php setlocal foldlevel=1

    " sometimes the cursorcolumn is useful
    " au BufNewFile,BufRead FileType * setlocal nocursorcolumn
    au FileType pug,stylus setlocal cursorcolumn " doesn't works >:(

augroup END

" }}}

" Scripts {{{

" Remove Trailing Space {{{
command! RemoveTrailingSpace call RTS()
function! RTS()
    execute '%s/\s\+$//'
endfunction
" }}}

" Align regex {{{
command! -nargs=? -range Align <line1>,<line2>call AlignSection('<args>')
vnoremap <silent> <Leader>a :Align<CR>
function! AlignSection(regex) range
    let extra = 1
    if empty(a:regex)
        call inputsave()
        let sep = input('Regex: ')
        call inputrestore()
    else
        let sep = a:regex
    endif
    let maxpos = 0
    let section = getline(a:firstline, a:lastline)
    for line in section
        let pos = match(line, ' *'.sep)
        if maxpos < pos
            let maxpos = pos
        endif
    endfor
    call map(section, 'AlignLine(v:val, sep, maxpos, extra)')
    call setline(a:firstline, section)
endfunction

function! AlignLine(line, sep, maxpos, extra)
    let m = matchlist(a:line, '\(.\{-}\) \{-}\('.a:sep.'.*\)')
    if empty(m)
        return a:line
    endif
    let spaces = repeat(' ', a:maxpos - strlen(m[1]) + a:extra)
    return m[1] . spaces . m[2]
endfunction
" }}}

"}}}

" vim:foldmethod=marker:foldlevel=0
