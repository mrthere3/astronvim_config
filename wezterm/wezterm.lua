local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

if string.find(wezterm.target_triple, "windows") then
	config.default_domain = "WSL:Arch"
end

--Colors & Appearance
-- config.color_scheme = "Arthur"
config.color_scheme = "Snazzy (Gogh)"

config.use_fancy_tab_bar = false
config.enable_tab_bar = true
config.show_tab_index_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false

config.window_padding = {
	left = 10,
	right = 0,
	top = 20,
	bottom = 0,
}

config.font_size = 20
config.keys = {
	{
		key = "C",
		mods = "CTRL",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
	{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "X", mods = "CTRL", action = wezterm.action.ActivateCopyMode },
}

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

config.window_background_opacity = 0.9
config.text_background_opacity = 0.3
-- Fonts
config.font = wezterm.font_with_fallback({
	{
		family = "CodeNewRoman Nerd Font Mono",
		scale = 1.25,
		weight = "Medium",
		-- italic = true,
		-- => != !==
		-- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
	},
})

-- Key Bingding

local act = wezterm.action

config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "r", mods = "SUPER", action = act.ReloadConfiguration },
	{ key = "Q", mods = "CTRL", action = act.QuitApplication },
	-- tab
	{ key = "n", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "RightArrow", mods = "ALT", action = act.ActivateTabRelative(1) },
	{ key = "LeftArrow", mods = "ALT", action = act.ActivateTabRelative(-1) },
	{ key = "m", mods = "ALT", action = act.ToggleFullScreen },
	-- move tab
	{ key = "]", mods = "ALT", action = act.MoveTabRelative(1) },
	{ key = "[", mods = "ALT", action = act.MoveTabRelative(-1) },

	-- window
	{ key = "N", mods = "ALT", action = act.SpawnWindow },

	-- font size
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },

	--panel
	{ key = "v", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },

	{ key = "LeftArrow", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "DownArrow", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "UpArrow", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "RightArrow", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "z", mods = "CTRL", action = act.TogglePaneZoomState },

	{ key = "h", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 5 }) },
	{ key = "j", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 5 }) },

	{ key = "\\", mods = "ALT", action = act.QuickSelect },

	{ key = "f", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "m", mods = "CTRL", action = act.Hide },
	{ key = "P", mods = "CTRL", action = act.ActivateCommandPalette },
}

-- Mouse Bingding
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
}

-- event: gui-startup
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():set_inner_size(1000, 600)
	-- window:gui_window():maximize()
	window:gui_window():set_position(100, 100)
end)

-- event: update-status
config.status_update_interval = 1000
wezterm.on("update-status", function(window)
	local date = wezterm.strftime("%b %-d %H:%M ")

	-- local bat_str = ''

	-- for _, bat in ipairs(wezterm.battery_info()) do
	--   bat_str = bat_str .. string.format('%.0f%%', bat.state_of_charge * 100)
	-- end

	window:set_right_status(wezterm.format({
		{ Text = " " },
		{ Foreground = { Color = "#74c7ec" } },
		{ Background = { Color = "rgba(0,0,0,0.4)" } },
		{ Attribute = { Intensity = "Bold" } },
		{ Text = wezterm.nerdfonts.fa_calendar .. " " .. date },
		{ Text = " " },
	}))
end)

-- event: format-tab-title

wezterm.on("format-tab-title", function(tab, _, _, _, _)
	-- i do not like how i can basically hide tabs if i zoom in
	local is_zoomed = ""
	if tab.active_pane.is_zoomed then
		is_zoomed = "z"
	end

	return {
		{ Text = " " .. tab.tab_index + 1 .. is_zoomed .. " " },
	}
end)

return config
