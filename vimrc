""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""

" Not compatible with vi
set nocompatible

" Enable filetype plugins and pathogen
execute pathogen#infect()
call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

" Set the map leader
let mapleader = "\\"

" Sane tab defaults
set expandtab
set shiftwidth=2
set softtabstop=2

" Sane search defaults
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap <leader>q :nohlsearch<CR>


" Use the persistent undo feature
" See :h persistent-undo
" NOTE: the directory listed in undodir must exist; Vim will not create this
" directory itself!
set undodir=$HOME/.vim/vimundos
set undofile
" Maximum number of changes that can be undone
set undolevels=1000
" Maximum number lines to save for undo on a buffer reload
set undoreload=10000

""""""""""""""""""""""""""""""""""""""""""""""""
" => Look and Feel
""""""""""""""""""""""""""""""""""""""""""""""""

" Use 256 color
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
  colorscheme jellybeans
endif

" File Orientation
set number
set relativenumber
set cursorline

" Status Line
set laststatus=2
set statusline=%.50F
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc},%{&fileformat}]
set statusline+=\ %m%w%h%q
set statusline+=%=
set statusline+=%l,%c\ %3.3p%%

""""""""""""""""""""""""""""""""""""""""""""""""
" => Movement
""""""""""""""""""""""""""""""""""""""""""""""""
" Don't move around wrapped lines
nmap j gj
nmap k gk

" Move by virual line when used without a count, and physical line when used
" with a count.
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Allow backspacing over anything in insert mode
set backspace=indent,eol,start

" Use terminal like movements around vim cmd line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" Quickly switch buffers and don't bother me
" with complaints of unsaved changes.
nnoremap <unique> <silent> <leader>nn :bn<CR>
nnoremap <unique> <silent> <leader>pp :bp<CR>
" Switch to the new buffer first before closing the old one.
" Prevents buffers in the same window from expanding, and
" instead gives me a new buffer like I expect.
nnoremap <unique> <silent> <leader>bd :bp\|bd #<CR>
set hidden

""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
""""""""""""""""""""""""""""""""""""""""""""""""

" Better-White-Space
autocmd BufWritePre * StripWhitespace

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_flake8_args = '--max-line-length=100'

" NerdTree
map <C-n> :execute 'NERDTreeToggle ' . getcwd()<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeIgnore=['\.pyc$', '\~$']

" ctrlp :: for better buffer switching
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*.so,*.swp,*.zip,*.pyc

hi CtrlPLinePre ctermfg=bg ctermbg=fg
nmap ; :CtrlPBuffer<CR>
