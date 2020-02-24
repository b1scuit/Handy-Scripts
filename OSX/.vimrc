" #################### Plug Settings ###########################################

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Better intergration with GIT
Plug 'tpope/vim-fugitive'
" FZF Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Airline status bar
Plug 'vim-airline/vim-airline'
" Vim theme
Plug 'dracula/vim', { 'as': 'dracula' }
" Better scrolling
Plug 'yuttie/comfortable-motion.vim'
" Better syntax hilighting
Plug 'sheerun/vim-polyglot'
" Tab / spaces visual
Plug 'Yggdroot/indentLine'

Plug 'gabrielelana/vim-markdown'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'sebdah/vim-delve'

Plug 'SirVer/ultisnips'

Plug 'scrooloose/nerdtree'

Plug 'ycm-core/YouCompleteMe'

call plug#end()

" #################### VIM settings ############################################

inoremap jj <Esc>
nnoremap ; :

set noswapfile
set backspace=indent,eol,start
set number
set nowrap
set mouse =a
set hlsearch
set showmatch
set incsearch
set ignorecase
set smartcase
set splitright
set splitbelow
set clipboard^=unnamed
set noshowmode
set mouse=n
set foldmethod=indent
set foldlevelstart=99

let &t_SI = "\<Esc>]50;CursorShape=0\x7"
let &t_SR = "\<Esc>]50;CursorShape=0\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" #################### Extra commands ##########################################

nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>G :!git add %

command Gitgui execute "!git gui"

" #################### Basic Code editor settings ##############################

set tabstop =8
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set ts=4

" Automatically apply PHP highlighting to HTML files (inline PHP)
augroup CodeSyntax

    autocmd!
    autocmd BufNewFile,BufRead *.html set syntax=php
    autocmd BufEnter * syntax sync fromstart
    
    autocmd Filetype typescript set softtabstop=2
    autocmd Filetype typescript set shiftwidth=2
    autocmd Filetype typescript set tabstop=2

augroup END

" #################### Theme settings ##########################################

set guifont=Hack\ Regular:h8
set colorcolumn=80,120

augroup Colours

    autocmd!
    autocmd ColorScheme *  highlight ColorColumn ctermbg=DarkGrey

augroup END

try
    colorscheme dracula
catch
endtry

" #################### Wild Menu ###############################################

set wildmode=longest:full,list
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set omnifunc=syntaxcomplete#Complete

" #################### Status Bar ##############################################

let g:TerminusFocusReporting=0

try
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:airline_theme='dracula'

catch
endtry

" #################### FZF Settings ############################################

let g:fzf_launcher = "~/.vim/iterm %s"

" #################### Netrw Settings ##########################################

let g:netrw_banner = 0
let g:netrw_liststyle = 4
let g:netrw_winsize = 20

" #################### NERDTree Settings #######################################

map <C-n> :NERDTreeToggle<CR>
let g:indentLine_setColors = 0

" #################### VIM-GOSettings ##########################################
augroup vimGo

 autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

augroup END
" #################### Importing extra files ###################################






try
    source $HOME/.vimrcExtra
catch
endtry
