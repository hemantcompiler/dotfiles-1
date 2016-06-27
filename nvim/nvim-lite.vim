set nocompatible

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set t_Co=256
syntax on
set background=dark
colorscheme desert
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

nnoremap ò :

nnoremap <Leader>fs :w<CR>
nnoremap <Leader>th :nohl<CR>

nnoremap j gj
nnoremap k gk

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

inoremap [ []<Left>
inoremap [<CR> [<CR>]<Esc>O
inoremap [[ [
inoremap [] []

inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O
inoremap (( (
inoremap () ()

" inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" Scripts {{{
" A list of super hyper cool scrips found online, or developed by me

" Remove Trailing Space {{{
" written by me
command! RemoveTrailingSpace call RTS()
function! RTS()
    execute '%s/\s\+$//'
endfunction
" }}}

" Align regex {{{
" Found online, but modified
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

" }}}

set foldenable
set foldmethod=indent
set foldlevel=1

" vim:foldmethod=marker:foldlevel=0
