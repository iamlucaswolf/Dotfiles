local wezterm = require 'wezterm'

local fonts = require 'fonts'
local layout = require 'layout'
local colors = require 'colors'
local keys = require 'keys'

local config = wezterm.config_builder()

config.audible_bell = "Disabled"

fonts.apply(config)
layout.apply(config)
colors.apply(config)
keys.apply(config)

return config

