syntax on
filetype on
filetype indent on
filetype plugin on

set number
set cursorline
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set noswapfile
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=200
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"Plugins

call plug#begin()

Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'kyoz/purify'

call plug#end()

set background=dark
colorscheme purify
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white

" Mappings

inoremap jj <Esc>:w<CR>
nnoremap jj <Esc>:w<CR>
nnoremap nn <Esc>:NERDTreeToggle<CR>
nnoremap ff <Esc>:FZF<CR>
inoremap <C-BS> <C-w>

" Some other settings 
let g:NERDTreeWinPos = "right"
let g:NERDTreeShowHidden = 1

