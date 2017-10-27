runtime! debian.vim
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git diff in line number column
Plug 'airblade/vim-gitgutter'

" Using neomake
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'

" Emmet for vim
Plug 'mattn/emmet-vim'

Plug 'editorconfig/editorconfig-vim'

" Jade beautifier and 2 space indentation
Plug 'digitaltoad/vim-jade'

" Awesome surroundness
Plug 'tpope/vim-surround'
" Enable dot (.) for plugin shorthands
Plug 'tpope/vim-repeat'

" Auto close brackets, quotes, etc.
Plug 'jiangmiao/auto-pairs'

" Info line at the bottom of the screen
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" tmux statusline integration
Plug 'edkolev/tmuxline.vim'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Markdown preview
Plug 'JamshedVesuna/vim-markdown-preview', { 'do': 'pip install --user --upgrade grip' }

" Auto completer
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm i' }

" Improved javascript syntax highlighting and indentation
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'crusoexia/vim-javascript-lib'

" Coffee script support
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'

" Typescript Syntax for Vim
Plug 'leafgarland/typescript-vim'

" Navigate vim & tmux panes with hjkl
Plug 'christoomey/vim-tmux-navigator'

" Sublime style minimap
Plug 'severin-lemaignan/vim-minimap'

" HARD MODE
Plug 'wikitopian/hardmode'

" Highlight color codes
Plug 'ap/vim-css-color'

" Easy align
Plug 'junegunn/vim-easy-align'

" base 16 colorschemes : )
Plug 'chriskempson/base16-vim'
" ALL THE COLORS
Plug 'flazz/vim-colorschemes'
" Gruvbox
Plug 'morhetz/gruvbox'
" Oh hai monokai
Plug 'crusoexia/vim-monokai'
" So surprised solarized!
Plug 'lifepillar/vim-solarized8'
" Crosshairs w00t
Plug 'bronson/vim-crosshairs'

Plug 'vim-ruby/vim-ruby'
call plug#end()

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set clipboard+=unnamedplus
set showcmd		" Show (partial) command in status line.
set ignorecase
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set autowrite	" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set number
syntax on
syntax enable
set foldmethod=indent
set foldlevel=99
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
let g:solarized_termcolors=256
" Easily switch buffers
nnoremap <c-b> :bprevious <Enter>
nnoremap <c-n> :bnext <Enter>
set pastetoggle=<F2>
vnoremap <F3> :CoffeeCompile <Enter>
nnoremap <F3> :CoffeeCompile <Enter>
nnoremap <F4> :NERDTreeToggle <Enter>
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
"
" Color stuff
" if filereadable(expand("~/.vimrc_background"))
  " let base16colorspace=256
  " source ~/.vimrc_background
" endif
" set t_Co=256
if has('nvim')
  set termguicolors
endif
colorscheme monokai

let g:NERDTreeWinSize = 24

" Ctrl-A is used for tmux, but we want vim's inc dec functionality
nnoremap <C-up>   <c-a>
nnoremap <C-down> <c-x>

" Esc remap
inoremap jj <Esc>

" Save all temp madness to one dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

command! L :colorscheme solarized8_light_flat <bar> :AirlineTheme solarized <bar> :Tmuxline zenburn
command! D :colorscheme monokai               <bar> :AirlineTheme bubblegum <bar> :Tmuxline zenburn

" Mouse fix for tmux and vim
set mouse+=a
if &term =~ '^screen'
  if !has('nvim')
    set ttymouse=xterm2
  endif
endif

" cson is coffeescript
au BufRead,BufNewFile *.cson  set ft=coffee

" Neomake stuff
let g:neomake_jsx_enabled_makers        = ['eslint']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_json_enabled_makers       = ['jsonlint']
let g:neomake_json5_enabled_makers      = ['jsonlint']
let g:neomake_coffee_enabled_makers     = ['coffeelint']
autocmd! BufWritePost * Neomake

" Airline stuff:
set laststatus=2
let g:airline_powerline_fonts             = 1
let g:airline_theme                       = 'bubblegum'
" let g:airline_theme                       = 'solarized'
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset                     = 'crosshair'
let g:tmuxline_theme                      = 'airline'

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

" Mustache auto completion
let g:mustache_abbreviations = 1

" Auto close tags for these filetypes
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" vim-javascript stuff
let g:javascript_enable_domhtmlcss = 1

" We already use ctrl-p
let vim_markdown_preview_hotkey='<C-m>'
" Use github markdown
let vim_markdown_preview_github=1

" Mappings to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
