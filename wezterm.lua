local wezterm = require 'wezterm'
local config = {}

-- use config_builder if available
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.front_end = 'WebGpu'
config.hide_tab_bar_if_only_one_tab = true

return config
