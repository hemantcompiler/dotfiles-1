" Omar Polo

" Keys {{{

let mapleader="\<Space>"
let maplocalleader=","

nnoremap <Leader>q :q<CR>

nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>

nnoremap <Leader>l :ls<CR>:buffer<space>

nnoremap <Leader>m :make<CR>
nnoremap <Leader>M :make<space>

nnoremap <Leader>h :nohl<CR>

" jk in visual line
nnoremap j gj
nnoremap k gk

" quick navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" quick omnicomplete (C-space)
inoremap <Nul>     <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" stolen from kakoune
nnoremap gh 0
nnoremap gl $
nnoremap gi ^
nnoremap ge G$

vnoremap gh 0
vnoremap gl $
vnoremap gi ^
vnoremap ge G$

" Y as other capital
nnoremap Y y$

" hack to get C-h working in neovim
nmap <BS> <C-W>h
nmap <bs> :<c-u>TmuxNavigateLeft<cr>

" fast yanking/paste
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" quickly create a tag
nnoremap <Leader>t bi<<esc>ea><esc>yi<o</<c-r>"><esc>O

" }}}

" Plugins + config {{{

call plug#begin('~/.local/share/nvim/plugged')


" tpope {{{

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" }}}


" fzf {{{
Plug 'junegunn/fzf', {'do': './install --bin'}
nnoremap <Leader>o :FZF<CR>
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


Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'


" nvim completion manager {{{
Plug 'roxma/nvim-completion-manager'

" javascript completion
Plug 'roxma/nvim-cm-tern',  {'do': 'npm install'}

" PHP completion
Plug 'roxma/nvim-cm-php-language-server',  {'do': 'composer install && composer run-script parse-stubs'}

" trigger ultisnips or show popus hints with the same key
let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>
" }}}


" Cool align plugin {{{
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}


" Colorscheme
Plug 'KeitaNakamura/neodark.vim'

" Lint {{{
" Plug 'w0rp/ale'
Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake

let g:neomake_javascript_standard_maker = {
            \ 'exe': 'standard',
            \ 'args': ['--verbose'],
            \ 'errorformat': '  %f:%l:%v: %m',
            \ }
let g:neomake_javascript_enabled_makers = ['standard']

" let g:ale_sign_column_always = 1
" let g:ale_echo_msg_format    = '[%linter%] %s [%severity%]'
" let g:ale_sign_error         = '··'
" let g:ale_sign_warning       = '· '
hi! ALEErrorSign gui=NONE guifg=#cc6666 guibg=NONE
" }}}

" textobjects {{{
Plug 'wellle/targets.vim'

let g:targets_quotes = '"q '' `'
let g:targets_pairs = '()b {}B []r <>'
" }}}


Plug 'christoomey/vim-tmux-navigator'
Plug 'embear/vim-localvimrc'
Plug 'jwalton512/vim-blade'


" Lexima (mi vida) {{{
" Plug 'cohama/lexima.vim'
Plug '~/Develop/vim-plugins/lexima.vim'
" }}}


" Haskell {{{
Plug 'neovimhaskell/haskell-vim'
let g:haskell_enable_quantification   = 1 " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1 " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1 " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1 " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1 " to enable highlighting of `static`
let g:haskell_backpack                = 1 " to enable highlighting of backpack keywords
" }}}


" Javascript {{{
Plug 'pangloss/vim-javascript'
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'posva/vim-vue'
" }}}


" Emmet
Plug 'mattn/emmet-vim'


" UndoTree {{{
Plug 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>U :UndotreeFocus<CR>
" }}}


" Airline {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
" }}}


" comments {{{
Plug '~/Develop/vim-plugins/vim-sc/'
nnoremap <Leader>c :let b:sc_alternate_comment_style = ( (get(b:, 'sc_alternate_comment_style', 0) == 0) ? 1 : 0 )<CR>
" }}}

call plug#end()

" lexima config {{{
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

" call lexima#add_rule({'char': '<CR>', 'at': '@section\%#', 'input_after': '@endsection', 'filetype': 'blade', 'priority': 1})
" }}}

" }}}

" Commands {{{

command! TODO :grep TODO . -R
command! FIXME :grep FIXME . -R
command! Swapbg :let &background = ( &background == "dark" ? "light" : "dark")

" }}}

" Basic Config {{{

set cursorline
set gdefault " in `:s` the `/g` is by default
set ignorecase
set inccommand=nosplit
set incsearch
set nohlsearch
set number
set path+=**
set relativenumber
set scrolloff=4
set showcmd
set smartcase
set termguicolors
set textwidth=80
set title
set undodir=~/.config/nvim/undodir/
set undofile
set updatetime=2000
set wildignorecase
set wildmenu
set wildmode=full

set grepprg=ag\ --column

filetype plugin indent on
syntax on

" little hack to make vim search recursively a `tags` file
set tags=./tags;/

" Tabs {{{
set tabstop=4 " a tab will be represented with 4 columns
set softtabstop=4 " <tab> is pressed in insert mode 4 column
set shiftwidth=4 " indentation is 4 columns
set expandtab " replace <tab>s with spaces, ye
" }}}

" }}}

" Graphical {{{

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set fillchars+=vert:\│ " important whitespace at the end

set listchars=eol:¬,tab:»\ ,trail:~
set list

set conceallevel=2

" Colorscheme {{{

set background=dark
let g:neodark#terminal_transparent = 1 " default: 0
colorscheme neodark

highlight Comment cterm=italic gui=italic
highlight Conceal guibg=NONE ctermbg=NONE
highlight Todo gui=bold cterm=bold

" transparent background
hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE
" hi! Folded ctermbg=NONE guibg=NONE

"}}}

" Statusline {{{
"
" function! ReadOnly()
"     if &readonly || !&modifiable
"         return '!!'
"     else
"         return ''
"     endif
" endfunction
"
" set laststatus=2
" set statusline=
" set statusline+=%2*\ %<%.15F%{ReadOnly()}%m\ %w\  " File+path
" set statusline+=%3*\ %y                           " filetype
" set statusline+=%5*\ %{&ff}
" set statusline+=%=                                " left/right separator
" set statusline+=%8*%c:                            " column
" set statusline+=%l/%L                             " current/total lines
" set statusline+=\ %P                              " percentage
" " set statusline+=\ %{ALEGetStatusLine()}
"
" hi User1 ctermfg=008 ctermbg=0 guifg=White      guibg=#333333
" hi User2 ctermfg=009 ctermbg=8 guifg=Violet     guibg=#333333
" hi User3 ctermfg=009 ctermbg=8 guifg=LightBlue  guibg=#333333
" hi User4 ctermfg=011 ctermbg=8 guifg=LightGreen guibg=#333333
" hi User5 ctermfg=012 ctermbg=8 guifg=White      guibg=#333333
" hi User6 ctermfg=013 ctermbg=8 guifg=LightBlue  guibg=#333333
" hi User7 ctermfg=014 ctermbg=8 guifg=Purple     guibg=#333333
" hi User8 ctermfg=015 ctermbg=8 guifg=SeaGreen   guibg=#333333
" hi User9 ctermfg=016 ctermbg=8 guifg=SeaGreen   guibg=#333333
"
" " }}}

" }}}

" AU {{{
" one AU to rule them all

augroup initvim
    autocmd!

    " remove cursorline in non-focused window
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline

    " common fix
    au BufNewFile,BufRead .bowerrc set filetype=json
    au BufNewFile,BufRead *.boot   set filetype=clojure
    au BufNewFile,BufRead .zplugrc set filetype=zsh

    " folding
    au FileType vim setlocal foldmethod=marker

    " rage quitting
    au FileType help,man map <buffer> q :q<CR>

" }}}

" vim:foldmethod=marker:foldlevel=0
