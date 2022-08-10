vim.call('plug#begin')
local Plug = vim.fn['plug#']

-- Many utilities
Plug 'echasnovski/mini.nvim'

-- Fuzzy find
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'})

-- Git
Plug 'airblade/vim-gitgutter'

-- Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- TypeScript
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

-- Completion framework
Plug 'hrsh7th/nvim-cmp'

-- LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

-- Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

-- Other useful completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

-- See hrsh7th's other plugins for more completion sources!

-- To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

-- Snippet engine
Plug 'hrsh7th/vim-vsnip'

-- Fuzzy finder
-- Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tami5/sqlite.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'

-- Color scheme used in the GIFs!
Plug 'arcticicestudio/nord-vim'

vim.call('plug#end')

vim.opt.updatetime = 100

-- Display
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.relativenumber = true

-- Editing
vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Theme
vim.opt.termguicolors = true
vim.cmd('colorscheme nord')

-- Leader bindings
vim.g.mapleader = ','
vim.keymap.set('n', '<Leader>v', ':e $MYVIMRC<CR>')
vim.keymap.set('n', '<Leader>f', '<cmd>Telescope git_files<cr>')
--nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
vim.keymap.set('n', '<Leader>b', '<cmd>Telescope buffers<cr>')
--nnoremap <Leader>fh <cmd>Telescope help_tags<cr>

-- Split-screen navigation
vim.keymap.set('', '<C-J>', '<C-W>j')
vim.keymap.set('', '<C-K>', '<C-W>k')
vim.keymap.set('', '<C-H>', '<C-W>h')
vim.keymap.set('', '<C-L>', '<C-W>l')
vim.opt.wmh = 0 -- Allow splits to be zero-height

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

require('mini.pairs').setup()
require('mini.sessions').setup()
require('mini.surround').setup({
  mappings = {
    add = 'S',
    delete = 'ds',
    find = '',
    find_left = '',
    highlight = '',
    replace = 'cs',
    update_n_lines = '',
  }
})

local telescope = require('telescope')
telescope.load_extension('frecency')
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = 'close',
      },
    },
  },
  pickers = {
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
    },
  },
}

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.opt.completeopt = 'menuone,noinsert,noselect'

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append('c')

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

local opts = {
    -- rust-tools
    tools = {
        autoSetHints = true,
    },

    -- nvim-lspconfig
    server = {
        settings = {
            ['rust-analyzer'] = {
                checkOnSave = {
                    command = 'clippy'
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'dm', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
    -- vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    -- vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.rename, bufopts)
    -- vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('i', '<C-x><C-x>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

lspconfig.prismals.setup({})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
})

lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        -- disable formatting, we'll use Prettier
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)

        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gs', ':TSLspOrganize<CR>', bufopts)
        vim.keymap.set('n', 'gi', ':TSLspRenameFile<CR>', bufopts)
        vim.keymap.set('n', 'go', ':TSLspImportAll<CR>', bufopts)

        on_attach(client, bufnr)
    end,
})

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
            prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.code_actions.eslint_d.with({
            prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.formatting.prettier.with({
            prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "sqlite" },
        }),
    },
    on_attach = on_attach
})

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

-- Setup Treesitter
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "c",
    "css",
    "dockerfile",
    "go",
    "graphql",
    "html",
    "json",
    "lua",
    "make",
    "prisma",
    "python",
    "rust",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    --disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
