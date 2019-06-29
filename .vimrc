set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

set nocompatible
filetype plugin indent on

""""""""""""""""""""""""""
"""""" Plugin Config
""""""""""""""""""""""""""

" Git Gutter
""""""""""""

set updatetime=100

" setting timeout to switch in between modes
set ttimeoutlen=10

" Nerd Commenter
"""""""""""""""
" adds spaces after comments
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Nerd Tree
"""""""""""

" opening nerd tree when no files were specified
autocmd Stdinreadpre * let s:std_in=1
autocmd vimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

" close vim if nerdtree is the last window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Ctrlp
"""""""

" to allow ctrlp to only search in working directory
let g:ctrlp_working_path_mode = 0

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.git|\.svn|node_modules|vendor|venv)',
    \ 'files': '\v\.(o|so|test|swp|tmp)$'
    \ }

" Vim Airline
"""""""""""""

" theme
let g:airline_theme='minimalist'

" enabling powerline symbols
let g:airline_powerline_fonts = 1

" enablining the tab line
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""
"""""" Genral Config 
""""""""""""""""""""""""""

" setting the leader key
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" to delete the buffers
nmap <leader>d :Wipeout<cr>

" Fast save and quit
nmap <leader>wq :wq<cr>

" Fast quit without saving
nmap <leader>q :q!<cr>

" saving with escalated priveleges
"command W w !sudo tee % > /dev/null

map <leader>r :source ~/.vimrc<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" turning on syntax
syntax on
syntax enable

" setting color scheme to 256 color pallete
set t_Co=256

" Change gutter column width of number column 
set nuw=4

" This option determines the number of context lines you would like to see
" above and below the cursor
set scrolloff=10

" to enable mouse scroll
set mouse=a

set autoindent
set smartindent
set cindent
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces

set number              " show line numbers
set ruler
set laststatus=2

set showcmd             " show command in bottom bar
set cursorline          " highlight current line

set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

"searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" to turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Set to autoread when a file is changed from outside
set autoread

" Buffer and window related key binding

" for cycling through tabs and creating a new one
nnoremap gn :tabn<CR>
nnoremap gp :tabp<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap tt :tab split<CR>

" moving in between splits, open buffers in splits don't cycle buffers
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
