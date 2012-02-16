git submodule add https://github.com/tpope/vim-pathogen.git bundle/vim-pathogen
git submodule add https://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
git submodule add https://github.com/tpope/vim-git.git bundle/vim-git
git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate.vim
git submodule add https://github.com/tpope/vim-surround.git bundle/vim-surround
git submodule add https://github.com/wincent/Command-T.git bundle/Command-T
git submodule add https://github.com/sjl/gundo.vim.git bundle/gundo.vim
git submodule add https://github.com/fs111/pydoc.vim.git bundle/pydoc.vim
git submodule add https://github.com/vim-scripts/pep8.git bundle/pep8
git submodule add https://github.com/scrooloose/nerdtree.git bundle/nerdtree
git submodule add https://github.com/vim-scripts/simple-pairs.git bundle/simple-pairs
git submodule add https://github.com/tomtom/tcomment_vim.git bundle/tcomment_vim
git submodule add https://github.com/fholgado/minibufexpl.vim.git bundle/minibufexpl.vim
git submodule add https://github.com/Lokaltog/vim-powerline.git bundle/vim-powerline
git submodule add https://github.com/plasticboy/vim-markdown.git bundle/vim-markdown
git submodule add https://github.com/klen/rope-vim.git bundle/rope-vim
git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update
