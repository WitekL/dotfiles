set clipboard=unnamed

set number
set showmatch
set visualbell
set hlsearch
set smartcase

set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/gem-ctags'
Plug 'tpope/vim-flagship'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tsaleh/vim-align'
Plug 'tsaleh/vim-tmux'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'chrisbra/Colorizer'
Plug 'flazz/vim-colorschemes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kchmck/vim-coffee-script'
Plug 'posva/vim-vue'
Plug 'tpope/vim-dispatch'
Plug 'scrooloose/syntastic'
Plug 'isRuslan/vim-es6'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rizzatti/dash.vim'
call plug#end()

" let g:indent_guides_auto_colors=0
" au VimEnter,Colorscheme * hi! IndentGuidesOdd  ctermfg=7 ctermbg=0
" au VimEnter,Colorscheme * hi! IndentGuidesEven ctermfg=8 ctermbg=4

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :CtrlP<CR>

set textwidth=120
set colorcolumn=+1

autocmd BufEnter * :syntax sync fromstart

let mapleader = "\<space>"

nnoremap <leader><leader> <c-^>

set undofile
set undodir=~/.vim/undodir

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

set wildignore+=*/.git/*,*/tmp/*,*.swp
