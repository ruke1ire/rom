set shiftwidth=4
set expandtab
set smartindent
set smartcase
set incsearch
"set colorcolumn=80
set number
set statusline+=\ %t%m
set clipboard=unnamedplus
set linebreak
set breakindent
set cursorline
set mouse=a
set noswapfile
"set nohlsearch
"set nowrap
set autochdir
set ignorecase
set smartcase
set scrolloff=8
set relativenumber
set hidden

call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
call plug#end()

"lua nvim-lsp
lua << EOF
-- your lua code here
require("nvim-lsp-installer").setup {}
require'lspconfig'.pyright.setup{}
EOF

autocmd StdinReadPre * let s:std_in=1
"automatically start nerd tree when no file has been specified
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"automatically starts nerdtree upon start
"autocmd vimenter * NERDTreeFind
"close nerdtree if it's the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
										
colorscheme gruvbox

"setting things to be transparent
hi Normal guibg=NONE ctermbg=NONE
"highlight clear LineNr
"highlight clear SignColumn
"hi StatusLine ctermbg=NONE cterm=NONE

"let &showbreak='->'
let mapleader = " "
"let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 22 

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

map <Enter> o<ESC>
map <S-Enter> O<ESC>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>H :wincmd H<CR>
nnoremap <leader>J :wincmd J<CR>
nnoremap <leader>K :wincmd K<CR>
nnoremap <leader>L :wincmd L<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <Leader>v :NERDTreeFind<CR>
nnoremap <leader>n :tabnext<CR>
nnoremap <leader>p :tabprev<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>q :quit<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

