set nocompatible 		" Don't be compatible with vi
let mapleader=","
" Put all mappings here


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
:set pastetoggle=<F3>			"turn off auto-indent when pasting text

" Set color for Vim, GUI has a seperate option
colo cloudsxterm
" Disable list chars
:set nolist  				
set showcmd
" Turn off auto-indent when pasting text
:set pastetoggle=<F3>
" Set use of mouse when using the terminal
:set mouse=a
" Wrapping without line break and in words instead of letters
set wrap
set nolist
set formatoptions+=l
set lbr

" Folding using indents
"set foldenable	
"set foldmethod=indent
"set foldcolumn=2

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
set backspace=indent,eol,start " more backspace settings
set t_Co=256
" no swap and backup files
set nobackup
set nowritebackup
set noswapfile

" set textwidth=79    " Ofourse setting the textwidth

" Cool Stuffs I picked up from http://amix.dk/vim/vimrc.html
set wildmenu "Turn on WiLd menu
set ruler "Always show current position
set ignorecase "Ignore case when searching
set smartcase
set hlsearch "Highlight search things
set incsearch


" ==================================================================================
" GUI Settings
" ==================================================================================
if has("gui_running")
    set guioptions-=T
    set guioptions-=r 
    set guioptions-=L 
    set guioptions+=a
    set gfn=Meslo\ LG\ M:h12
    colo tutticolori
    set listchars=tab:▸\ ,eol:¬
endif



" ==================================================================================
" Mappings
" ==================================================================================


let mapleader = ","

" Hide .pyc in File browser and NERDTree
let g:explHideFiles='^\.,.*.pyc$'
let NERDTreeIgnore=['\.pyc$', '\~$', 'PYSMELLTAG']

"Setting for the Browser
let g:netrw_liststyle         = 3
let g:netrw_list_hide         = '.*\.pyc,.DS_Store'

" Changes % to tab for matching brackets
nnoremap <tab> %
vnoremap <tab> %

" map for NERDtree
map <C-s> :NERDTreeToggle<cr>

"mapping for command+enter - made it to ctrl enter for cmd enter type in <D-Enter>
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

" Map for command c for copying to clipboard, a terminal hack
map <leader>yy "*y

" Apple scripts for swipe
nmap <SwipeLeft> gT
nmap <SwipeRight> gt
imap <SwipeUp> <Esc>:bN<CR>
imap <SwipeDown> <Esc>:bn<CR>
map <SwipeUp> :bN<CR>
map <SwipeDown> :bn<CR>

" Open file in Browser
" map <Leader>p :!open -a Safari %<CR><CR>
map <Leader>p :!open -a "Google Chrome" %<CR><CR>

" Open current folder in terminal/iterm
map <Leader><F10> :!open -a /Applications/iTerm.app '.' <CR><CR>

" Maps for next/previous buffer/tab
nmap <leader>nn <Esc>:tabn<CR>
nmap <leader>pp <Esc>:tabp<CR>
nmap <leader>bn <Esc>:bn<CR>
nmap <leader>bp <Esc>:bp<CR>

" Gundo plugin
nnoremap <leader>g :GundoToggle<CR>

" Showing Invisibles
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Command-t 
map <leader>t :CommandT<CR>

" Pep 8 styling
let g:pep8_map='<leader>8'

" Disable search highlight<CR>
map <leader><space> :nohl<CR>

" Setting colorcolumn to 80
" map <D-8> :set colorcolumn=80<CR>
" map <D-0> :set colorcolumn=80<CR>

" Just to avoid the shift in the :
nore ; :

" ==================================================================================
" Auto Commands
" ==================================================================================

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source ~/.vimrc


