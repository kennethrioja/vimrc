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
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'mzlogin/vim-markdown-toc'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
call plug#end()
" }}}

" 42VIMRC ---------------------------------------------------------------- {{{

"Activate indentation
filetype off
filetype plugin indent on
set smartindent "Do smart autoindenting when starting a new line

"Non-expanded, 4-wide tabulations
set tabstop=4 "Indent using four spaces
set shiftwidth=4 "When shifting, indent using four spaces
" set tw=80
set noexpandtab "Not using spaces char instead of tabs

"Disable vi-compatibility
set nocompatible

"Real-world encoding
set encoding=utf-8

"Interpret modelines in files
set modelines=1

"Do not abandon buffers
set hidden

"Don't bother throttling tty
set ttyfast

"More useful backspace behavior
set backspace=indent,eol,start

"Use statusbar on all windows
set laststatus=2

"Better search
set ignorecase "Ignore capital letters during search
set smartcase " Override the ignorecase option if searching for capital letters. This will allow you to search specifically for capital letters
set incsearch "Incremental search that shows partial matches
set showmatch "Highlight matching [{()}]
set hlsearch " Use highlighting when doing a search.

" }}}

" INDENTATION ------------------------------------------------------------ {{{
" set smarttab "Insert “tabstop” number of spaces with the “tab” key
" set softtabstop=4 "Number of spaces in <Tab>
" set expandtab "use space char instead of tabs
" set autoindent "New lines inherit the indentation of previous lines
" set smartindent "Do smart autoindenting when starting a new line
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

" br mark
inoremap <c-b> <ESC>A<br><CR>
nnoremap <c-b> A<br><CR>

" substitute
nnoremap SS *yiw:%s/<C-R>"//gc<LEFT><LEFT><LEFT>

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

" UI --------------------------------------------------------------------- {{{
syntax on " Enable syntax processing
" color koehler " Change color scheme SILENCED IN 42
set mouse=a "Enable mouse
set number "Show line numbers
set relativenumber "Show line relativenumbers
set showcmd "Show the last command in bottom bar
set wildmenu "Visual autocompletion for command menu
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions.
set ruler "Always show cursor position
" set list "Enable lists
" set listchars=tab:\>\- "Show tabs SILENCED IN 42
set foldmethod=syntax "Fold based on indention levels
set foldcolumn=1 "Enable mouse to open and close folds
set nofoldenable "Open files without closed folds
set confirm "Display a confirmation dialog when closing an unsaved file
noremap <F3> :call FoldToggle()<CR>
"Toggle fold/unfold all folds
set cursorline " Highlight cursor line underneath the cursor horizontally.
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
                        \ {'path': '~/secondbrain/',
                        \ 'index': 'README',
                        \ 'syntax': 'markdown',
                        \ 'ext': '.md'}
                \]
au BufRead,BufNewFile *.wiki set filetype=md
" }}}

" CPP CLASS --------------------------------------------------------------- {{{
"C++ Class Generator
"Put yourself in the head directory (there should be ./Makefile and ./src)
command! -nargs=1 Class call Class(<f-args>)
function! Class(ClassName)
	if !isdirectory("./inc")
		call mkdir("./inc")
	endif
	"==================  editing header file =====================
	let header = "./inc/".a:ClassName.".hpp"                                                                                                                                                                                                                                                                                        
	:tabnew "./inc/".a:ClassName."/.hpp"
	call append(0, "#ifndef ".toupper(a:ClassName)."_HPP")
	call append(1, "# define ".toupper(a:ClassName)."_HPP")
	call append(2, "")
	call append(3, "class	".a:ClassName."")
	call append(4, "{")
	call append(5, "public:")
	call append(6, "	".a:ClassName."(void);")
	call append(7, "	".a:ClassName."(".a:ClassName." const & src);")
	call append(8, "	".a:ClassName."&	operator=(".a:ClassName." const & rhs);")
	call append(9, "	virtual ~".a:ClassName."(void);")
	call append(10, "")                                                                                                  
	call append(11, "	int			get".a:ClassName."(void) const;")                                                                                                  
	call append(12, "	static int	getNbInst(void);")                                                                                                  
	call append(13, "")                                                                                                  
	call append(14, "private:")                                                                                       
	call append(15, "	int			_".tolower(a:ClassName).";")
	call append(16, "	static int	_nbInst;")
	call append(17, "};")                                                                                               
	call append(18, "")                                                                                                  
	call append(19, "#endif // ".toupper(a:ClassName)."_HPP")                                                              
	:execute 'write' header                                                                                             
	"================== editing source file ========================                                                      
	let src    = "./src/".a:ClassName.".cpp"                                                                                     
	:tabnew "./src/".a:ClassName."/.cpp"                                                                                                                                                                                                                    
	call append(0, "# include \"".a:ClassName.".hpp\"")
	call append(1, "# include <iostream>")
	call append(2, "")
	call append(3, "// PUBLIC")
	call append(4, "")
	call append(5, "// Default Constructor ")
	call append(6, a:ClassName."::".a:ClassName."(void) : _".tolower(a:ClassName)."(0)")
	call append(7, "{")
	call append(8, "	std::cout << \"Default Constructor ".a:ClassName." Called\" << std::endl;")
	call append(9, "	Bureaucrat::_nbInst++;")
	call append(10, "	return;")
	call append(11, "}")
	call append(12, "")
	call append(13, "// Copy Constructor ")
	call append(14, a:ClassName."::".a:ClassName."(".a:ClassName." const & src)")
	call append(15, "{")
	call append(16, "	std::cout << \"Copy Constructor ".a:ClassName." Called\" << std::endl;")
	call append(17, "	*this = src;")
	call append(18, "	Bureaucrat::_nbInst++;")
	call append(19, "	return;")
	call append(20, "}")
	call append(21, "")
	call append(22, "// Copy assignment operator")
	call append(23, a:ClassName." &	".a:ClassName."::operator=(".a:ClassName." const & rhs)")
	call append(24, "{")
	call append(25, "	std::cout << \"Copy Assignment Operator Constructor ".a:ClassName." Called\" << std::endl;")
	call append(26, "	if (this != &rhs)")
	call append(27, "		this->_".tolower(a:ClassName)." = rhs.get".a:ClassName."();")
	call append(28, "	Bureaucrat::_nbInst++;")
	call append(29, "	return *this;")
	call append(30, "}")
	call append(31, "")
	call append(32, "// Default Destructor ")
	call append(33, a:ClassName."::~".a:ClassName."(void)")
	call append(34, "{")
	call append(35, "	std::cout << \"Destructor ".a:ClassName." Called\" << std::endl;")
	call append(36, "	Bureaucrat::_nbInst--;")
	call append(37, "	return;")
	call append(38, "}")
	call append(39, "")
	call append(40, "int	".a:ClassName."::get".a:ClassName."(void) const")
	call append(41, "{")
	call append(42, "	return this->_".tolower(a:ClassName).";")
	call append(43, "}")
	call append(44, "")
	call append(45, "int	".a:ClassName."::getNbInst(void)")
	call append(46, "{")
	call append(47, "	return ".a:ClassName."::_nbInst;")
	call append(48, "}")
	call append(49, "// PRIVATE")
	call append(50, "")
	call append(51, "int	".a:ClassName."::_nbInst = 0;")
	:execute 'write' src
endfunction
" }}}
