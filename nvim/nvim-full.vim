set nocompatible " be iMproved

" Plug {{{
" set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

call plug#begin()

Plug 'flazz/vim-colorschemes'

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
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'wellle/targets.vim'

" Plug 'tpope/vim-commentary'
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

let mapleader="\"
let maplocalleader="ò"

nnoremap fs :w
nnoremap so :so %
nnoremap h :nohl
nnoremap q :q
nnoremap v v
nnoremap s s
nnoremap E :e
" nnoremap o :e */**
nnoremap l :ls:b
nnoremap m :make
nnoremap M :make
nnoremap c :make %:r " compile

nnoremap mt :make tags
nnoremap mc :make clean

" Just in case remapping caps lock isn't an option
inoremap jk 
inoremap kj 

" make arrow key sense-full again! {{{
nnoremap   :vertical resize +1
nnoremap   :vertical resize -1
nnoremap   :resize -1
nnoremap   :resize +1
" }}}

nnoremap  j
nnoremap  k
nnoremap  h
nnoremap  l

" swap background
map bg :let &background = ( &background == "dark"? "light" : "dark" )

" Hack to get C-h working in neovim
nmap  h
tnoremap  

" Y as other capital
nmap Y y$

" fast yanking/paste
vmap y "+y
vmap d "+d
nmap p "+p
nmap P "+P
vmap p "+p
vmap P "+P

nnoremap z zA

nnoremap j gj
nnoremap k gk

" apply a macro in visual mode
vnoremap @ :norm@

" quick omnicomplete (C-space)
inoremap  

" tab
nnoremap  :tabnew
nnoremap  :tabnext
nnoremap  :tabprevious

" git
nnoremap ga :!git add %
nnoremap gc :!git commit % -m ""
nnoremap gs :!git status
nnoremap gd :!git diff %
nnoremap gp :!git pull
nnoremap gP :!git push

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

set grepprg=grep\ -RHIn\ --exclude-dir=\"vendor\"\ --exclude-dir=\"node_modules\"\ --exclude=\"tags\"\ --exclude=\".tags\"\ --exclude-dir=\".svn\"\ --exclude-dir=\".git\"\ --exclude=\"tags\"

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
set softtabstop=4 "  is pressed in insert mode 4 column
set shiftwidth=4 " indentation is 4 columns
set expandtab " replace s with spaces, ye
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
call lexima#add_rule({'char': '', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'tex'})

call lexima#add_rule({'char': '%', 'at': '{\%#}', 'input': '%', 'input_after': '%', 'filetype': ['html.twig', 'htmldjango.twig']})
call lexima#add_rule({'char': '', 'at': '{%\%#%}', 'delete': 1, 'filetype': ['html.twig', 'htmldjango.twig']})
call lexima#add_rule({'char': '', 'at': '{%\%#', 'input': ' ', 'input_after': ' ', 'filetype': ['html.twig', 'htmldjango.twig']})
call lexima#add_rule({'char': '', 'at': '{% \%#', 'delete': 1, 'filetype': ['html.twig', 'htmldjango.twig']})

" }}}

" UltiSnips {{{

let g:UltiSnipsExpandTrigger=""
let g:UltiSnipsJumpForwardTrigger=""
let g:UltiSnipsJumpBackwardTrigger=""

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
    autocmd FileType javascript setlocal foldlevel=1
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

" undo tree {{{

nnoremap u :UndotreeToggle
nnoremap U :UndotreeFocus

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
nnoremap o :FZF -m

" tagbar
nnoremap t :TagbarToggle

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

" nnoremap \| :Vexplore

" let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" let g:netrw_keepdir=1
augroup netrw
    autocmd!
    autocmd FileType netrw map  q :q
    " autocmd FileType netrw map  \| :q
    autocmd FileType netrw map  l 
    autocmd FileType netrw map  h 
augroup END

" }}}

" }}}

" Search {{{

set incsearch
set hlsearch
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

    " folding
    au FileType vim setlocal foldmethod=marker

    " quick quit
    au FileType help map  q :q

    " css different omnicompletion method
    au FileType css    setlocal completeopt=longest,menu
    au FileType stylus setlocal completeopt=longest,menu

    au FileType markdown,tex setlocal spell

    au FileType php setlocal foldmethod=indent
    au FileType php setlocal foldlevel=1

    " sometimes the cursorcolumn is useful
    " au BufNewFile,BufRead FileType * setlocal nocursorcolumn
    au FileType pug,stylus setlocal cursorcolumn " doesn't works >:(

augroup END

" }}}

" Scripts {{{

" who needs commentary/NERDcommenter anymore? {{{

" a little script of mine

let s:comment_chars = {
            \ 'vim': '"',
            \ 'php': '//',
            \ 'javascript': '//',
            \ 'c': '//',
            \ 'cpp': '//',
            \ 'java': '//',
            \ 'lisp': ';;',
            \ 'clojure': ';;',
            \ 'clojurescript': ';;',
            \ 'xdefaults': '!',
            \ 'conf': '\#',
            \ 'markdown': '>',
            \ 'sh': '\#',
            \ 'bash': '\#',
            \ 'zsh': '\#',
            \ 'haskell': '--',
            \ 'lua': '--',
            \ 'sql': '--',
            \ }

function! Comment(...)
    let comment_char = s:comment_chars[&filetype]
    let comment_len = strlen(comment_char) + 1
    silent exe "'[,']norm i". comment_char . " "
endfunction

function! Uncomment(...)
    let comment_char = s:comment_chars[&filetype]
    let comment_len = strlen(comment_char) + 1
    silent exe "'[,']norm ^". repeat('x', comment_len)
endfunction

function! AppendComment(...)
    let comment_char = s:comment_chars[&filetype]
    let culen = strlen(getline('.'))
    silent exe "norm A". (culen == 0 ? '' : ' ') . comment_char . " "
    startinsert!
endfunction

nmap  gc :set opfunc=Commentg@
nmap  gu :set opfunc=Uncommentg@
nmap  gcc gcl
nmap  guu gul
nmap  ga :call AppendComment()

" }}}

" Remove Trailing Space {{{
command! RemoveTrailingSpace call RTS()
function! RTS()
    execute '%s/\s\+$//'
endfunction
" }}}

" Align regex {{{
command! -nargs=? -range Align ,call AlignSection('')
vnoremap  a :Align
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
