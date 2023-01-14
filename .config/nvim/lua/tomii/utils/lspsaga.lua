-- Lspsaga configuration
local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	print("ERROR: lspsaga is not available. Called from lspsaga.lua")
	return
end

lspsaga.setup({
	ui = {
		-- currently only round theme
		theme = "round",
		-- border type can be single,double,rounded,solid,shadow.
		border = "solid",
		winblend = 20,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = " ",
		diagnostic = "🪲",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal background color
			normal_bg = "#002b36",
			--title background color
			title_bg = "#255667",
			red = "#dc322f",
			magenta = "#d33682",
			orange = "#cb4b16",
			yellow = "#f7bb3b",
			green = "#719e07",
			cyan = "#2aa198",
			blue = "#268bd2",
			purple = "#6c71c4",
			white = "#d1d4cf",
			black = "#1c1c19",
		},
		kind = {},
	},
})
