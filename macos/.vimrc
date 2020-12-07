set clipboard=unnamed

set nospell
set wildmenu
set number
set showmatch
set visualbell
set hlsearch
set ignorecase
set smartcase
set laststatus=2

set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yssl/QFEnter'
Plug 'kamykn/spelunker.vim'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/gem-ctags'
Plug 'szw/vim-tags'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tsaleh/vim-align'
Plug 'tsaleh/vim-tmux'
Plug 'bronson/vim-trailing-whitespace'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'ervandew/supertab'
" Colorscheme settings
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme', { 'as': 'papercolor-theme' }
Plug 'rakr/vim-one', { 'as': 'one' }
"
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-dispatch'
Plug 'w0rp/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rizzatti/dash.vim'
Plug 'itchyny/lightline.vim'
" Rails plugins
Plug 'tpope/vim-rails'
" JS plugins
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'posva/vim-vue'
" Golang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Colorscheme settings
let g:dracula_italic = 0
colorscheme dracula
" colorscheme papercolor
" colorscheme one



" let g:indent_guides_auto_colors=0
" au VimEnter,Colorscheme * hi! IndentGuidesOdd  ctermfg=7 ctermbg=0
" au VimEnter,Colorscheme * hi! IndentGuidesEven ctermfg=8 ctermbg=4

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :CtrlP<CR>

set textwidth=120
set colorcolumn=+1
let g:NERDTreeWinSize=40

autocmd BufEnter * :syntax sync fromstart

let mapleader = "\<space>"

nnoremap <leader><leader> <c-^>

nnoremap <leader>gt :tabnew<CR>
nnoremap <leader>dt :windo bd<CR>
" nnoremap <leader>dt :tabclose<CR>
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

set undofile
set undodir=~/.vim/undodir


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Auto-expanding
inoremap (; (<CR>)<C-c>O
inoremap (, (<CR>)<C-c>O
inoremap {; {<CR>}<C-c>O
inoremap {, {<CR>}<C-c>O
inoremap [; [<CR>]<C-c>O
inoremap [, [<CR>]<C-c>O

" Use ripgrep for search
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_lazy_update = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_custom_ignore = 'tags\|node_modules\|DS_Store\|git'

set wildignore+=*/.git/*,*/tmp/*,*.swp

" ALE setup for JS
" let b:ale_fixers_aliases = ['vue', 'javascript']
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\}

let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_global_extensions = ['coc-solargraph']
