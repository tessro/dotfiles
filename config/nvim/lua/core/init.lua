vim.opt.updatetime = 100

-- Display
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.tabstop = 2

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
vim.cmd("colorscheme catppuccin")

-- The `vim.fn.expand` is there to support Windows (I haven't checked if Telescope actually needs this)
vim.keymap.set("n", "<Leader>sd", ":Telescope find_files cwd=" .. vim.fn.expand("~/.dotfiles") .. "<cr>")
vim.keymap.set("n", "<Leader>sv", ":Telescope find_files cwd=" .. vim.fn.expand("~/.config/nvim") .. "<cr>")
vim.keymap.set("n", "<C-P>", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<Leader>gr", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<Leader>sb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<Leader>sh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<Leader>gb", "<cmd>BlameToggle window<cr>")
vim.keymap.set("n", "<Leader>tb", "<cmd>BlameToggle virtual<cr>")
vim.keymap.set("n", "<space><space>", "<cmd>Telescope buffers<cr>")

-- Buffer navigation
vim.keymap.set("n", "<TAB>", ":bnext<CR>")
vim.keymap.set("n", "<S-TAB>", ":bprev<CR>")

-- Split-screen navigation
vim.keymap.set("", "<C-J>", "<C-W>j")
vim.keymap.set("", "<C-K>", "<C-W>k")
vim.keymap.set("", "<C-H>", "<C-W>h")
vim.keymap.set("", "<C-L>", "<C-W>l")
vim.opt.wmh = 0 -- Allow splits to be zero-height

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Avoid showing extra messages when using completion
vim.opt.shortmess:append("c")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "dm", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
