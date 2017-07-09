runtime! debian.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Place plugins here:

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Git diff in line number column
Plugin 'airblade/vim-gitgutter'

" Emmet for vim
Plugin 'mattn/emmet-vim'

Plugin 'editorconfig/editorconfig-vim'

" Awesome surroundness
Plugin 'tpope/vim-surround'
" Git wrapper for vim : )
Plugin 'tpope/vim-fugitive'
" Enable dot (.) for plugin shorthands
Plugin 'tpope/vim-repeat'

" Auto close brackets, quotes, etc.
Plugin 'jiangmiao/auto-pairs'

" Info line at the bottom of the screen
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" tmux statusline integration
Plugin 'edkolev/tmuxline.vim'

" Fuzzy finder (quick file finder) press 'ctrl-p'! :)
Plugin 'ctrlpvim/ctrlp.vim'

" Improved javascript syntax highlighting and indentation
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'crusoexia/vim-javascript-lib'

" Coffee script support
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'

" Typescript Syntax for Vim
Plugin 'leafgarland/typescript-vim'

" Navigate vim & tmux panes with hjkl
Plugin 'christoomey/vim-tmux-navigator'

" Sublime style minimap
Plugin 'severin-lemaignan/vim-minimap'

" Highlight color codes
Plugin 'ap/vim-css-color'

" Oh hai monokai
Plugin 'crusoexia/vim-monokai'
" Crosshairs w00t
Plugin 'bronson/vim-crosshairs'

" Indentation based on what current file uses
" Plugin 'tpope/vim-sleuth'

" CSS syntax support
Plugin 'hail2u/vim-css3-syntax.git'

Plugin 'vim-ruby/vim-ruby'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set showcmd		" Show (partial) command in status line.
" set showmatch	" Show matching brackets.
set noignorecase	" Do case sensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set autowrite	" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned

" My own stuff:
set number
set relativenumber
syntax on
syntax enable
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
iabbrev </ </<C-X><C-O>
set omnifunc=syntaxcomplete#Complete
set colorcolumn=80
set clipboard=unnamed
set timeoutlen=1000 ttimeoutlen=0
set nowrap
" Enable cursor crosshair
set cursorline
set cursorcolumn
let w:persistent_cursorline = 1
" Easily switch buffers
nnoremap <c-b> :bprevious <Enter>
nnoremap <c-n> :bnext <Enter>
set pastetoggle=<F2>
nnoremap <F3> :CoffeeCompile <Enter>
vnoremap <F3> :CoffeeCompile <Enter>
nnoremap <F4>  :NERDTreeToggle <Enter>
nnoremap <F5> :w <Enter>
nnoremap <F10> :bd <Enter>
let hlstate=0
nnoremap <F6> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" Macros yay!
autocmd FileType coffee nnoremap <F7> oconsole.log "pa", p
autocmd FileType coffee vnoremap <F7> yoconsole.log "pa", p
autocmd FileType javascript nnoremap <F7> oconsole.log("pa", pa)
autocmd FileType javascript vnoremap <F7> yoconsole.log("pa", pa)

" Beautify JSON... BJ, hehehehe
command! BJ execute "%!python -m json.tool"

" Color stuff
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" set t_Co=256
if has('nvim')
  set termguicolors
endif
colorscheme monokai

let g:NERDTreeWinSize = 24

" Ctrl-A is used for tmux, but we want vim's inc dec functionality
nnoremap <c-c> <c-a>

" Awesome esc remap!
inoremap jj <Esc>

" Save all temp madness to one dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Easily toggle background color
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Mouse fix for tmux and vim
set mouse+=a
if &term =~ '^screen'
  if !has('nvim')
    set ttymouse=xterm2
  endif
endif

" Use leader ; to place a semicolon at the end of the line
autocmd FileType javascript,css nnoremap <silent> <leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" cson is coffeescript
au BufRead,BufNewFile *.cson set ft=coffee

" Airline stuff:
set laststatus=2
let g:airline_powerline_fonts             = 1
let g:airline_theme                       = 'bubblegum'
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset                     = 'crosshair'
let g:tmuxline_theme                      = 'zenburn'

" Nerd commenter stuff
let g:NERDSpaceDelims            = 1
let g:NERDTrimTrailingWhitespace = 1

" Ctrl-p
" Ignore certain stuff
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules$|build$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Fix editorconfig + fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Use jsx in js files as well
let g:jsx_ext_required = 0

" Auto close tags for these filetypes
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" vim-javascript stuff
let g:javascript_enable_domhtmlcss = 1

" Mappings to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
