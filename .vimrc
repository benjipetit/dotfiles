" Allow language specific settings
filetype plugin on
filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set hlsearch " highlight all search results
set cursorline " highlight current line

" unable copy-pasting with system clipboard using <Ctrl-C> and <Ctrl-V>
" Cmd is not mappable in Vim in the terminal
vnoremap <C-c> :w !pbcopy<CR><CR> 
noremap <C-v> :r !pbpaste<CR><CR>

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

" highlight for search results
:set hlsearch

" case insensitive search
:set ignorecase

" recursive search with ':find'
set path+=**

" display a menu when multiple files match a ':find' command
set wildmenu

" A more complete status line
" (https://gist.github.com/meskarune/57b613907ebd1df67eb7bdb83c6e6641)

" status bar colors
au InsertEnter * hi StatusLine guifg=black guibg=#d7afff ctermbg=black ctermfg=magenta
au InsertLeave * hi StatusLine guifg=black guibg=#8fbfdc ctermbg=black ctermfg=cyan
hi StatusLine guifg=black guibg=#8fbfdc ctermbg=black ctermfg=cyan

" Status Line Custom
let g:currentmode={
    \ "n"  : "Normal",
    \ "no" : "Normal·Operator Pending",
    \ "v"  : "Visual",
    \ "V"  : "V·Line",
    \ "\<C-V>" : "V·Block",
    \ "s"  : "Select",
    \ "S"  : "S·Line",
    \ "^S" : "S·Block",
    \ "i"  : "Insert",
    \ "R"  : "Replace",
    \ "Rv" : "V·Replace",
    \ "c"  : "Command",
    \ "cv" : "Vim Ex",
    \ "ce" : "Ex",
    \ "r"  : "Prompt",
    \ "rm" : "More",
    \ "r?" : "Confirm",
    \ "!"  : "Shell",
    \ "t"  : "Terminal"
    \}

set laststatus=2 " always show the status bar
set noshowmode

set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}\  " The current mode

hi User1 ctermbg=239 ctermfg=254 guibg=#4e4e4e guifg=#adadad
hi User2 ctermbg=236 ctermfg=254 guibg=#303030 guifg=#adadad
hi User3 ctermbg=236 ctermfg=236 guibg=#303030 guifg=#303030
hi User4 ctermbg=239 ctermfg=255 guibg=#4e4e4e guifg=#4e4e4e

" file skeletons
autocmd BufNewFile  *.swift   0r ~/.vim/templates/viewController.swift

