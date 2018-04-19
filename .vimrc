runtime! debian.vim
set nocompatible
filetype off

" yanks to os buffer, but will give weird results as some unexpected operations also yank (such as x, c, etc)
" set clipboard+=unnamedplus
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
hi ColorColumn cterm=NONE ctermbg=darkgrey
set timeoutlen=1000 ttimeoutlen=0
set nowrap " Set to wrap if you would like to enable line wrapping
set background=dark
" Save all temp madness to one dir, tries all these. Dir must exist. Will not be created
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupcopy=yes
set mouse=a
syntax enable
syntax on
color desert

" sensible splitting
set splitbelow " Make vertical splits go to bottom
set splitright " And vertical splits go right

" Enable this if you want cursor crosshairs, mind you that the colors expect a dark theme
" set cursorline
" set cursorcolumn
" hi CursorLine  cterm=NONE ctermbg=darkgrey

nnoremap <F5>  :w <Enter>
nnoremap <F10> :q <Enter>

set listchars=tab:»\ \,trail:·
