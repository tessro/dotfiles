local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

require('rust-tools').setup({
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
})

-- format-on-save callback
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- disable tsserver-based formatting (in favor of Prettier via `null-ls`)
      return client.name ~= "tsserver"
    end,
    bufnr = bufnr,
  })
end

-- format-on-save autocommand group
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- install lsp_formatting callback when supported by language server
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
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
  vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
end

--
-- null-ls
--
local null_ls = require('null-ls')
null_ls.setup({
  capabilities = capabilities,
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
  },
  on_attach = on_attach
})

lspconfig.prismals.setup({
  capabilities = capabilities,
})

--
-- Go
--

lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

--
-- Lua
--

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      format = {
        defaultConfig = {
          -- workaround for https://github.com/LuaLS/lua-language-server/issues/1068
          -- see if this is fixed in versions after 3.6.10
          continuation_indent = "2",
        }
      },
    },
  }
})

--
-- Python
--

lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    python = {
      venvPath = "~/.pyenv/versions",
    }
  }
})

lspconfig.ruff_lsp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

--
-- Rust
--

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

--
-- TOML
--

lspconfig.taplo.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

--
-- TypeScript
--

lspconfig.eslint.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gl', ':EslintFixAll<CR>', bufopts)

    on_attach(client, bufnr)
  end,
  root_dir = function(fname)
    return lspconfig.util.root_pattern(
      '.eslintrc.js',
      '.eslintrc.cjs',
      '.eslintrc.json'
    )(fname) or lspconfig.util.root_pattern('package.json')(fname)
  end,
})

local vtsls = require("vtsls")
-- set default server config, optional but recommended
require("lspconfig.configs").vtsls = vtsls.lspconfig

lspconfig.vtsls.setup({
  server = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', 'go', ':VtsExec add_missing_imports<CR>', bufopts)
      vim.keymap.set('n', 'gO', ':VtsExec organize_imports<CR>', bufopts)
      vim.keymap.set('n', 'gI', ':VtsExec rename_file<CR>', bufopts)

      on_attach(client, bufnr)
    end,
  }
})
