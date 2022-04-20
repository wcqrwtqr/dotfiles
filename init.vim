set nocompatible
filetype plugin on
syntax on
set number
set relativenumber
set timeoutlen=250
set mouse=a
set smarttab
set autoindent

" set noshowmatch
" set nohlsearch
" set hidden
" set noerrorbells
" set relativenumber
" set tabstop=4 softtabstop=4
" set shiftwidth=4
" set smartindent
" set nu
" set spell
" set nowrap
" set smartcase
" set noswapfile
" set nobackup
" set undodir=~/.vim/undodir
" set undofile
" set incsearch
" set termguicolors
" set scrolloff=8
" set noshowmode
" set showcmd
" set encoding=utf-8
" set timeoutlen=250

call plug#begin('~/.vim/plugged')
Plug 'tweekmonster/gofmt.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-dispatch'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax'
" Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'frazrepo/vim-rainbow'
Plug 'skammer/vim-css-color'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'dense-analysis/ale'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'reedes/vim-pencil'
Plug 'preservim/tagbar'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'
Plug 'rhysd/vim-grammarous'
Plug 'junegunn/vim-peekaboo'
Plug 'ryanoasis/vim-devicons'
Plug 'ray-x/lsp_signature.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tc50cal/vim-terminal'
call plug#end()


let mapleader = " "

" Moving lines up and down during visual
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" nnoremap <leader>y "+y // conflict with my next tab keybinding
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" New rempaing from the primeagen 
" Copy from the courser until the end of the line
nnoremap Y y$
" Keep them center
nnoremap J mzJ`z
" While searching this will keep the courser in the center at all time
nnoremap n nzzzv
nnoremap N Nzzzv


" Undo break point so I do not need to delete the whole work and the undo can
" be stopped at certain point
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap " "<c-g>u
inoremap ' '<c-g>u
inoremap [ [<c-g>u





let maplocalleader="j"
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>g gg=G ``<CR>
inoremap <localleader>o <esc>o
inoremap <localleader>p <esc>pa
inoremap <localleader>b <esc>bi
inoremap <localleader>w <esc>ea
inoremap <localleader>l <esc>O
inoremap <localleader>k <esc>
inoremap <localleader>a <esc>A
inoremap <localleader>i <esc>I
inoremap <localleader>d <esc>ddi

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Save the file
nnoremap <leader>fs :w<CR>
" nnoremap <C-s> :w<CR>


" Explore other files from within vim and open it in a split window instead of
" the same window
nmap <leader>f :Explore<CR>
let g:netrw_altv= 1
let g:netrw_dihistmax = 0


" Moving lines up and down during visual
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" Make the d for delete not yanking to register
vnoremap <leader>d "_d
nnoremap <leader>d "_d

xnoremap <leader>p "_dP  

" ===================== NERDTree =========================
" Below are the maps for the NERDTree quick open using ctl+o
map <C-o> :NERDTreeToggle<CR>
" Below is the fzf to search for files inside the vim
" map ; :Files<CR>
" map <Leader>ff :Files<CR>
" map <Leader>sf :Ag<CR> 
" map <Leader>ss :BLines<CR>
" map <Leader>bb :Buffers<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>ss <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" easy motion bindings
"===================
" map  <Leader>w <Plug>(easymotion-bd-w)
map <Leader><Leader>w <Plug>(easymotion-overwin-w)
map gss <Plug>(easymotion-s2)
" map gsj <Plug>(easymotion-bd-jk)
map gsj <Plug>(easymotion-j)
map gsk <Plug>(easymotion-k)


nnoremap <silent> <Leader>wv <C-w>v
" ss to generate new horizontal split
nnoremap <silent> <Leader>ws <C-w>s
nnoremap <silent> <Leader>wc <C-w>c
nnoremap <silent> <Leader>ww <C-w>w
nnoremap <silent> <Leader>wj <C-w>j
nnoremap <silent> <Leader>wk <C-w>k
nnoremap <silent> <Leader>wl <C-w>l
nnoremap <silent> <Leader>wh <C-w>h

nmap <F8> :TagbarToggle<CR>
nnoremap <Leader>r :source ~/.config/nvim/init.vim<bar>:echo "sourced nvim 🌹"<CR>

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
