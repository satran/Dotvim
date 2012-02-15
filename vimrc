set nocompatible 		" Don't be compatible with vi

" ==================================================================================
" Load pathogen with docs with all plugins
" ==================================================================================
runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype off
call pathogen#infect()

" ==================================================================================
" Basic Settings
" ==================================================================================
syntax on
filetype on
filetype plugin indent on
set pastetoggle=<F3>			"turn off auto-indent when pasting text
colo rdark-terminal    " Set color for Vim, GUI has a seperate option
set nolist  		" Disable list chars
set showcmd
set mouse=a    " Set use of mouse when using the terminal
set wrap    " Wrapping without line break and in words instead of letters
set formatoptions+=l
set lbr
set encoding=utf-8

" Folding using indents
"set foldenable
"set foldmethod=indent
" set foldcolumn=2

set noerrorbells " don't make noise
set ofu=syntaxcomplete

" Tabs and spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent
set number
set modeline
set hidden
set backspace=indent,eol,start     " more backspace settings
set t_Co=256

" No swap and backup files. I hate the .swp files polluting my system. Though
" it is a bad system. I would recommend you customize this to your need.
set nobackup
set nowritebackup
set noswapfile

" set textwidth=79    " Ofourse setting the textwidth

" Cool Stuffs I picked up from http://amix.dk/vim/vimrc.html
set wildmenu        "Turn on WiLd menu
set ruler           "Always show current position
set ignorecase      "Ignore case when searching
set smartcase
set hlsearch        "Highlight search things
set incsearch


" ==================================================================================
" GUI Settings
" ==================================================================================
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set gfn=Meslo\ LG\ L:h12
    " set gfn=Espresso\ Mono\ Regular:h13
    colo tutticolori
    " colo rdark
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
endif

" Status Line mode
set laststatus=2



" Hide .pyc in File browser and NERDTree
let g:explHideFiles='^\.,.*.pyc$'
let NERDTreeIgnore=['\.pyc$', '\~$', 'PYSMELLTAG']

"Setting for the File Browser
let g:netrw_liststyle         = 3
let g:netrw_list_hide         = '.*\.pyc,.DS_Store,.git,.ropeproject'
"
" MiniBuf Explorer settings
let g:miniBufExplSortBy = "name"

" Pep 8 styling
let g:pep8_map='<leader>8'

" ==================================================================================
" Mappings
" ==================================================================================

let mapleader = ","


" Changes % to tab for matching brackets
nnoremap <tab> %
vnoremap <tab> %

" Map for NERDtree toggle
map <C-n> :NERDTreeToggle<CR>   

" Takes you to the next line. Similar to Command-Enter in Textmate. The
" Command-Shift-Enter is used while creating classes and functions.
imap <D-Enter> <Esc>o
imap <D-S-Enter> <Esc>A:<CR>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Map for command c for copying to clipboard, a terminal hack. For some reason
" the terminal command c just does crazy things. I need to figure out iTerm2.
map <leader>yy "*y

" Apple scripts for swipe. This doesn't work with Lion. Sigh!
nmap <SwipeLeft> gT
nmap <SwipeRight> gt
imap <SwipeUp> <Esc>:bN<CR>
imap <SwipeDown> <Esc>:bn<CR>
map <SwipeUp> :bN<CR>
map <SwipeDown> :bn<CR>

" Open file in Browser
" map <Leader>p :!open -a Safari %<CR><CR>
map <Leader>p :!open -a "Google Chrome" %<CR><CR>

" Open markdown with Mou
map <Leader>md :!open -a Mou %<CR><CR>

" Open current folder in terminal/iterm only for Mac.
map <D-i> :!open -a /Applications/iTerm.app '.' <CR><CR>
map <c-i> :!open -a /Applications/iTerm.app '.' <CR><CR>

" Maps for next/previous buffer
nmap <leader>nn <Esc>:bn<CR>
nmap <leader>nb <Esc>:bp<CR>

" Gundo plugin
nnoremap <leader>g :GundoToggle<CR>

" Showing Invisibles
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list<CR>

"Rope settings
" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>
map <C-g> <Esc>:RopeGotoDefinition<CR>

" Command-t
map <leader>t :CommandT<CR>

" Command-/
map <D-/> <Esc>gcc<CR>

" Disable search highlight
map <leader><space> :nohl<CR>

" Setting colorcolumn to 80
" map <D-8> :set colorcolumn=80<CR>
" map <D-0> :set colorcolumn=80<CR>

" Map tp regenerate tags on the fly. Python specific
nnoremap <F8> :!/opt/local/bin/ctags -R --python-kinds=-i *.py<CR>
" Toggle Tlist
nnoremap <F4> :TlistToggle<CR>

nnoremap <D-w> <Esc>:bd<CR>

" Map right command key to Esc
imap ;; <Esc>

" Clear end spaces
map <leader>c <Esc>:%s/\s\+$//g<CR>

" Map to close window
map <leader>x <Esc>:clos<CR>

" Just to avoid the shift in the :
" nore ; :

" Map to insert python debugger
map <C-d> <Esc>o# DEBUGGER!<CR>import pdb; pdb.set_trace()<Esc>

" Map to close the python error screen
map <C-q> <Esc><C>wj:clos<CR>

" ==================================================================================
" Auto Commands
" ==================================================================================

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source ~/.vimrc


" Python mode settings
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0
" let g:pymode_lint_cwindow = 0
let g:pymode_lint_signs = 0
let g:pymode_lint_jump = 0
let g:pymode_syntax = 1
let g:pymode_syntax_space_errors = 0 
let g:pymode_breakpoint_key = 0

" Disabling the arrow keys.
nnoremap <up> <nop>                                                            
nnoremap <down> <nop>                                                          
nnoremap <left> <nop>                                                          
nnoremap <right> <nop>                                                         
