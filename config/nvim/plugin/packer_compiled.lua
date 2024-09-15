-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
<<<<<<< HEAD
local package_path_str = "/home/paul/.cache/nvim/packer_hererocks/2.1.1697887905/share/lua/5.1/?.lua;/home/paul/.cache/nvim/packer_hererocks/2.1.1697887905/share/lua/5.1/?/init.lua;/home/paul/.cache/nvim/packer_hererocks/2.1.1697887905/lib/luarocks/rocks-5.1/?.lua;/home/paul/.cache/nvim/packer_hererocks/2.1.1697887905/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/paul/.cache/nvim/packer_hererocks/2.1.1697887905/lib/lua/5.1/?.so"
=======
local package_path_str = "/Users/tess/.cache/nvim/packer_hererocks/2.1.1725453128/share/lua/5.1/?.lua;/Users/tess/.cache/nvim/packer_hererocks/2.1.1725453128/share/lua/5.1/?/init.lua;/Users/tess/.cache/nvim/packer_hererocks/2.1.1725453128/lib/luarocks/rocks-5.1/?.lua;/Users/tess/.cache/nvim/packer_hererocks/2.1.1725453128/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tess/.cache/nvim/packer_hererocks/2.1.1725453128/lib/lua/5.1/?.so"
>>>>>>> fbdd94c (nvim: update plugins)
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["cmp-buffer"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/cmp-buffer",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/cmp-buffer",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/cmp-path",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/cmp-path",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["copilot-cmp"] = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.copilot_cmp\frequire\0" },
    load_after = {
      ["copilot.lua"] = true
    },
    loaded = false,
    needs_bufread = false,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.copilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/opt/copilot.lua",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/opt/copilot.lua",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.mini\frequire\0" },
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/mini.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/mini.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/echasnovski/mini.nvim"
  },
  neovim = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/neovim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/neovim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/rose-pine/neovim"
  },
  ["nord-vim"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/nord-vim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/nord-vim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.cmp\frequire\0" },
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/nvim-cmp",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/nvim-cmp",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-vtsls"] = {
    loaded = true,
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/nvim-vtsls",
    url = "https://github.com/yioneko/nvim-vtsls"
  },
  ["packer.nvim"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/packer.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/packer.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/plenary.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/plenary.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/popup.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/popup.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/sqlite.lua",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/sqlite.lua",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/kkharji/sqlite.lua"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/telescope.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/telescope.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.toggleterm\frequire\0" },
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
<<<<<<< HEAD
  ["typescript.nvim"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/typescript.nvim",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/typescript.nvim",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
=======
>>>>>>> 9c45334 (nvim: replace typescript.nvim with vtsls/nvim-vtsls)
  ["vim-just"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/vim-just",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/vim-just",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/NoahTheDuke/vim-just"
  },
  ["vim-vsnip"] = {
    loaded = true,
<<<<<<< HEAD
    path = "/home/paul/.local/share/nvim/site/pack/packer/start/vim-vsnip",
=======
    path = "/Users/tess/.local/share/nvim/site/pack/packer/start/vim-vsnip",
>>>>>>> fbdd94c (nvim: update plugins)
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
<<<<<<< HEAD
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
=======
>>>>>>> fbdd94c (nvim: update plugins)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.mini\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
<<<<<<< HEAD
=======
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
<<<<<<< HEAD
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
>>>>>>> fbdd94c (nvim: update plugins)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
=======
>>>>>>> 9c45334 (nvim: replace typescript.nvim with vtsls/nvim-vtsls)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
<<<<<<< HEAD
=======
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
>>>>>>> 9c45334 (nvim: replace typescript.nvim with vtsls/nvim-vtsls)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
<<<<<<< HEAD
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
=======
>>>>>>> 9c45334 (nvim: replace typescript.nvim with vtsls/nvim-vtsls)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
