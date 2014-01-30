" vim: set fdm=marker :

" #Bundles {{{

if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Bundler that knows how to 'make'
NeoBundleFetch 'Shougo/neobundle.vim'

" Run and manage child processes, dependency of many other plugins
NeoBundle 'Shougo/vimproc'

" Ultimate UI system for running fuzzy-search on different things {{{
NeoBundle 'Shougo/unite.vim'
" Always start insert mode
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_split_rule = "botright"
" Search settings
if exists("*unite")
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#set_profile('files', 'smartcase', 1)
endif
"}}}

" Auto-completion plugin integrated with Unite and vimshell {{{
NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" Use TAB to complete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"}}}

" Undo/Redo tree
NeoBundle 'sjl/gundo.vim'

" Insert/Delete brackets in pairs
NeoBundle 'jiangmiao/auto-pairs'

" Git wrapper
NeoBundle 'tpope/vim-fugitive'

" Surrond plugin! Surrond text with a pair of anything (s in normal)
NeoBundle 'tpope/vim-surround'

" Vim JS autocompletion with type hints
NeoBundle 'marijnh/tern_for_vim'
let g:tern_show_argument_hints = 'on_move'

" Syntax definitions
NeoBundle "groenewege/vim-less"
NeoBundle "elzr/vim-json"
NeoBundle "tpope/vim-markdown"
NeoBundle "pangloss/vim-javascript"
NeoBundle "leafgarland/typescript-vim"

" OMG OMG, shell in my VIM {{{
NeoBundle "Shougo/vimshell"
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
if has("gui_running")
  let g:vimshell_editor_command = "mvim"
endif
"}}}

" ##Visual
" Prettiness on the bottom {{{
NeoBundle "bling/vim-airline"
let g:airline_theme='solarized'
set laststatus=2
set encoding=utf-8
if has("gui_running")
  let g:airline_powerline_fonts=1
  " Even special font for this crap
  set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline
endif
" }}}

" Visually sets marks
NeoBundle "kshenoy/vim-signature"

" Colorscheme {{{
NeoBundle "altercation/vim-colors-solarized"
set t_Co=256
let g:solarized_termcolors = 256
let g:solarized_termtrans = 0 " set to 1 if using transparant background
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

try
  colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    " we don't have this theme, whatever
endtry

"set background=light
set background=dark
" }}}

" }}}

" #Essentials {{{
" Turns syntax highlighting on
syntax enable

" Numbers, can you imagine?
set number

" Extra info on the bottom
set ruler

" Highlight current line
set cursorline

" Leader key is comma
let mapleader = ","

" ##Search tweaks {{{
set hlsearch
set incsearch
" Kill current search
nnoremap <silent> <Leader>/ :nohlsearch<CR>
"}}}


" ##AutoCmd essentials{{{
if has("autocmd")
  " Enable file type detection
  filetype on
  filetype plugin indent on
endif
"}}}

" Prefer spaces to tabs and set size to 2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Allows to use mouse to move the cursor
set mouse=a

" Indentation tweaks:
" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" dumb indent
set autoindent

" No need to switch back to English in normal mode
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Buffers tweaks
" Allow to switch from changed buffer
set hidden

" Splits tweaks {{{
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" I want new splits to appear to the right and to the bottom of the current
set splitbelow
set splitright
" }}}


" Wrapping tweaks
set wrap
set linebreak
set textwidth=80
set formatoptions=cq " format using textwidth, including comments and gq

" I can type :help myself, thanks.
noremap <F1> <Esc>

" Gaming swap files
set backupdir=/tmp
set directory=/tmp

" MacVim or GVim options
if has("gui_running")
  set guioptions-=L
endif

" Tweak ESC to be 'jk' typed fast
imap jk <ESC>
" Do not disable it, since kinesis has cool remap to the left thumb
" imap <ESC> <nop>
"}}}

" #Leader mappings {{{
" Show/hide invisibles by <leader>l
nmap <leader>l :set list!<CR>
" Toggle Gundo on <leader>G
nmap <leader>G :GundoToggle<CR>
" Toggle background
if exists("*togglebg")
  call togglebg#map("<leader>B")
endif
" Toggle spelling on/off
nmap <silent> <leader>s :set spell!<CR>
" Tab movements
nnoremap <leader>m :tabn<return>
nnoremap <leader>n :tabp<return>
" Quickly cd to directory
nnoremap <leader>D :Unite -start-insert directory<CR>
" Paste from the yank history
nnoremap <leader>p :Unite -start-insert history/yank<CR>
" }}}

" #Other mappings {{{
" Quickly open files or buffers
nnoremap <C-n> :Unite -start-insert file<CR>
nnoremap <C-p> :Unite -start-insert buffer<CR>
"}}}

" Automatically reload vimrc when it's saved
autocmd BufWritePost .vimrc so ~/.vimrc

" Set shell to bash (because vim would conflict with the default system shell)
set shell=/bin/bash


