local wezterm = require("wezterm")

return {
	hide_tab_bar_if_only_one_tab = true,
	font_size = 12.0,

	inactive_pane_hsb = {
		brightness = 1.0,
	},
	color_scheme = "Catppuccin Mocha",

	keys = {
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "RightArrow", mods = "OPT", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "UpArrow", mods = "OPT", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "DownArrow", mods = "OPT", action = wezterm.action.ActivatePaneDirection("Down") },

		{ key = "v", mods = "OPT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "OPT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "t", mods = "OPT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

		{ key = "LeftArrow", mods = "SHIFT|OPT", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "RightArrow", mods = "SHIFT|OPT", action = wezterm.action.ActivateTabRelative(1) },

		{ key = "LeftArrow", mods = "CTRL|SHIFT|OPT", action = wezterm.action.AdjustPaneSize({ "Left", 10 }) },
		{ key = "RightArrow", mods = "CTRL|SHIFT|OPT", action = wezterm.action.AdjustPaneSize({ "Right", 10 }) },
		{ key = "UpArrow", mods = "CTRL|SHIFT|OPT", action = wezterm.action.AdjustPaneSize({ "Up", 10 }) },
		{ key = "DownArrow", mods = "CTRL|SHIFT|OPT", action = wezterm.action.AdjustPaneSize({ "Down", 10 }) },
	},
}

