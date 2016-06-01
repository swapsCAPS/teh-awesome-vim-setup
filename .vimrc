" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
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

" Syntax checker
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
" To use emmet: in an empty file type html:5 then press 'ctrl-y ,' Tada!
" Or visual select then press 'ctrl-y ,' and type a tag to surround selection
" For multiple tags use div>ul>li* for example

" Beautify js, json, html, css, etc
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify' " Used by vim-jsbeautify
" Jade beautifier and 2 space indentation
Plugin 'digitaltoad/vim-jade'

" to fix whitespace errors call :FixWhiteSpace
Plugin 'bronson/vim-trailing-whitespace'

" Surround words with tags, etc. For example press 'ysiw "' to surround inner
" word with "
Plugin 'tpope/vim-surround'

" Easy semicolon appending with '\ ;' whereever on a line
Plugin 'lfilho/cosco.vim'

" Auto close brackets, quotes, etc.
Plugin 'Townk/vim-autoclose'

" Auto close html, xml, etc.
" Plugin 'alvan/vim-closetag'

" Info line at the bottom of the screen
Plugin 'bling/vim-airline'

" Fuzzy finder (quick file finder) press 'ctrl-p'! :)
Plugin 'kien/ctrlp.vim'

" Auto completer:
" Dont forget to compile using 'cd ~/teh-awesome-vim-setup/YouCompleteMe/ &&
" install.py --tern-completer'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'

" Improved javascript syntax highlighting and indentation
Plugin 'pangloss/vim-javascript'

" Typescript Syntax for Vim
Plugin 'leafgarland/typescript-vim'

" Git wrapper for vim : )
Plugin 'tpope/vim-fugitive'

" Solarized theme
Plugin 'altercation/vim-colors-solarized'

" Code outline viewer
Plugin 'majutsushi/tagbar'

" Navigate vim & tmux panes with hjkl
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
" if has("autocmd")
"   filetype plugin indent on
" endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch	" Show matching brackets.
set ignorecase	" Do case insensitive matching
set smartcase	" Do smart case matching
set incsearch	" Incremental search
set autowrite	" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" My own stuff:
:set number
:set relativenumber
:set background=dark
:colorscheme solarized
:syntax enable
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set smarttab
:iabbrev </ </<C-X><C-O>
:set omnifunc=syntaxcomplete#Complete
:set colorcolumn=80
:set pastetoggle=<F2>
:set clipboard=unnamed

" Mouse fix for tmux and vim
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

autocmd FileType jade setlocal tabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType javascript,css nnoremap <silent> <leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> <leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" Disable arrow keys in normal mode
nnoremap <Up>	<Nop>
nnoremap <Down>	<Nop>
nnoremap <Left>	<Nop>
nnoremap <Right>	<Nop>
" Disable arrow keys in insert mode
inoremap <Up>	<Nop>
inoremap <Down>	<Nop>
inoremap <Left>	<Nop>
inoremap <Right>	<Nop>

" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Don't forget to install jshint or some other checker like this:
" sudo npm install -g jshint
" sudo echo "PATH=\$PATH:/usr/local/lib/node_modules/jshint" >> ~/.profile

" Airline stuff:
set laststatus=2

" JsBeautify stuff, bind Ctrl-F to beautify while in visual mode
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" Mustache auto completion
let g:mustache_abbreviations = 1

" Auto close tags for these filetypes
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" vim-javascript stuff
let g:javascript_enable_domhtmlcss = 1
" set foldmethod=syntax " Please note this can have a dramatic effect on performance and because it is a global vim option, we do not set it ourselves.

" Mappings to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
