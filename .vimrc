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

" Emmet for vim
Plug 'mattn/emmet-vim'

Plug 'editorconfig/editorconfig-vim'

" Jade beautifier and 2 space indentation
Plug 'digitaltoad/vim-jade'

" Awesome surroundness
Plug 'tpope/vim-surround'
" Enable dot (.) for plugin shorthands
Plug 'tpope/vim-repeat'
" Git
Plug 'tpope/vim-fugitive'

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
Plug 'Valloric/YouCompleteMe', { 'do': 'install.py --tern-completer' }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm i' }

" JavaScript
Plug 'pangloss/vim-javascript'
" Plug 'isruslan/vim-es6'
" Plug 'chemzqm/vim-jsx-improve'
Plug 'othree/yajs'
Plug 'othree/javascript-libraries-syntax.vim'

" CoffeeScript support
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'

" Typescript Syntax for Vim
" Plug 'leafgarland/typescript-vim'

" Navigate vim & tmux panes with hjkl
Plug 'christoomey/vim-tmux-navigator'

" HARD MODE
Plug 'wikitopian/hardmode'

" Highlight color codes
Plug 'ap/vim-css-color'

" Easy align
Plug 'junegunn/vim-easy-align'

" base 16 colorschemes : )
Plug 'chriskempson/base16-vim'
" Gruvbox
Plug 'swapsCAPS/gruvbox'
" Oh hai monokai
Plug 'crusoexia/vim-monokai'
" So surprised solarized!
Plug 'lifepillar/vim-solarized8'
" Crosshairs w00t
Plug 'bronson/vim-crosshairs'

Plug 'vim-ruby/vim-ruby'

" Too slow...
" Plug 'posva/vim-vue', { 'do': 'npm i -g eslint eslint-plugin-vue eslint-plugin-coffee eslint-plugin-html' }

Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'


Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'

Plug 'alvan/vim-closetag'

" ugh : /
Plug 'othree/xml.vim'

Plug 'jparise/vim-graphql'

Plug 'w0rp/ale'

Plug 'AndrewRadev/splitjoin.vim'

Plug 'yuttie/comfortable-motion.vim'

Plug 'leafgarland/typescript-vim'

Plug 'henrik/vim-indexed-search'

call plug#end()

filetype plugin indent on
set clipboard+=unnamed
set showcmd
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set number relativenumber
set list
set foldmethod=indent
set foldlevel=99
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set omnifunc=syntaxcomplete#Complete
set colorcolumn=120
set timeoutlen=1000 ttimeoutlen=0
set nowrap
" Enable cursor crosshair
set cursorline
set cursorcolumn
let w:persistent_cursorline = 1
let g:solarized_termcolors=256
" Easily switch buffers
nnoremap <C-b> :bprevious <Enter>
nnoremap <C-n> :bnext <Enter>
set pastetoggle=<F2>
vnoremap <F3> :CoffeeCompile <Enter>
nnoremap <F3> :CoffeeCompile <Enter>
nnoremap <F4> :NERDTreeToggle <Enter>
nnoremap <F5> :w <Enter>
nnoremap <F6> :set hlsearch!<Enter>
nnoremap <F10> :bd <Enter>
vnoremap <leader>= :EasyAlign=<Enter>
vnoremap <leader>: :EasyAlign:<Enter>
vnoremap <leader>, :EasyAlign*,<Enter>
vnoremap <leader><Space> :'<,'>EasyAlign\ <Enter>

nnoremap <leader>n :ALENext<Enter>

let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(80)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-80)<CR>
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" Sort words on line
vnoremap <C-s> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" White space chars
set listchars=tab:»\ \,trail:·

let g:ale_sign_error = '🖕'
let g:ale_sign_warning = '💩'
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_fix_on_save = 1

let g:used_javascript_libs = 'underscore,react,requirejs,chai,vue'

" sensible splitting
set splitbelow " Make vertical splits go to bottom
set splitright " And vertical splits go right

" Macros yay!
autocmd FileType coffee     vnoremap <F7> yoconsole.log "pa", p
autocmd FileType javascript vnoremap <F7> yoconsole.log('pa', pa)
autocmd FileType python     vnoremap <F7> yoprint('pa', pa)
autocmd FileType javascript vnoremap <F8> yodebug('pa %O', pa)

" Beautify JSON... BJ, hehehehe
command! BJ execute "%!python -m json.tool"

set background=dark
colorscheme gruvbox
syntax enable
syntax on

let g:NERDTreeWinSize = 24

" Ctrl-A is used for tmux, but we want vim's inc dec functionality
nnoremap <C-up>   <c-a>
nnoremap <C-down> <c-x>

" Esc remap
inoremap jj <Esc>

" Save all temp madness to one dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set backupcopy=yes

command! L :set background=light
command! D :set background=dark

" command! L :colorscheme solarized8_light_flat <bar> :AirlineTheme solarized <bar> :Tmuxline zenburn
" command! D :colorscheme monokai               <bar> :AirlineTheme bubblegum <bar> :Tmuxline zenburn

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
autocmd! BufWritePost * Neomake

" Airline stuff:
set laststatus=2
let g:airline_powerline_fonts             = 1
let g:airline_theme                       = 'gruvbox'
" let g:airline_theme                       = 'solarized'
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tmuxline#enabled = 0
" let g:tmuxline_preset                     = 'crosshair'
" let g:tmuxline_theme                      = 'airline'

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

" We already use ctrl-p
let vim_markdown_preview_hotkey='<C-m>'
" Use github markdown
let vim_markdown_preview_github=1

" Mappings to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction

command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
