syntax on
set hlsearch			" Highlight search terms
set incsearch			" Incremental search
set showmatch			" Show matching brackets
set ignorecase			" Ignore case while searching
set scs				" Smart case in search – switch to case sensitive mode when uppercase is used
set history=100 		" History buffer size
set autoindent			" Auto indentation
set scrolloff=5			" Scroll offset from the cursor
set shell=bash\ --login		" source .bash_profile
set paste			" Preserve indentation when pasting from another app
set number			" Show line numbers

" apt-vim
execute pathogen#infect()
call pathogen#helptags()

" Package configuration
