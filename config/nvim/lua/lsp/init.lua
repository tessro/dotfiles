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

-- this callback is invoked on attach, when the client supports formatting
local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- disable tsserver-based formatting (in favor of Prettier via `null-ls`)
            return client.name ~= "tsserver"
        end,
        bufnr = bufnr,
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

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

end

lspconfig.gopls.setup({
  on_attach = on_attach,
})

lspconfig.prismals.setup({})

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
})

lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
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

local null_ls = require('null-ls')
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
    },
    on_attach = on_attach
})
