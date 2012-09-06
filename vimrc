set nocompatible 		" Don't be compatible with vi

" ==================================================================================
" Load pathogen with docs with all plugins
" ==================================================================================
runtime bundle/vim-pathogen/autoload/pathogen.vim
filetype off
call pathogen#infect()
Helptags

" ==================================================================================
" Basic Settings
" ==================================================================================
syntax on
filetype on
filetype plugin indent on
set pastetoggle=<F3>			"turn off auto-indent when pasting text
colorscheme Tomorrow
set nolist  		" Disable list chars
set showcmd
set mouse=a    " Set use of mouse when using the terminal
set wrap    " Wrapping without line break and in words instead of letters
set formatoptions+=l
set lbr
set encoding=utf-8

" Setting global clipboard
set clipboard+=unnamed

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
    " set gfn=Espresso\ Mono\ Regular:h12
    " colo tutticolori
    "colo rdark
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
    set shell=bash
endif
colo Tomorrow-Night

" Status Line mode
set laststatus=2


" Setting the clipboard to the global clipboard
set clipboard+=unnamed

" Hide .pyc in File browser and NERDTree
let g:explHideFiles='^\.,.*.pyc$'
let NERDTreeIgnore=['\.pyc$', '\~$', 'PYSMELLTAG']

" Hiding hidden files in Ctrl-p plugin
let g:ctrlp_dotfiles = 1
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.pyc$\|\.so$\|\.dll$',
    \ }


"Setting for the File Browser
let g:netrw_liststyle         = 3
let g:netrw_list_hide         = '.*\.pyc,.DS_Store,.git,.ropeproject'
"
" MiniBuf Explorer settings
"let g:miniBufExplSortBy = "name"
"let g:miniBufExplVSplit = 40
"let g:miniBufExplUseSingleClick = 1

" Pep 8 styling
let g:pep8_map='<leader>8'

" ==================================================================================
" Mappings
" ==================================================================================

let mapleader = ","

" MiniBuf map
"noremap <leader>e :TMiniBufExplorer<cr>
"
" Map for opening the vimrc file
noremap <leader>v <Esc>:e $MYVIMRC<CR>

" Adding === to line below
nnoremap <leader>1 yypVr=

" Changes % to tab for matching brackets
nnoremap <tab> %
vnoremap <tab> %

" Map for NERDtree toggle
noremap <leader>n :NERDTreeToggle<CR>   

" Takes you to the next line. Similar to Command-Enter in Textmate. The
" Ctrl-Shift-Enter is used while creating classes and functions.
inoremap <C-Enter> <Esc>o
inoremap <C-S-Enter> <Esc>A:<CR>

" Show syntax highlighting groups for word under cursor
nnoremap <C-S-l> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Map for command c for copying to clipboard, a terminal hack. For some reason
" the terminal command c just does crazy things. I need to figure out iTerm2.
noremap <leader>yy "*y

" Apple scripts for swipe. This doesn't work with Lion. Sigh!
nnoremap <SwipeLeft> gT
nnoremap <SwipeRight> gt
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
"map <c-i> :!open -a /Applications/iTerm.app '.' <CR><CR>

" Maps for next/previous buffer
nnoremap <leader>nn <Esc>:bn<CR>
nnoremap <leader>nb <Esc>:bp<CR>

" Gundo plugin
nnoremap <leader>g :GundoToggle<CR>

" Showing Invisibles
" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list<CR>

"Rope settings
" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>
map <C-g> <Esc>:RopeGotoDefinition<CR>

" Command-t
map <leader>t :CtrlP<CR>

" Command-b
map <leader>b :CtrlPBuffer<CR>

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
inoremap ;; <Esc>
"inoremap <Esc> <nop>
"
" Moving forward in insert mode like Emacs
inoremap <C-f> <Esc>la

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

" Syntastic
map <leader>ee <Esc>:SyntasticToggleMode<CR>
map <leader>ec <Esc>:SyntasticCheck<CR>

" Map for grep under word
map <leader>* "zyw:exec "grep -r ".@z." *"<CR>

" Map for ColorToggle
map <F2> <Esc>:ColorToggle<CR>

" Map to set columns to 90
map <leader>9 <Esc>:set columns=100<CR>

" Disabling the arrow keys.
nnoremap <up> <nop>                                                            
nnoremap <down> <nop>                                                          
nnoremap <left> <nop>                                                          
nnoremap <right> <nop>   

" Making titles for markdown
nnoremap <leader>= <Esc>^yyp^vg_r=<CR>
nnoremap <leader>- <Esc>^yyp^vg_r-<CR>

" ==================================================================================
" Auto Commands
" ==================================================================================

" Source the vimrc file after saving it
augroup vimrc
    autocmd!
    autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" ==================================================================================
" Abbreviations Commands
" ==================================================================================

iabbrev @@ satyajit.ranjeev@gmail.com
iabbrev ccopy Copyright 2012 Satyajit Ranjeev, all rights reserved.
iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
