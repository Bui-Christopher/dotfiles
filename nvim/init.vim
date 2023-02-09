set nocompatible

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


set showmatch
set ignorecase
set hlsearch
set incsearch

set number

set autoindent
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set expandtab


set wildmenu
set wildmode=list:longest,list:full

filetype indent on
filetype plugin on

set nobackup
set nowb
set noswapfile

set clipboard=unnamedplus
set laststatus=2

" Set :W to sudo save the file
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set foldcolumn=0
set nowrap

syntax enable

" Normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

" Insert mode
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
