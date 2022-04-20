set nocompatible
filetype plugin on
syntax on
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set spell
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set showcmd
set encoding=utf-8
set timeoutlen=250

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
call plug#end()

" Below is for the vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" colorscheme purify
" k colorscheme purify
"klet g:airline_theme='purify'

" Remove below code if you need to go back to the old colors
colorscheme gruvbox
highlight Normal ctermfg=grey ctermbg=darkblue
" highlight Normal 
" highlight Normal guibg=none

autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:user_emmet_leader_key=','

" ===================== Tmux  =========================
" Below is mapping the leader to space for Tmux then making the leader +
" arrows to easily navigate to windows
" Below I'm mapping the leader key in normal and edit mode to help me do more
" things instead of going out from edit to normal then edit again

let mapleader = " "
let maplocalleader="j"
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
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

nnoremap <leader>g gg=G ``<CR>
inoremap <localleader>o <esc>o
inoremap <localleader>p <esc>pa
inoremap <localleader>b <esc>bi
" inoremap <localleader>c <esc>lciw
inoremap <localleader>w <esc>ea
inoremap <localleader>l <esc>O
inoremap <localleader>k <esc>
inoremap <localleader>a <esc>A
inoremap <localleader>i <esc>I
inoremap <localleader>d <esc>bdwa

" inoremap <localleader>d <esc>ddi # old way
" For Javascript only
" inoremap <localleader>c console.log()<esc>ha
" inoremap <localleader>f function(){}<esc>i
" inoremap <localleader>[ ${}<esc>ha

" Moving lines up and down during visual
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" nnoremap <leader>y "+y // conflict with my next tab keybinding
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Make the d for delete not yanking to register
vnoremap <leader>d "_d
nnoremap <leader>d "_d

xnoremap <leader>p "_dP  
" Not sure how this will work isss goingggg to hireee
 
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

" Jump to defections using coc
nmap <leader>gd <Plug>(coc.definition)
nmap <leader>gr <Plug>(coc.references)

" This is for multicursor to activate the <A-n> 
if !has('gui_running')
    map "˜" <A-n>
endif

" =============== Tmux navigation mapping to use the <C-l> to move from vim to
" tmux pane
" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <C-l> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K>{Up-Mapping} :TmuxNavigateUp<cr>
" nnoremap <silent> <C-H>{Right-Mapping} :TmuxNavigateRight<cr>
" nnoremap <silent> <C-J> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" ===================== NERDTree =========================
" Below are the maps for the NERDTree quick open using ctl+o
map <C-o> :NERDTreeToggle<CR>
" Below is the fzf to search for files inside the vim
" map ; :Files<CR>
map <Leader>ff :Files<CR>
map <Leader>sf :Ag<CR> 
map <Leader>ss :BLines<CR>
map <Leader>bb :Buffers<CR>
" The above code is for the Silver search which can search the whole directory for any word, no need to use grep anymore

" Making preview the live editor for live latex preview 
" autocmd Filetype tex setl updatetime=1
" let g:livepreview_previewer = 'open -a Preview'
" let g:livepreview_previewer = 'evince'

" ===================== Floaterm  =========================
" Below are the maps for Floaterm so I can open python in a side terminal and
" make quick updates and review the data
" map <C-p> :FloatermNew --name=python --wintype=normal --height=0.4 python<CR>
" map <C-p> :FloatermNew --name=repl --wintype=vsplit --width=0.4 --position=right python<CR>
" map <C-s> :FloatermSend<CR>
" map <C-k> :FloatermKill<CR>

" Here is the key mapping for Floaterm
" let g:floaterm_keymap_new    = '<F7>'
" let g:floaterm_keymap_prev   = '<F8>'
" let g:floaterm_keymap_next   = '<F9>'
" let g:floaterm_keymap_toggle = '<F12>'

" Below are the key bindings for the tabs in vim (t for next, n for new, x for close
" let mapleader (don't forget that the leader key is mapped to space) 
nnoremap <leader>1 :tabprevious<CR>
nnoremap <leader>2 :tabnext<CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>x :tabclose<CR>

" Using leader e will put the vim to Goyo and SoftPencil
" nnoremap <leader>e :Goyo<bar>:SoftPencil<bar>:Limelight<CR> # Limelight does
" not owrk well with Tmux so I removed it
nnoremap <leader>e :Goyo<bar>:SoftPencil<CR>

" Below mapping to resize the windows in vim windows
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" The code below is for the css autocomplete 
" Below is to ensure the autocomplete us enables when inside css file
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" set omnifunc=csscomplete#CompleteCSS

" Changing the spell check box to underline and old instead of the red color
" hi clear SpellBad
" hi SpellBad cterm=underline
" hi Pmenu guibg=#333b4f

" Changing the color of the of the tab 
" hi TabLineSel guifg=LightGreen guibg=DarkGreen ctermfg=LightGreen ctermbg=DarkGreen

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" While in visual mode use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" This code below is for vim-highlightedold vim
if !exists('##TextYankPost')
    map y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 500

"Below code is to write the words and create the needed actions as in the
"execute command line
" command! Vimrc execute \":tabnew|:e ~/.vimrc"
" command! Reload execute \":source ~/.vimrc"

" In markdown and vimwiki the autocomplete is being done using <C-n>(select from top) & <C-y>(select) &
" <C-p>(select from bottom)
" The below mapping is a dirty way to let enter <CR> act like <C-y> and select
" the autocomplete suggestion #TODO if there is any conflict with other
" programs then remove it and use the old way 
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))

" Navigate the complete menu items like CTRL+n/ CTRL+p would.
inoremap ‹expr> ‹Down> pumvisible() ? "‹C-n>" :"‹Down>"
inoremap ‹expr> ‹Up> pumvisible() "‹C-p>" :"‹Up>"

" Select the complete menu item like CTRL+y would.
inoremap ‹expr> ‹Right> pumvisible() ? "‹C-y>" :"‹Right›"
" inoremap ‹expr> ‹CR> pumvisible() ? "‹C-y>" :"‹CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap ‹expr> ‹Left> pumvisible() ? "‹C-e>" :"‹Left>"

" easy motion bindings
"===================
" map  <Leader>w <Plug>(easymotion-bd-w)
map <Leader><Leader>w <Plug>(easymotion-overwin-w)
map gss <Plug>(easymotion-s2)
" map gsj <Plug>(easymotion-bd-jk)
map gsj <Plug>(easymotion-j)
map gsk <Plug>(easymotion-k)


" vv to generate new vertical split
nnoremap <silent> <Leader>wv <C-w>v
" ss to generate new horizontal split
nnoremap <silent> <Leader>ws <C-w>s
nnoremap <silent> <Leader>wc <C-w>c
nnoremap <silent> <Leader>ww <C-w>w
nnoremap <silent> <Leader>wj <C-w>j
nnoremap <silent> <Leader>wk <C-w>k
nnoremap <silent> <Leader>wl <C-w>l
nnoremap <silent> <Leader>wh <C-w>h


" Reload vimrc without leaving vim using leadder r
nnoremap <Leader>R :source $MYVIMRC<CR>
" nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <Leader>r :source ~/.vimrc<bar>:echo "sourced"<CR>
" nnoremap <silent> <Leader>co :silent !(pwd<bar>pbcopy)<CR> 
nnoremap  <Leader>co :!pwd<bar>pbcopy<CR> 

" Tagbar mapping key to F8 (tagbar activation)
" This will one a side bar having all the functions and variables for the code 
nmap <F8> :TagbarToggle<CR>

" For line indent 
" let g:indentLine_defaultGroup = 'SpecialKey'
" let g:indentLine_setColors = 0
" let g:indentLine_color_term = 239
" let g:indentLine_color_term = 126
" Background (Vim, GVim)
" let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FF5F00'

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Kite supported languages
" Python, JavaScript, Go
let g:kite_supported_languages = ['python', 'javascript', 'go']
" This code below will disable kite and use the lsp or coc instead
" let g:kite_completions=0

" To make the pydocstring format confirms to the numpy
let g:pydocstring_formatter = 'numpy'

" let g:vimspector_enable_mappings = 'HUMAN'


" set rtp+=/usr/local/opt/fzf

