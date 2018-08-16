" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set hlsearch " highlight all search results
set cursorline " highlight current line
set vb " remove audio bell 
set laststatus=2 " always show the status bar

" enable syntax highligthing
syntax on

" Enable relative line number
set number
set relativenumber

" enable fzf (fuzzy finder)
set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')

" Swift syntax and syntastic
Plug 'vim-syntastic/syntastic'
Plug 'keith/swift.vim'

" Ctrl-p (fuzzy search)
Plug 'kien/ctrlp.vim'

" Snipmate and dependencies
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

call plug#end()

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_shell = "/bin/zsh"

" Syntastic checkers
let g:syntastic_swift_checkers = ['swiftlint']

" enable mouse 
set mouse=a

" highlight for search results
:set hlsearch

" case insensitive search
:set ignorecase

" recursive search with ':find'
set path+=**

" display a menu when multiple files match a ':find' command
set wildmenu

" we use a dark background
:set background=dark

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ [%l,%c]\ [%L,%p%%]

" Setup some custom colors
highlight StatusLine ctermbg=240 ctermfg=12

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" file skeletons
autocmd BufNewFile  *.swift   0r ~/.vim/templates/viewController.swift
