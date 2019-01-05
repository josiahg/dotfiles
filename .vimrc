" Use Vim settings rather than Vi
set nocompatible

" == General Configs ==
set number 			            " line numbers
set backspace=indent,eol,start 	" Allow backspace in insert mode
set history=1000		        " Lots of history for :cmds
set showcmd			            " Show incomplete cmds
set showmode			        " Display current mode at bottom
set gcr=a:blinkon0		        " Disable cursor blink
set visualbell			        " No sounds
set autoread			        " Reload files changed outside vim

" Turn on syntax highlighting
syntax on

" == Indentation ==
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
" set list listchars=tab:\ \ ,trail:·

set nowrap      " Don't wrap lines
set linebreak   " Wrap lines at convenient points

" == Folds ==

set foldmethod=indent   " fold based on indent
set foldnestmax=3       " deepest fold is 3 levels
set nofoldenable        " don't fold by default

" == Completion ==

set wildmode=list:longest
set wildmenu                " enable ctrl-n and ctrl-p to scroll through matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" == Scrolling ==

set scrolloff=8 " Start scrolling 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" == Search ==

set incsearch " Find the next match as we type the search
set hlsearch " highlight searches by default
set ignorecase " ignore case when searching
set smartcase " ... unless we type a capital

" == File browser ==
let g:netrw_banner = 0
