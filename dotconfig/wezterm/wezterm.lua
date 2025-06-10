local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 10
config.font = wezterm.font({ family = 'Iosevka Term Slab Medium' })
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.color_scheme = 'Gruvbox dark, soft (base16)'
config.window_padding = { top = 10, bottom = 0, left = 4, right = 0 }
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

config.keys = {
	{
		key = "q",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	}
}

wezterm.on("format-tab-title", function(tab)
	local title = tab.tab_title
	if title:match(wezterm.nerdfonts.fa_asterisk) then
		return "  " .. title .. "  "
	else
		return "  " .. tab.tab_index + 1 .. "  "
	end
end)

return config
