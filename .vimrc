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
set rnu                         " Relative numbers
set nu                          " Show numbers
set noshowmatch
set autowrite
"
" change <leader> from \ to ,
let mapleader=","

" Turn on syntax highlighting
syntax on

" Faster UI refresh
set updatetime=50

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

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
set nohlsearch " highlight searches by default
set ignorecase " ignore case when searching
set smartcase " ... unless we type a capital

" == File browser ==
let g:netrw_banner = 0

" Plugins

" Auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

set runtimepath^=~/.vim/plugged/ctrlp.vim

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

let g:airline_theme='minimalist'

autocmd vimenter * colorscheme molokai

" golang stuff
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <leader>a :cclose<CR>

autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
let g:go_fmt_command = "goimports"

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

"let g:go_highlight_types = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1

set omnifunc=syntaxcomplete#Complete
