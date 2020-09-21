set nocompatible
set t_Co=256
set background=dark
set nu
syntax on
set title

set hlsearch
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set encoding=utf8
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'rickhowe/diffchar.vim'
Plugin 'dbeniamine/cheat.sh-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Don't force me to save when switching buffers
set hidden

" sudo write this
cmap W! silent w !sudo tee % >/dev/null

" for pure hard tabs
" set tabstop=4
" set shiftwidth=4
" set noexpandtab
"
" for black and white print outputs
set printoptions+=syntax:n

" for linux kernel development
" set tabstop=8
" set softtabstop=8
" set shiftwidth=8
" set noexpandtab
" set colorcolumn=80

" for normal development
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set colorcolumn=80

" for pure spaces
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4
" set expandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ruler		" show the cursor position all the time
set incsearch		" do incremental searching

set nowrap
set nobackup
set nowritebackup
set swapfile
set dir=/tmp

"vim airline
let g:airline#extensions#tabline#enabled = 1

nnoremap gb :bp<CR>
nnoremap gn :bn<CR>
nnoremap gl :ls<CR>

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0
let g:ycm_enable_diagnostic_highlighting = 0
nnoremap <leader>ja :YcmCompleter GoTo<CR>
nnoremap <leader>jh :YcmCompleter GoToInclude<CR>
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jr :YcmCompleter GoToReferences<CR>

vnoremap L >gv
vnoremap H <gv

let g:livepreview_previewer = 'zathura'

inoremap ,s Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>

let g:DiffColors=100
set spelllang=en_us

"when pasting turn of indendation by pressing F3
set pastetoggle=<F3>
