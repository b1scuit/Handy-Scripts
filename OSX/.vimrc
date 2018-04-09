if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif 

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

set noswapfile
set backspace=indent,eol,start
set buftype: " "
set guifont=Hack\ Regular:h8
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
set colorcolumn=80,120

command Gitgui execute "!git gui"

if has("mac") || has("macunix")
    function! Stoker(...)
        echom a:1
        execute '!ssh -F /users/peterholt/Documents/d3r/vagrant-ssh default -t "echo ' + $params + '"'
    endfunction

    command Vagrant execute '!ssh -F /Users/peterholt/Documents/d3r/vagrant-ssh default -t "cd ' . getcwd() '; /bin/bash; exit"'
    command ClearCache execute '!ssh -F /Users/peterholt/Documents/d3r/vagrant-ssh default -t "cd ' . getcwd() '; php ./vendor/d3r/core/tools/clear_cache.php local; exit"'
    command Dbupdate execute '!ssh -F /Users/peterholt/Documents/d3r/vagrant-ssh default -t "cd ' . getcwd() '; php ./vendor/d3r/core/tools/update_db.php local; exit"'
    command Stoker call Stoker()
endif 

highlight ColorColumn ctermbg=3

:if has('gui_running')
    set transparency=10
:endif

inoremap jj <Esc>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>p :setf php<cr>
nnoremap <leader>G :!git add %
map <leader>t :FZF<cr>
map <leader>f :Files<cr>
nnoremap ; :
vnoremap // y/<C-R>"<CR>

nnoremap <leader>k :res +10<cr>
nnoremap <leader>j :res -10<cr>
nnoremap <leader>l :vertical resize +5<cr>
nnoremap <leader>h :vertical resize -5<cr>

let g:fzf_launcher = "~/.vim/iterm %s"
let g:TerminusFocusReporting=0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

try
    colorscheme lucid
catch
endtry

syntax on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
