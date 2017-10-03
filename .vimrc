call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

inoremap jj <Esc>
inoremap <Esc> <Nop>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>p :setf php<cr>
map <leader>t :FZF<cr>
nnoremap ; :


let g:fzf_launcher = "~/.vim/iterm %s"

colorscheme anotherdark 
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 
