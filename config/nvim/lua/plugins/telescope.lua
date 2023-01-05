require('telescope').setup({
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
    help_tags = {
      layout_strategy = 'vertical',
    },
  },
})
