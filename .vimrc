runtime! debian.vim
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'

Plug 'mattn/emmet-vim'

Plug 'sheerun/vim-polyglot'

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'christoomey/vim-tmux-navigator'

Plug 'junegunn/vim-easy-align'

Plug 'chriskempson/base16-vim'

Plug 'bronson/vim-crosshairs'

Plug 'yuttie/comfortable-motion.vim'

Plug 'henrik/vim-indexed-search'

Plug 'delphinus/vim-firestore'
Plug 'nicholaschiang/firestore-rules-vim-syntax'

Plug 'zivyangll/git-blame.vim'

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

let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(80)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-80)<CR>
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" Sort words on line
vnoremap <C-s> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" White space chars
set listchars=tab:»\ \,trail:·

" Macros yay!
autocmd FileType rust       vnoremap <F7> yoprintln!("pa {}", pa);
autocmd FileType rust       vnoremap <F8> yodebug!("pa {}", pa);
autocmd FileType coffee     vnoremap <F7> yoconsole.log "pa", p
autocmd FileType javascript vnoremap <F7> yoconsole.log('pa', pa)
autocmd FileType python     vnoremap <F7> yoprint('pa', pa)
autocmd FileType javascript vnoremap <F8> yodebug('pa %O', pa)

command! BJ execute "%!python -m json.tool"

syntax enable
syntax on

" Ctrl-A is used for tmux, but we want vim's inc dec functionality
nnoremap <C-up>   <c-a>
nnoremap <C-down> <c-x>

" Esc remap
inoremap jj <Esc>

" Save all temp madness to one dir
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set backupcopy=yes

au BufRead,BufNewFile *.html.tera set filetype=html

" Mouse fix for tmux and vim
set mouse+=a
if &term =~ '^screen'
  if !has('nvim')
    set ttymouse=xterm2
  endif
endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set laststatus=2
let g:airline_powerline_fonts             = 1
let g:airline_theme                       = 'base16'
let g:airline#extensions#tabline#enabled  = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Nerd commenter stuff
let g:NERDSpaceDelims            = 1
let g:NERDTrimTrailingWhitespace = 1

" Nerd tree stuff
let g:NERDTreeWinSize = 24

" Ctrl-p
" Ignore certain stuff
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules$|build$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_root_markers = ['.ctrlproot', '.git']

" Fix editorconfig + fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Mappings to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Needed for gitblame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

"
" #### Space2Tab Tab2Space ####
"
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

" Don't format csv files
let g:csv_no_conceal = 1
" NOTE :CSVTabularize is a really cool cmd

"
" #### COC CONFIG ####
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
