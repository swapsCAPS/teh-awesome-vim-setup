runtime! debian.vim
set nocompatible
filetype off

set clipboard+=unnamedplus
set showcmd
set ignorecase
set smartcase
set incsearch
set nohlsearch
set autowrite
set hidden
set relativenumber
set list
set foldmethod=indent
set foldlevel=99
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=120
set timeoutlen=1000 ttimeoutlen=0
set nowrap
set background=dark
" Save all temp madness to one dir, tries all these. Dir must exist. Will not be created
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupcopy=yes
set mouse=a
syntax enable
syntax on
color desert

" set cursorline
" set cursorcolumn
hi ColorColumn cterm=NONE ctermbg=darkgrey ctermfg=white
hi CursorLine  cterm=NONE ctermbg=darkgrey ctermfg=white

set listchars=tab:»\ \,trail:·
