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

-- The `vim.fn.expand` is there to support Windows (I haven't checked if Telescope actually needs this)
vim.keymap.set('n', '<Leader>d', ':Telescope find_files cwd=' .. vim.fn.expand('~/.dotfiles') .. '<cr>')
vim.keymap.set('n', '<Leader>v', ':Telescope find_files cwd=' .. vim.fn.expand('~/.config/nvim') .. '<cr>')
vim.keymap.set('n', '<Leader>f', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<Leader>g', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<Leader>b', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<Leader>h', '<cmd>Telescope help_tags<cr>')

-- Split-screen navigation
vim.keymap.set('', '<C-J>', '<C-W>j')
vim.keymap.set('', '<C-K>', '<C-W>k')
vim.keymap.set('', '<C-H>', '<C-W>h')
vim.keymap.set('', '<C-L>', '<C-W>l')
vim.opt.wmh = 0 -- Allow splits to be zero-height

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append('c')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', 'dm', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
