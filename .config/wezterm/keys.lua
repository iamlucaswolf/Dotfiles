local wezterm = require 'wezterm'

local module = {}

local function move_pane(key, direction)
  return {
    key = key,
    mods = 'SUPER',
    action = wezterm.action.ActivatePaneDirection(direction),
  }
end

local function resize_pane(key, direction)
  return {
    key = key,
    mods = 'SHIFT|SUPER',
    action = wezterm.action.AdjustPaneSize { direction, 3 },
  }
end

local function activate_tab(key)
  return {
    key = tostring(key),
    mods = 'SUPER',
    action = wezterm.action.ActivateTab(key - 1),
  }
end

function module.apply(config)
  config.disable_default_key_bindings = true

  config.keys = {
    
    -- Copy/Paste
    { key = 'c', mods = 'SUPER', action = wezterm.action.CopyTo('Clipboard') },
    { key = 'v', mods = 'SUPER', action = wezterm.action.PasteFrom('Clipboard') },

    -- Zoom
    { key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
    { key = '=', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },

    -- Windows
    { key = 'n', mods = 'SUPER', action = wezterm.action.SpawnWindow },
    { key = 'q', mods = 'SUPER', action = wezterm.action.QuitApplication },

    -- Tabs
    {
      key = 't',
      mods = 'SUPER',
      action = wezterm.action.SpawnTab('CurrentPaneDomain'), 
    },

    {
      key = 'w',
      mods = 'SUPER',
      action = wezterm.action.CloseCurrentTab { confirm = false },
    },

    { key = '[', mods = 'SUPER', action = wezterm.action.ActivateTabRelative(-1) },
    { key = ']', mods = 'SUPER', action = wezterm.action.ActivateTabRelative(1) },
    { key = '{', mods = 'SHIFT|SUPER', action = wezterm.action.MoveTabRelative(-1) },
    { key = '}', mods = 'SHIFT|SUPER', action = wezterm.action.MoveTabRelative(1) },

    activate_tab(1),
    activate_tab(2),
    activate_tab(3),
    activate_tab(4),
    activate_tab(5),
    activate_tab(6),
    activate_tab(7),
    activate_tab(8),
    activate_tab(9), 

    -- Panes
    {
      key = [[\]],
      mods = 'SUPER',
      action = wezterm.action {
        SplitHorizontal = { domain = 'CurrentPaneDomain' },
      },
    },

    {
      key = [[-]],
      mods = 'SUPER',
      action = wezterm.action {
        SplitVertical = { domain = 'CurrentPaneDomain' },
      },
    },

    move_pane('LeftArrow', 'Left'),
    move_pane('RightArrow', 'Right'),
    move_pane('UpArrow', 'Up'),
    move_pane('DownArrow', 'Down'),

    resize_pane('LeftArrow', 'Left'),
    resize_pane('RightArrow', 'Right'),
    resize_pane('UpArrow', 'Up'),
    resize_pane('DownArrow', 'Down'),
  }
end

return module
