local indent_blankline_ok, indent_blankline = pcall(require, "ibl")
if not indent_blankline_ok then
	print("ERROR: indent_blankline not found. Called from theme.lua")
	return
end
local hooks = require("ibl.hooks")

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({ indent = { highlight = highlight } })

-- Indentations
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

-- local highlight = {
-- 	"CursorColumn",
-- 	"Whitespace",
-- }
-- indent_blankline.setup({
-- 	indent = { highlight = highlight, char = "" },
-- 	whitespace = {
-- 		highlight = highlight,
-- 		remove_blankline_trail = false,
-- 	},
-- 	scope = { enabled = false },
-- })
