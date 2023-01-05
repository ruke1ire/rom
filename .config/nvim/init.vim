set shiftwidth=4
set expandtab
set smartindent
set smartcase
set incsearch
set number
set statusline+=\ %t%m
set clipboard=unnamedplus
set linebreak
set breakindent
set cursorline
set mouse=a
set noswapfile
set ignorecase
set smartcase
set scrolloff=8
set hidden
set signcolumn=yes
set autochdir
set nonumber
set splitright
set guifont=Comic\ Code:h12

let s:guifontsize=12
let s:guifont="Comic\\ Code"

function! AdjustFontSize(amount)
    let s:guifontsize = s:guifontsize + a:amount
    execute "set guifont=" .. s:guifont .. ":h" .. s:guifontsize
endfunction

nnoremap <C-+> <cmd>call AdjustFontSize(+1)<cr>
nnoremap <C--> <cmd>call AdjustFontSize(-1)<cr>

call plug#begin('~/.config/nvim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }
Plug 'ggandor/lightspeed.nvim'
Plug 'ojroques/vim-oscyank'
call plug#end()

"lua nvim-lsp
lua << EOF
-- your lua code here

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "python", "html"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    enable = true,
  },
  indent = {
    enable = false,
  }
}

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {

        -- ... Your other configuration ...

        ['<C-Space>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item()
      },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
}
require'lspconfig'.clangd.setup{
    capabilities = capabilities,
}
require'lspconfig'.arduino_language_server.setup{
    capabilities = capabilities,
}
require'lspconfig'.cmake.setup{
    capabilities = capabilities,
}
require'lspconfig'.cssls.setup{
    capabilities = capabilities,
}
require'lspconfig'.dockerls.setup{
    capabilities = capabilities,
}
require'lspconfig'.html.setup{
    capabilities = capabilities,
}
require'lspconfig'.jsonls.setup{
    capabilities = capabilities,
}
require'lspconfig'.ltex.setup{
    capabilities = capabilities,
}
require'lspconfig'.prosemd_lsp.setup{
    capabilities = capabilities,
}
require'lspconfig'.tsserver.setup{

    capabilities = capabilities,
}
require'lspconfig'.vimls.setup{
    capabilities = capabilities,
}
require'lspconfig'.yamlls.setup{
    capabilities = capabilities,
}


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

local actions = require("telescope.actions")

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

require'lightspeed'.setup {
  ignore_case = true,
  exit_after_idle_msecs = { unlabeled = 1000, labeled = 2000 },
  --- s/x ---
  jump_to_unique_chars = { safety_timeout = 400 },
  match_only_the_start_of_same_char_seqs = true,
  force_beacons_into_match_width = false,
  -- Display characters in a custom way in the highlighted matches.
  substitute_chars = { 
      ['\r'] = '¬', 
      },
  --- f/t ---
  limit_ft_matches = 8,
  repeat_ft_with_target_char = false,
}

require('scrollview').setup({
  excluded_filetypes = {'nerdtree'},
  current_only = true,
  winblend = 80,
})

vim.api.nvim_set_keymap('', 'm', '<Plug>Lightspeed_s', {})
vim.api.nvim_set_keymap('', 'M', '<Plug>Lightspeed_S', {})

--vim.cmd('unmap s')
--vim.cmd('unmap S')

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
"hi Normal guibg=NONE ctermbg=NONE
"highlight clear LineNr
highlight clear SignColumn
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

" Telescope keybindings
nnoremap <leader>ff <cmd>Telescope find_files hidden=true no_ignore=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" LSP keybindings
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap gw <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap gw <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap gr <cmd>lua vim.lsp.buf.references()<cr>
nnoremap gt <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <c-k> <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>af <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>e <cmd>lua vim.diagnostic.open_float()<cr>

" For :terminal
tnoremap <Esc> <C-\><C-n>
map <leader>T :vsplit \| terminal<cr>

" for yank ssh
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | OSCYankReg " | endif

" Unmap ctrl a, ctrl x
map <C-a> <Nop>
map <C-x> <Nop>
