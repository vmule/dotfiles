--@type ChadrcConfig

vim.api.nvim_set_hl(0, "Comment", { fg = "#f0efe9", italic = true })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#abe9b3", bold = true })
vim.api.nvim_set_hl(0, "St_gitIcons", { fg = "#abe9b3" })
vim.api.nvim_set_hl(0, "StText", { fg = "white", italic = true })

-- LineNr colors
vim.api.nvim_set_hl(0, "LineNr", { fg = "#f0efe9" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "red", bold = true, italic = true })

local M = {}

M.highlights = require("custom.highlights")
M.mappings = require("custom.mappings")
M.options = require("custom.options")
M.plugins = "custom.plugins"

M.ui = {
	theme = "catppuccin",
	transparency = false,

	telescope = {
		style = "bordered",
		-- borderless / bordered
	},

	statusline = {
		theme = "vscode_colored",
		-- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
	},
}

return M
