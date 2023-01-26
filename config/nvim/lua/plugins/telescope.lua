local telescope = require('telescope')

telescope.setup({
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
    find_files = {
      -- include non-`.gitignore`d dotfiles
      hidden = true,
      -- explicitly ignore `.git`, since it is not in `.gitignore`
      file_ignore_patterns = {
        '^.git/',
      },
    },
    help_tags = {
      layout_strategy = 'vertical',
    },
  },
})

telescope.load_extension('frecency')
telescope.load_extension('fzf')
