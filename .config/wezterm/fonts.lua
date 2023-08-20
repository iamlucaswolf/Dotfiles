local wezterm = require 'wezterm'

local module = {}

function module.apply(config)
  config.font = wezterm.font('JetBrains Mono')
  config.font_size = 12
  config.line_height = 1.1
end

return module 
