syntax on

set noerrorbells
set novisualbell
set t_vb=
set tm=500
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set ai
set cursorline
set wildmenu
set showmatch
set showcmd
set ignorecase
set foldcolumn=1
set termguicolors

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'danro/rename.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py'  }
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'

Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

let laststatus=2

colorscheme gruvbox
set background=dark

set encoding=utf8

let mapleader = " "

" NERDTree
let NERDTreeShowHidden = 1
let g:NERDSpaceDelims = 1
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=35

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contain a modifiable
" file, and we're not in vimdiff
function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction

" Hightlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

nmap <leader>n :NERDTreeToggle<CR>

" Emmet shortchuts
map ,, <C-y>,

let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_use_cache=0

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Fast saving
nmap <leader>w :w!<CR>

" Fast quit
nmap <leader>q :q<CR>

" Disable highlight when <leader><CR> is pressed
map <silent> <leader><CR> :noh<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>30 :vertical resize 30<CR>
nnoremap <leader>40 :vertical resize 40<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

cnoremap kj <ESC>
inoremap kj <ESC>

" YCM
" The best part
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

" Split window
nmap ms :split<Return><C-w>w
nmap mv :vsplit<Return><C-w>w

" Move window
map mh <C-w>h
map mk <C-w>k
map mj <C-w>j
map ml <C-w>l

" Open current directory
nmap ts :tab split<CR>
nmap te :tabedit

" List tabs
nmap tl :Unite tab

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
