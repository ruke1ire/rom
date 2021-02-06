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
set nohlsearch
"set nowrap
set autochdir
set ignorecase
set smartcase

call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
"Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

autocmd StdinReadPre * let s:std_in=1
"automatically start nerd tree when no file has been specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
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
nnoremap <leader>w :update<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Files ~<CR>
nnoremap <leader>b :Buffers<CR>

" coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType python let b:coc_root_patterns = ['git.','.env']
