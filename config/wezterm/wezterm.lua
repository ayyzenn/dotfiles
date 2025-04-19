local wezterm = require 'wezterm'

return {
  -- Font settings
  font_size = 11,  -- Slightly increased for better readability

  -- Colors and Transparency
  -- color_scheme = "Molokai",
  -- color_scheme = "Catppuccin Mocha",
  color_scheme = "Monokai (Gogh)",
  window_background_opacity = 0.5,  -- Adjust transparency (0.0 = fully transparent, 1.0 = opaque)

  -- Cursor settings 
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 500,  -- Cursor blink speed (milliseconds)
  cursor_thickness = 4.0,  -- Cursor thickness

  -- Custom cursor color
  colors = {
    cursor_bg = "#00ffcc",  -- Neon cyan cursor
    cursor_border = "#00ffcc",
    cursor_fg = "#1a1a1a",  -- Dark cursor text for contrast
  },

  -- Padding for a clean look
  window_padding = {
    left = 5, right = 5, top = 5, bottom = 5
  },

  -- Hide tab bar if only one tab
  hide_tab_bar_if_only_one_tab = true,

  -- Enable rounded corners and visible borders
  window_decorations = "TITLE | RESIZE", -- Adds title bar + resizable border

  -- GPU acceleration for smoother rendering
  front_end = "OpenGL",

  -- Keybindings
  keys = {
    -- Open a new tab
    { key = "T", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

    -- Close current tab (with confirmation)
    { key = "W", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab{confirm=true} },
}
}
