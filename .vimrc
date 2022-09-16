"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Welcome ! This vimrc file was made from :
" vimCake : https://github.com/ChuOkupai/vimcake
" freeCodeCamp : https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

"zo to open a single fold under the cursor.
"zc to close the fold under the cursor.
"zR to open all folds.
"zM to close all folds.

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
Plug '42Paris/42header'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'mzlogin/vim-markdown-toc'
Plug 'vimwiki/vimwiki'
Plug 'gosukiwi/vim-zensnippets'
call plug#end()
" }}}

" INDENTATION ------------------------------------------------------------ {{{
filetype indent on "Enable indentation rules that are file-type specific
set tabstop=4 "Indent using four spaces
set softtabstop=4 "Number of spaces in <Tab>
set shiftwidth=4 "When shifting, indent using four spaces
set expandtab "use space char instead of tabs
set autoindent "New lines inherit the indentation of previous lines
set smarttab "Insert “tabstop” number of spaces with the “tab” key
set smartindent "Do smart autoindenting when starting a new line
" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Undoing the bad habits
inoremap <left> <nop>
inoremap <down> <nop>
inoremap <up> <nop>
inoremap <right> <nop>

nnoremap <left> <nop>
nnoremap <down> <nop>
nnoremap <up> <nop>
nnoremap <right> <nop>

inoremap <esc> <nop>

"Set backslash as leader key
let mapleader="\\"

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

" Type jk to exit insert mode quickly.
inoremap jk <Esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing enter will open a new line below the current one.
" Exit insert mode after creating a new line below the current line.
nnoremap <CR> o<esc>

" Yank from cursor to the end of line.
nnoremap Y y$

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Close current window
noremap <c-j><c-j> <c-w>q

" Autocompletion on all open chars
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left>
"inoremap ' ''<Left>
"inoremap " ""<Left>

" }}}

" MISCELLANEOUS ---------------------------------------------------------- {{{
set backupdir=~/.cache/vim "Directory to store backup files
set dir=~/.cache/vim "Directory to store swap files
set history=256 "Stack size
set tabpagemax=64 "Maximum number of files that can be opened with vim -p
set lazyredraw "Don’t update screen during macro and script execution
filetype on " Enable type file detection. Vim will be able to try to detect the type of file in use.
" }}}

" PLUGINS CONFIG --------------------------------------------------------- {{{
filetype plugin on
" vim-airline
let g:airline_theme='dark'
" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
nmap <c-n> :NERDTreeToggle<CR>
" zensnippets
let g:zensnippets_disable_default_mappings = 1
    " Expand snippet
imap <c-a><c-s> <c-x><c-\> zensnippets#expand()
    " Go to next placeholder
nmap <C-s> <C-\> <Plug>ZensnippetsNextPlaceholder
imap <C-s> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
vmap <C-s> <C-\> <Esc><Plug>ZensnippetsNextPlaceholder
    " List all available snippets for the current buffer
inoremap <silent> <C-x><C-x><C-\> <C-o>:call zensnippets#showall()<CR>
nnoremap <silent> <C-x><C-x><C-\> :call zensnippets#showall()<CR>
" 42header
nmap <F2> :Stdheader<CR>
let g:user42='krioja'
let g:mail42='marvin@42lausanne.ch'
" }}}

" SEARCH ----------------------------------------------------------------- {{{
set hlsearch "Search highlighting
set incsearch "Incremental search that shows partial matches
set smartcase "Automatically switch search to case-sensitive when search query contains an uppercase letter
set ignorecase "Ignore capital letters during search
set smartcase " Override the ignorecase option if searching for capital letters. This will allow you to search specifically for capital letters
" }}}

" UI --------------------------------------------------------------------- {{{
syntax on " Enable syntax processing
color koehler " Change color scheme
set mouse=a "Enable mouse
set number "Show line numbers
set relativenumber "Show line relativenumbers
set showcmd "Show the last command in bottom bar
set showmatch "Highlight matching [{()}]
set hlsearch " Use highlighting when doing a search.
set wildmenu "Visual autocompletion for command menu
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
set ruler "Always show cursor position
set list "Enable lists
set listchars=tab:\>\- "Show tabs
set foldmethod=syntax "Fold based on indention levels
set foldcolumn=1 "Enable mouse to open and close folds
set nofoldenable "Open files without closed folds
set confirm "Display a confirmation dialog when closing an unsaved file
noremap <F3> :call FoldToggle()<CR>
"Toggle fold/unfold all folds
set cursorline " Highlight cursor line underneath the cursor horizontally.
set cursorcolumn " Highlight cursor line underneath the cursor vertically.
set scrolloff=5 " do not let cursor scroll below or above N number of lines when scrolling
set nowrap " Do not wrap lines. Allow long lines to extend as far as the line goes
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" VIMWIKI ---------------------------------------------------------------- {{{
set nocompatible
let g:vimwiki_list = [
                        \ {'path': '~/second-brain/',
                        \ 'index': 'README',
                        \ 'syntax': 'markdown',
                        \ 'ext': '.md'}
                \]
au BufRead,BufNewFile *.wiki set filetype=md
" }}}
