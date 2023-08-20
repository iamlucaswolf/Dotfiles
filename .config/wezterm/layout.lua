local module = {}

function module.apply(config)
  config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
  config.window_padding = {
    left = '32pt',
    right = '32pt',
    top = '40pt',
    bottom = '16pt',
  }

  config.tab_bar_at_bottom = true
  config.use_fancy_tab_bar = false
  config.show_new_tab_button_in_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = true

  config.audible_bell = 'Disabled'
end

return module
