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
set relativenumber

set expandtab
set tabstop=2
set shiftwidth=2
set shiftround

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yssl/QFEnter'
Plug 'kamykn/spelunker.vim'
Plug 'godlygeek/tabular'
"
" Ruby block textobjects
Plug 'kana/vim-textobj-user'
Plug 'rhysd/vim-textobj-ruby'
"
" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
"
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
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Plug 'ervandew/supertab'
"
" Colorscheme settings
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'NLKNguyen/papercolor-theme', { 'as': 'papercolor-theme' }
" Plug 'rakr/vim-one', { 'as': 'one' }
Plug 'sainnhe/everforest'
"
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-dispatch'
Plug 'w0rp/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'rizzatti/dash.vim'
Plug 'itchyny/lightline.vim'
"
" Rails plugins
Plug 'tpope/vim-rails'
"
" JS plugins
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'posva/vim-vue'
"
" Golang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

syntax on
" Important!!
if has('termguicolors')
  set termguicolors
endif
" For dark version.
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'soft'
" For better performance
let g:everforest_better_performance = 1
colorscheme everforest


" :command Note :tabnew :e ~/Notes/newnote :lcd %:p:h
" :command -bar Note :! touch ~/Notes/newnote | :tabnew | :e ~/Notes/newnote | :! rm ~/Notes/newnote
:command -bar NoteBrowse :tabnew | :NERDTree ~/Notes
:command Notes NoteBrowse
" :command NoteP
" :command NotesSave

" let g:indent_guides_auto_colors=0
" au VimEnter,Colorscheme * hi! IndentGuidesOdd  ctermfg=7 ctermbg=0
" au VimEnter,Colorscheme * hi! IndentGuidesEven ctermfg=8 ctermbg=4


set textwidth=120
set colorcolumn=+1
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1

autocmd BufEnter * :syntax sync fromstart

let mapleader = "\<space>"

nnoremap <leader><leader> <c-^>

nnoremap <C-n> :NERDTreeToggle<CR>
nmap <leader><C-n> :NERDTreeFind<CR>
nnoremap <C-p> :<C-u>FZF<CR>

nnoremap <leader>gt :tabnew<CR>
nnoremap <leader>dt :windo bd<CR>
" nnoremap <leader>dt :tabclose<CR>
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
nnoremap <leader><C-g> :let @+=expand('%')<CR>

set undofile
set undodir=~/.vim/undodir


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
  " let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  " let g:ctrlp_use_caching = 0
endif

" let g:ctrlp_lazy_update = 1
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" let g:ctrlp_custom_ignore = 'tags\|node_modules\|DS_Store\|git'

set wildignore+=*/.git/*,*/tmp/*,*.swp

" ALE setup for JS
" let b:ale_fixers_aliases = ['vue', 'javascript']
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\}

let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
let g:ale_virtualtext_cursor = 'current'

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

" COC config
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Toggle relative line number
nmap <leader>l :set invrelativenumber<CR>

" Ruby blocks text object nav
" nnoremap <silent> <buffer> [r :<C-U>call <SID>searchsyn('\<do\>','rubyControl','r','n')<CR>
" nnoremap <silent> <buffer> ]r :<C-U>call <SID>searchsyn('\<do\>','rubyControl','','n')<CR>
" nnoremap <silent> <buffer> [R :<C-U>call <SID>searchsyn('\<end\>','rubyControl','r','n')<CR>
" nnoremap <silent> <buffer> ]R :<C-U>call <SID>searchsyn('\<end\>','rubyControl','','n')<CR>
" xnoremap <silent> <buffer> [r :<C-U>call <SID>searchsyn('\<do\>','rubyControl','r','v')<CR>
" xnoremap <silent> <buffer> ]r :<C-U>call <SID>searchsyn('\<do\>','rubyControl','','v')<CR>
" xnoremap <silent> <buffer> [R :<C-U>call <SID>searchsyn('\<end\>','rubyControl','r','v')<CR>
" xnoremap <silent> <buffer> ]R :<C-U>call <SID>searchsyn('\<end\>','rubyControl','','v')<CR>

" onoremap <silent> <buffer> ir :<C-U>call <SID>wrap_i('[r',']R')<CR>
" onoremap <silent> <buffer> ar :<C-U>call <SID>wrap_a('[r',']R')<CR>
" xnoremap <silent> <buffer> ir :<C-U>call <SID>wrap_i('[r',']R')<CR>
" xnoremap <silent> <buffer> ar :<C-U>call <SID>wrap_a('[r',']R')<CR>
