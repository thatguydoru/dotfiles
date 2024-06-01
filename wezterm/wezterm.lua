local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font({
  family = "Iosevka Term Nerd Font",
  weight = "DemiBold",
})
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font_size = 10

config.keys = {
  {
    key = "q",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    key = "t",
    mods = "SUPER|SHIFT",
    action = wezterm.action.ShowTabNavigator,
  },
  {
    key = "r",
    mods = "SUPER|SHIFT",
    action = wezterm.action.PromptInputLine({
      description = "New tab name " .. wezterm.nerdfonts.cod_edit,
      action = wezterm.action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(wezterm.nerdfonts.fa_asterisk .. " " .. line)
        end
      end)
    }),
  },
}

config.window_padding = {
  left = 4,
  right = 4,
  top = 8,
  bottom = 0,
}

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

wezterm.on("format-tab-title", function(tab)
  local title = tab.tab_title
  if title:match(wezterm.nerdfonts.fa_asterisk) then
    return "  " .. title .. "  "
  else
    return "  " .. tab.tab_index .. "  "
  end
end)

return config
