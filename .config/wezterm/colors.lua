local wezterm = require 'wezterm'

local module = {}

local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'GitHub Dark'
  else
    return 'GitHub'
  end
end

local function fix_tab_bar(scheme)
  scheme.tab_bar = {
    background = scheme.background,
    active_tab = {
      bg_color = 'none',
      fg_color = scheme.foreground,
      intensity = 'Bold',
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = scheme.background,
      fg_color = scheme.cursor_bg, 
    },
  }
end

local light_scheme = wezterm.get_builtin_color_schemes()['Github']
fix_tab_bar(light_scheme)

local dark_scheme = wezterm.get_builtin_color_schemes()['GitHub Dark']
fix_tab_bar(dark_scheme)

function module.apply(config)
  config.color_schemes = {
    ['GitHub'] = light_scheme,
    ['GitHub Dark'] = dark_scheme,
  }
  config.color_scheme = scheme_for_appearance(get_appearance())
end

return module
