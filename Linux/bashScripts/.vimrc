call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'

call plug#end()

set noswapfile
set backspace=indent,eol,start
set buftype: " "
set guifont=Menlo\ Regular:h10
set number
set wrap!
set tabstop =4
set softtabstop=0
set expandtab
set shiftwidth=4 
set smarttab
set mouse =a
set hlsearch
set showmatch
set incsearch
set ignorecase
set smartcase
set splitright
set splitbelow
set wildmode=longest:full,list
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
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
set clipboard=unnamed
set nocompatible
set noshowmode

:if has('gui_running')
    set transparency=10
:endif

inoremap jj <Esc>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>p :setf php<cr>
map <leader>t :FZF<cr>
map <leader>f :Files<cr>
map <leader>g :GFiles?<cr>
nnoremap ; :
vnoremap // y/<C-R>"<CR>


let g:fzf_launcher = "~/.vim/iterm %s"
let g:TerminusFocusReporting=0

colorscheme lucid
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 
